#!/usr/bin/env bash
# recall-memories.sh — UserPromptSubmit hook
# Extracts prompt, delegates recall to src/recall.sh,
# then handles dedup, metadata, notifications, and context output.

set -euo pipefail

# --- Skip if this is a nested claude -p call from the hook itself ---
if [[ -n "${BLOCK_HOOK_AGENTS:-}" ]]; then
  cat > /dev/null
  exit 0
fi

# --- Session counter: increment on first message of each session ---
if [[ -n "${AGENT_HOOK_ID:-}" && -n "${CLAUDE_PROJECT_DIR:-}" ]]; then
  _LAST_INC="${CLAUDE_PROJECT_DIR}/runtime/session-last-increment"
  _LAST_ID=$(cat "$_LAST_INC" 2>/dev/null || echo "")
  if [[ "$_LAST_ID" != "$AGENT_HOOK_ID" ]]; then
    SESSION_FILE="${CLAUDE_PROJECT_DIR}/runtime/session-counter"
    if [[ -f "$SESSION_FILE" ]]; then
      export AGENT_SESSION=$(( $(cat "$SESSION_FILE") + 1 ))
    else
      export AGENT_SESSION=0
    fi
    echo "$AGENT_SESSION" > "$SESSION_FILE"
    echo "$AGENT_HOOK_ID" > "$_LAST_INC"
  fi
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

touch "$LOG" "$RECALLED_FILE"
log "--- Hook fired ---"

# --- Check dependencies (degrade silently) ---
if ! command -v jq &>/dev/null; then
  log "SKIP: jq not found"
  exit 0
fi

# --- Extract prompt ---
PROMPT=$(echo "$INPUT" | jq -r '.prompt // empty')
if [[ -z "$PROMPT" || "$PROMPT" =~ ^[[:space:]]*$ ]]; then
  log "SKIP: empty prompt"
  exit 0
fi
log "Prompt: ${PROMPT:0:100}..."

# --- Call standalone recall script ---
log "Calling src/recall.sh..."
RECALL_STDERR=$(mktemp)
RESULT=$(echo "$PROMPT" | "${AGENT_DIR}/src/recall.sh" 2>"$RECALL_STDERR") || {
  log "SKIP: src/recall.sh failed (exit $?)"
  log "stderr: $(cat "$RECALL_STDERR")"
  rm -f "$RECALL_STDERR"
  exit 0
}
if [[ -s "$RECALL_STDERR" ]]; then
  log "recall.sh stderr: $(cat "$RECALL_STDERR")"
fi
rm -f "$RECALL_STDERR"
log "recall.sh returned: ${RESULT:-<empty>}"

# --- Deduplicate and update metadata ---
METADATA_PY="${AGENT_DIR}/src/memory_metadata.py"
NEW_MEMORIES=()
while IFS= read -r line; do
  [[ -z "$line" ]] && continue

  # Skip if already recalled this session
  if grep -qxF "$line" "$RECALLED_FILE" 2>/dev/null; then
    log "DEDUP (already recalled): $line"
    continue
  fi

  echo "$line" >> "$RECALLED_FILE"
  NEW_MEMORIES+=("$line")
  log "RECALLED: $line"

  # Update in-file metadata (frequency + last_accessed_session)
  MEM_FILE="${AGENT_DIR}/${line}"
  if [[ -f "$MEM_FILE" ]]; then
    python3 -c "
import sys
sys.path.insert(0, '${AGENT_DIR}/src')
from memory_metadata import read_metadata, write_metadata
from pathlib import Path
f = Path('${MEM_FILE}')
meta = read_metadata(f)
meta['frequency'] = meta.get('frequency', 0) + 1
meta['last_accessed_session'] = ${AGENT_SESSION:-0}
write_metadata(f, meta)
" 2>/dev/null || log "WARN: failed to update metadata for $line"
  fi
done <<< "$RESULT"

# --- Output context ---
if [[ ${#NEW_MEMORIES[@]} -gt 0 ]]; then
  log "OUTPUT: Relevant memories: ${NEW_MEMORIES[*]}"
  OUTPUT="Relevant memories:"
  for mem in "${NEW_MEMORIES[@]}"; do
    desc=$(python3 -c "
import sys
sys.path.insert(0, '${AGENT_DIR}/src')
from memory_metadata import get_description
from pathlib import Path
print(get_description(Path('${AGENT_DIR}/${mem}')))
" 2>/dev/null || head -1 "${AGENT_DIR}/${mem}" | sed 's/^[[:space:]]*//')
    OUTPUT="${OUTPUT}
- ${mem} — ${desc}"
  done
  echo "$OUTPUT"

  # Notify terminal via st-notify (one toast per memory)
  if [[ -n "${AGENT_TERMINAL_PID:-}" ]] && command -v st-notify &>/dev/null; then
    for mem in "${NEW_MEMORIES[@]}"; do
      st-notify -t 15000 -ts 18 -b "#4ddbb7" -bg "#001a0f" -fg "#f1faee" \
        "$AGENT_TERMINAL_PID" "recalled ${mem}" &>/dev/null
      sleep 0.05
    done
    log "Sent ${#NEW_MEMORIES[@]} st-notify toasts to PID ${AGENT_TERMINAL_PID}"
  fi
else
  log "No new memories to surface"
fi

exit 0
