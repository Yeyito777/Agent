#!/usr/bin/env bash
# recall-memories.sh — UserPromptSubmit hook
# Asks opus which memories are relevant to the user's prompt,
# deduplicates against already-recalled memories for this session,
# and outputs new ones as context.

set -euo pipefail

# --- Skip if this is a nested claude -p call from the hook itself ---
if [[ -n "${RECALL_HOOK_RUNNING:-}" ]]; then
  cat > /dev/null
  exit 0
fi

# --- Check agent.conf toggle ---
CONF="${CLAUDE_PROJECT_DIR:-}/agent.conf"
if [[ -f "$CONF" ]] && grep -qx 'MEMORY_RECALL=off' "$CONF"; then
  cat > /dev/null
  exit 0
fi

INPUT=$(cat)

# --- Require AGENT_HOOK_ID (set by agent() in ~/.zshrc) ---
if [[ -z "${AGENT_HOOK_ID:-}" ]]; then
  echo "Hook error: AGENT_HOOK_ID not set. Session was not started through the agent command." >&2
  exit 2
fi

AGENT_DIR="$CLAUDE_PROJECT_DIR"
RECALLED_FILE="${AGENT_DIR}/runtime/recalled-${AGENT_HOOK_ID}"
LOG="${AGENT_DIR}/runtime/hook-${AGENT_HOOK_ID}.log"
log() { echo "[$(date +%H:%M:%S)] $*" >> "$LOG"; }

log "--- Hook fired ---"

if [[ ! -f "$RECALLED_FILE" ]]; then
  log "ERROR: Tracking file not found: ${RECALLED_FILE}"
  echo "Hook error: Tracking file ${RECALLED_FILE} not found." >&2
  exit 2
fi

# --- Check dependencies (degrade silently) ---
if ! command -v jq &>/dev/null; then
  log "SKIP: jq not found"
  exit 0
fi
if ! command -v claude &>/dev/null; then
  log "SKIP: claude not found"
  exit 0
fi

# --- Extract prompt ---
PROMPT=$(echo "$INPUT" | jq -r '.prompt // empty')
if [[ -z "$PROMPT" || "$PROMPT" =~ ^[[:space:]]*$ ]]; then
  log "SKIP: empty prompt"
  exit 0
fi
log "Prompt: ${PROMPT:0:100}..."

# --- Generate memory pointers ---
POINTERS=$(python3 -c "
from pathlib import Path
d = Path('${AGENT_DIR}/memory')
if d.exists():
    for f in sorted(d.glob('*.md')):
        desc = f.read_text().split('\n')[0].strip()
        print(f'- memory/{f.name} — {desc}')
" 2>/dev/null) || { log "SKIP: python pointer generation failed"; exit 0; }
if [[ -z "$POINTERS" ]]; then
  log "SKIP: no memory pointers found"
  exit 0
fi
log "Found $(echo "$POINTERS" | wc -l) memory pointers"

# --- Ask opus which memories are relevant ---
QUERY="Which of these memories are relevant to the user prompt below? Output ONLY the filenames (one per line, e.g. memory/foo-bar.md). No explanations, no markdown, no numbering. If none are relevant, output nothing.

Available memories:
${POINTERS}

<user_prompt>
${PROMPT}
</user_prompt>"

log "Calling opus..."
log "Query being sent: ${QUERY:0:300}..."
STDERR_LOG=$(mktemp)
RESULT=$(echo "$QUERY" | (cd /tmp && AGENT_HOOK_ID="" RECALL_HOOK_RUNNING=1 timeout 25 claude -p \
  --model opus \
  --max-turns 1 \
  --tools "" \
  --no-session-persistence \
  --system-prompt "" \
  2>"$STDERR_LOG")) || { log "SKIP: claude -p failed or timed out (exit $?)"; log "stderr: $(cat "$STDERR_LOG")"; rm -f "$STDERR_LOG"; exit 0; }
if [[ -s "$STDERR_LOG" ]]; then
  log "claude -p stderr: $(cat "$STDERR_LOG")"
fi
rm -f "$STDERR_LOG"
log "Opus returned: ${RESULT:-<empty>}"

# --- Filter, validate, deduplicate ---
NEW_MEMORIES=()
while IFS= read -r line; do
  line=$(echo "$line" | tr -d '[:space:]')
  [[ -z "$line" ]] && continue

  # Accept both "memory/foo.md" and "foo.md"
  [[ "$line" != memory/* ]] && line="memory/${line}"

  # Must exist on disk
  if [[ ! -f "${AGENT_DIR}/${line}" ]]; then
    log "REJECT (not on disk): $line"
    continue
  fi

  # Skip if already recalled this session
  if grep -qxF "$line" "$RECALLED_FILE" 2>/dev/null; then
    log "DEDUP (already recalled): $line"
    continue
  fi

  echo "$line" >> "$RECALLED_FILE"
  NEW_MEMORIES+=("$line")
  log "RECALLED: $line"
done <<< "$RESULT"

# --- Output context ---
if [[ ${#NEW_MEMORIES[@]} -gt 0 ]]; then
  log "OUTPUT: Relevant memories: ${NEW_MEMORIES[*]}"
  echo "Relevant memories: ${NEW_MEMORIES[*]}"

  # Notify terminal via st-notify (one toast per memory)
  if [[ -n "${AGENT_TERMINAL_PID:-}" ]] && command -v st-notify &>/dev/null; then
    for mem in "${NEW_MEMORIES[@]}"; do
      st-notify -t 7000 -ts 16 -b "#ffaf87" -bg "#0a0806" -fg "#ffaf87" \
        "$AGENT_TERMINAL_PID" "recalled ${mem}" &>/dev/null &
    done
    log "Sent ${#NEW_MEMORIES[@]} st-notify toasts to PID ${AGENT_TERMINAL_PID}"
  fi
else
  log "No new memories to surface"
fi

exit 0
