#!/usr/bin/env bash
# autogenerate.sh — Generate recall benchmark test cases
# Picks random memories, asks opus to craft a related user prompt,
# and validates which memories are genuinely relevant.

set -euo pipefail

AGENT_DIR="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}"
BENCH_DIR="$(cd "$(dirname "$0")" && pwd)"
TESTS_DIR="${BENCH_DIR}/tests"
MEMORY_DIR="${AGENT_DIR}/memory"

# --- Defaults ---
SAMPLES=1
AMOUNT=""
NAME=""

# --- Parse arguments ---
while [[ $# -gt 0 ]]; do
  case "$1" in
    --samples)  SAMPLES="$2";  shift 2 ;;
    --amount)   AMOUNT="$2";   shift 2 ;;
    --name)     NAME="$2";     shift 2 ;;
    *)
      echo "Unknown option: $1" >&2
      echo "Usage: $0 [--samples N] [--amount N] [--name STR]" >&2
      exit 1
      ;;
  esac
done

# --- Validate ---
if ! command -v claude &>/dev/null; then
  echo "Error: claude CLI not found" >&2
  exit 1
fi

MEMORY_FILES=( "$MEMORY_DIR"/*.md )
if [[ ${#MEMORY_FILES[@]} -eq 0 ]]; then
  echo "Error: no memory files found in $MEMORY_DIR" >&2
  exit 1
fi

TOTAL_MEMORIES=${#MEMORY_FILES[@]}

mkdir -p "$TESTS_DIR"

# --- Generate samples ---
for (( i=1; i<=SAMPLES; i++ )); do
  # Determine amount for this sample
  if [[ -n "$AMOUNT" ]]; then
    COUNT="$AMOUNT"
  else
    COUNT=$(( (RANDOM % 5) + 1 ))
  fi

  # Clamp to available memories
  if (( COUNT > TOTAL_MEMORIES )); then
    COUNT=$TOTAL_MEMORIES
  fi

  # Pick random memories
  PICKED=()
  INDICES=()
  while (( ${#PICKED[@]} < COUNT )); do
    IDX=$(( RANDOM % TOTAL_MEMORIES ))
    # Check for duplicates
    DUPE=0
    for existing in "${INDICES[@]+"${INDICES[@]}"}"; do
      if [[ "$existing" == "$IDX" ]]; then
        DUPE=1
        break
      fi
    done
    if (( DUPE == 0 )); then
      INDICES+=("$IDX")
      PICKED+=("${MEMORY_FILES[$IDX]}")
    fi
  done

  # Build the memory contents for the agent
  MEMORY_BLOCK=""
  MEMORY_NAMES=()
  for mem in "${PICKED[@]}"; do
    BASENAME=$(basename "$mem")
    MEMORY_NAMES+=("memory/${BASENAME}")
    CONTENT=$(cat "$mem")
    MEMORY_BLOCK="${MEMORY_BLOCK}
<memory file=\"memory/${BASENAME}\">
${CONTENT}
</memory>
"
  done

  # Ask opus to generate a user prompt with self-validation
  QUERY="You are generating test data for a memory recall benchmark. You will receive ${COUNT} memories from a user's personal memory system. Each memory stores info about the user's tools, configurations, projects, or preferences.

Write a realistic user prompt (1-3 sentences) that someone would type into a coding assistant, where the given memories would be genuinely useful context for answering.

Rules:
- Sound natural — like a real person typing into a CLI assistant
- Don't mention memory filenames or the memory system
- Don't force connections that aren't there

After writing the prompt, list ONLY the memories that are genuinely relevant to it. If some memories can't be naturally connected to a single prompt, exclude them — accuracy matters more than including everything.

Output format (follow EXACTLY, no extra text):
[prompt]
<the user prompt>

[relevant]
<one memory filename per line, only those truly relevant>
${MEMORY_BLOCK}"

  echo "[${i}/${SAMPLES}] Generating prompt from ${COUNT} memories..."

  STDERR_LOG=$(mktemp)
  GENERATED=$(echo "$QUERY" | (cd /tmp && AGENT_HOOK_ID="" BLOCK_HOOK_AGENTS=1 claude -p \
    --model opus \
    --max-turns 1 \
    --tools "" \
    --no-session-persistence \
    --system-prompt "" \
    2>"$STDERR_LOG")) || {
    echo "Error: claude -p failed (exit $?)" >&2
    cat "$STDERR_LOG" >&2
    rm -f "$STDERR_LOG"
    continue
  }
  rm -f "$STDERR_LOG"

  if [[ -z "$GENERATED" || "$GENERATED" =~ ^[[:space:]]*$ ]]; then
    echo "Warning: empty response from agent, skipping sample ${i}" >&2
    continue
  fi

  # --- Parse opus response: extract [prompt] and [relevant] sections ---
  SECTION=""
  PROMPT_TEXT=""
  RELEVANT=()

  while IFS= read -r line; do
    if [[ "$line" == "[prompt]" ]]; then
      SECTION="prompt"
      continue
    elif [[ "$line" == "[relevant]" ]]; then
      SECTION="relevant"
      continue
    fi

    case "$SECTION" in
      prompt)
        line_trimmed=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        if [[ -n "$line_trimmed" ]]; then
          if [[ -n "$PROMPT_TEXT" ]]; then
            PROMPT_TEXT="${PROMPT_TEXT}
${line_trimmed}"
          else
            PROMPT_TEXT="$line_trimmed"
          fi
        fi
        ;;
      relevant)
        line_trimmed=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        [[ -n "$line_trimmed" ]] && RELEVANT+=("$line_trimmed")
        ;;
    esac
  done <<< "$GENERATED"

  if [[ -z "$PROMPT_TEXT" ]]; then
    echo "Warning: could not parse prompt from response, skipping sample ${i}" >&2
    echo "  Response was: ${GENERATED:0:200}" >&2
    continue
  fi

  if [[ ${#RELEVANT[@]} -eq 0 ]]; then
    echo "Warning: no relevant memories in response, skipping sample ${i}" >&2
    continue
  fi

  # Validate relevant memories exist in the picked set
  VALIDATED=()
  for rel in "${RELEVANT[@]}"; do
    for name in "${MEMORY_NAMES[@]}"; do
      if [[ "$rel" == "$name" ]]; then
        VALIDATED+=("$rel")
        break
      fi
    done
  done

  if [[ ${#VALIDATED[@]} -eq 0 ]]; then
    echo "Warning: none of the relevant memories matched picked set, skipping sample ${i}" >&2
    continue
  fi

  # Determine filename
  if [[ -n "$NAME" ]]; then
    if (( SAMPLES > 1 )); then
      BENCH_FILE="${TESTS_DIR}/${NAME}-$(printf '%03d' "$i").bench"
    else
      BENCH_FILE="${TESTS_DIR}/${NAME}.bench"
    fi
  else
    BENCH_ID=$(openssl rand -hex 4)
    BENCH_FILE="${TESTS_DIR}/${BENCH_ID}.bench"
  fi

  # Write .bench file
  {
    echo "# Recall Benchmark Test"
    echo "# Generated: $(date -Iseconds)"
    echo "# Picked: ${COUNT}"
    echo "# Expected: ${#VALIDATED[@]}"
    echo ""
    echo "[expected]"
    for name in "${VALIDATED[@]}"; do
      echo "$name"
    done
    echo ""
    echo "[prompt]"
    echo "$PROMPT_TEXT"
  } > "$BENCH_FILE"

  echo "  -> ${BENCH_FILE} (${#VALIDATED[@]}/${COUNT} memories validated)"
done

echo "Done. Generated ${SAMPLES} benchmark file(s) in ${TESTS_DIR}/"
