#!/usr/bin/env bash
# recall-memories.sh — UserPromptSubmit hook
# Asks opus which memories are relevant to the user's prompt,
# deduplicates against already-recalled memories for this session,
# and outputs new ones as context.

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
QUERY="Given the following user prompt, which memories should be recalled? Select memories the user is explicitly asking about or that contain context likely to meaningfully affect how the task should be handled. Output ONLY the filenames (one per line, e.g. memory/foo-bar.md). No explanations, no markdown, no numbering. If none apply, output nothing.

<user_prompt>
${PROMPT}
</user_prompt>

Available memories:
${POINTERS}"

log "Calling opus..."
log "Query being sent: ${QUERY:0:300}..."
STDERR_LOG=$(mktemp)
RESULT=$(echo "$QUERY" | (cd /tmp && AGENT_HOOK_ID="" BLOCK_HOOK_AGENTS=1 timeout 25 claude -p \
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

  # Update metadata (frequency + last_accessed_session)
  MEM_NAME=$(basename "$line" .md)
  META_FILE="${AGENT_DIR}/memory-metadata/${MEM_NAME}.json"
  if [[ -f "$META_FILE" ]]; then
    python3 -c "
import json
f = '${META_FILE}'
with open(f) as fh: d = json.load(fh)
d['frequency'] = d.get('frequency', 0) + 1
d['last_accessed_session'] = ${AGENT_SESSION:-0}
with open(f, 'w') as fh: json.dump(d, fh, indent=2); fh.write('\n')
" 2>/dev/null || log "WARN: failed to update metadata for $line"
  fi
done <<< "$RESULT"

# --- Output context ---
if [[ ${#NEW_MEMORIES[@]} -gt 0 ]]; then
  log "OUTPUT: Relevant memories: ${NEW_MEMORIES[*]}"
  OUTPUT="Relevant memories:"
  for mem in "${NEW_MEMORIES[@]}"; do
    desc=$(head -1 "${AGENT_DIR}/${mem}" | sed 's/^[[:space:]]*//')
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
