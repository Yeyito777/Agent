#!/usr/bin/env bash
# recall.sh — Configurable recall agent
# Supports single-pass and double-pass (two-pass) recall schemes.
# Configuration is read from agent.conf:
#   MEMORY_RECALL_SCHEME=single|double
#   MEMORY_RECALL_MODELS=model1/model2
#   MEMORY_RECALL_PROMPTS=prompt1/prompt2
# Receives a user prompt on stdin, outputs recalled memory filenames to stdout.
# This is the source of truth for recall logic — used by the hook and benchmarks.

set -euo pipefail

AGENT_DIR="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/.." && pwd)}"
MEMORY_DIR="${AGENT_DIR}/memory"
CONF="${AGENT_DIR}/agent.conf"

# --- Read prompt from stdin ---
PROMPT=$(cat)
if [[ -z "$PROMPT" || "$PROMPT" =~ ^[[:space:]]*$ ]]; then
  exit 0
fi

# --- Check dependencies ---
if ! command -v claude &>/dev/null; then
  echo "Error: claude CLI not found" >&2
  exit 1
fi

# --- Read config from agent.conf ---
SCHEME=$(grep '^MEMORY_RECALL_SCHEME=' "$CONF" 2>/dev/null | cut -d= -f2 || true)
SCHEME="${SCHEME:-double}"

MODELS=$(grep '^MEMORY_RECALL_MODELS=' "$CONF" 2>/dev/null | cut -d= -f2 || true)
MODELS="${MODELS:-opus/opus}"
MODEL1="${MODELS%%/*}"
MODEL2="${MODELS##*/}"

PROMPTS=$(grep '^MEMORY_RECALL_PROMPTS=' "$CONF" 2>/dev/null | cut -d= -f2 || true)
PROMPTS="${PROMPTS:-v5-pass1/v5-pass2}"
PROMPT1_NAME="${PROMPTS%%/*}"
PROMPT2_NAME="${PROMPTS##*/}"

PRESEARCH=$(grep '^MEMORY_RECALL_PRESEARCH=' "$CONF" 2>/dev/null | cut -d= -f2 || true)
PRESEARCH="${PRESEARCH:-off}"

PRESEARCH_CONTENT=$(grep '^MEMORY_RECALL_PRESEARCH_CONTENT=' "$CONF" 2>/dev/null | cut -d= -f2 || true)
PRESEARCH_CONTENT="${PRESEARCH_CONTENT:-off}"

# --- Optional logging (only if hook log file exists) ---
RECALL_LOG=""
if [[ -n "${AGENT_HOOK_ID:-}" ]]; then
  _LOG="${AGENT_DIR}/runtime/hook-${AGENT_HOOK_ID}.log"
  [[ -f "$_LOG" ]] && RECALL_LOG="$_LOG"
fi
rlog() { [[ -n "$RECALL_LOG" ]] && echo "[$(date +%H:%M:%S)] [recall] $*" >> "$RECALL_LOG" || true; }

# --- Load prompt files ---
PROMPT1_FILE="${AGENT_DIR}/prompts/${PROMPT1_NAME}.md"
if [[ ! -f "$PROMPT1_FILE" ]]; then
  echo "Error: prompt file not found: ${PROMPT1_FILE}" >&2
  exit 1
fi
PROMPT1_TEXT=$(cat "$PROMPT1_FILE")

if [[ "$SCHEME" == "double" ]]; then
  PROMPT2_FILE="${AGENT_DIR}/prompts/${PROMPT2_NAME}.md"
  if [[ ! -f "$PROMPT2_FILE" ]]; then
    echo "Error: prompt file not found: ${PROMPT2_FILE}" >&2
    exit 1
  fi
  PROMPT2_TEXT=$(cat "$PROMPT2_FILE")
fi

# --- Generate memory pointers (first line of each memory file) ---
if [[ "$PRESEARCH" == "on" ]]; then
  rlog "presearch: running (content=${PRESEARCH_CONTENT})"
  PRESEARCH_STDERR=$(mktemp)
  POINTERS=$(echo "$PROMPT" | python3 "${AGENT_DIR}/src/presearch.py" \
    "$MEMORY_DIR" "$PRESEARCH_CONTENT" 2>"$PRESEARCH_STDERR") || {
    rlog "presearch: failed (exit $?)"
    echo "Error: presearch failed" >&2
    rm -f "$PRESEARCH_STDERR"
    exit 1
  }
  if [[ -s "$PRESEARCH_STDERR" ]]; then
    rlog "presearch: $(cat "$PRESEARCH_STDERR")"
  fi
  rm -f "$PRESEARCH_STDERR"
else
  POINTERS=$(python3 -c "
import sys
sys.path.insert(0, '${AGENT_DIR}/src')
from pathlib import Path
from memory_metadata import get_description
d = Path('${MEMORY_DIR}')
if d.exists():
    for f in sorted(d.glob('*.md')):
        desc = get_description(f)
        print(f'- memory/{f.name} — {desc}')
" 2>/dev/null) || { echo "Error: pointer generation failed" >&2; exit 1; }
fi

if [[ -z "$POINTERS" ]]; then
  rlog "No pointers generated, exiting"
  exit 0
fi

# --- Helper: run a claude -p call ---
run_claude() {
  local model="$1"
  local query="$2"
  local label="$3"

  local stderr_log
  stderr_log=$(mktemp)
  local result
  result=$(echo "$query" | (cd /tmp && AGENT_HOOK_ID="" BLOCK_HOOK_AGENTS=1 timeout 25 claude -p \
    --model "$model" \
    --max-turns 1 \
    --tools "" \
    --no-session-persistence \
    --system-prompt "" \
    2>"$stderr_log")) || {
    echo "Error: ${label} failed or timed out (exit $?)" >&2
    cat "$stderr_log" >&2
    rm -f "$stderr_log"
    return 1
  }
  rm -f "$stderr_log"
  echo "$result"
}

# --- Helper: parse filenames from model output, validate they exist ---
parse_filenames() {
  local output="$1"
  while IFS= read -r line; do
    line=$(echo "$line" | tr -d '[:space:]')
    [[ -z "$line" ]] && continue
    [[ "$line" != memory/* ]] && line="memory/${line}"
    if [[ -f "${AGENT_DIR}/${line}" ]]; then
      echo "$line"
    fi
  done <<< "$output"
}

# ============================================================
# PASS 1: Candidate selection from one-line pointers
# ============================================================
PASS1_QUERY="${PROMPT1_TEXT}

<user_prompt>
${PROMPT}
</user_prompt>

Available memories:
${POINTERS}"

PASS1_RESULT=$(run_claude "$MODEL1" "$PASS1_QUERY" "pass 1 (${MODEL1})") || exit 1

# Collect candidates
CANDIDATES=()
while IFS= read -r line; do
  [[ -n "$line" ]] && CANDIDATES+=("$line")
done < <(parse_filenames "$PASS1_RESULT")

# If no candidates, we're done
if [[ ${#CANDIDATES[@]} -eq 0 ]]; then
  exit 0
fi

# --- Single scheme: output pass 1 results directly ---
if [[ "$SCHEME" == "single" ]]; then
  for cand in "${CANDIDATES[@]}"; do
    echo "$cand"
  done
  exit 0
fi

# ============================================================
# PASS 2: Re-rank with full content (double scheme only)
# ============================================================

# Build full content block for each candidate
CONTENT_BLOCK=""
for cand in "${CANDIDATES[@]}"; do
  CONTENT=$(cat "${AGENT_DIR}/${cand}")
  CONTENT_BLOCK="${CONTENT_BLOCK}
<memory file=\"${cand}\">
${CONTENT}
</memory>
"
done

PASS2_QUERY="${PROMPT2_TEXT}

<user_prompt>
${PROMPT}
</user_prompt>

Candidate memories:
${CONTENT_BLOCK}"

PASS2_RESULT=$(run_claude "$MODEL2" "$PASS2_QUERY" "pass 2 (${MODEL2})") || {
  # Fall back to pass 1 results
  for cand in "${CANDIDATES[@]}"; do
    echo "$cand"
  done
  exit 0
}

# Filter pass 2 results: must be from pass 1 candidates
while IFS= read -r line; do
  line=$(echo "$line" | tr -d '[:space:]')
  [[ -z "$line" ]] && continue
  [[ "$line" != memory/* ]] && line="memory/${line}"
  for cand in "${CANDIDATES[@]}"; do
    if [[ "$line" == "$cand" ]]; then
      echo "$line"
      break
    fi
  done
done <<< "$PASS2_RESULT"
