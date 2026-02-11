#!/usr/bin/env bash
# forgetting-memories.sh — SessionStart hook (async)
# Checks if enough sessions have passed since last cleanup,
# and if so, spawns the forgetting agent to review low-scoring memories.

set -euo pipefail

# --- Skip nested calls ---
if [[ -n "${RECALL_HOOK_RUNNING:-}" ]]; then
  cat > /dev/null
  exit 0
fi

# --- Check agent.conf toggle ---
CONF="${CLAUDE_PROJECT_DIR:-}/agent.conf"
if [[ -f "$CONF" ]] && grep -qx 'MEMORY_FORGETTING=off' "$CONF"; then
  cat > /dev/null
  exit 0
fi

cat > /dev/null  # consume stdin

AGENT_DIR="$CLAUDE_PROJECT_DIR"
LOG="${AGENT_DIR}/runtime/hook-${AGENT_HOOK_ID:-none}.log"
log() { echo "[$(date +%H:%M:%S)] [forgetting] $*" >> "$LOG" 2>/dev/null; }

log "--- Forgetting hook fired ---"

# --- Read current session ---
SESSION_FILE="${AGENT_DIR}/runtime/session-counter"
if [[ ! -f "$SESSION_FILE" ]]; then
  log "SKIP: session counter not found"
  exit 0
fi
CURRENT_SESSION=$(cat "$SESSION_FILE")

# --- Check if cleanup is due ---
FORGETTING_INTERVAL=60  # sessions between cleanups (~3 days at 20/day)
LAST_FILE="${AGENT_DIR}/runtime/last-forgetting-session"
if [[ -f "$LAST_FILE" ]]; then
  LAST_SESSION=$(cat "$LAST_FILE")
  SESSIONS_SINCE=$((CURRENT_SESSION - LAST_SESSION))
  if [[ $SESSIONS_SINCE -lt $FORGETTING_INTERVAL ]]; then
    log "SKIP: ${SESSIONS_SINCE}/${FORGETTING_INTERVAL} sessions since last cleanup"
    exit 0
  fi
else
  # First time — set baseline, don't run cleanup yet
  echo "$CURRENT_SESSION" > "$LAST_FILE"
  log "Initialized last-forgetting-session at session $CURRENT_SESSION"
  exit 0
fi

log "--- Forgetting agent triggered (session $CURRENT_SESSION, last cleanup at $LAST_SESSION, $SESSIONS_SINCE sessions elapsed) ---"

# --- Mark cleanup ---
echo "$CURRENT_SESSION" > "$LAST_FILE"

# --- Start notification ---
NOTIFY_PID="${AGENT_TERMINAL_PID:-}"
if [[ -n "$NOTIFY_PID" ]] && command -v st-notify &>/dev/null; then
  st-notify -t 45000 -b "#ff6b9d" -bg "#1a0010" -fg "#f1faee" \
    "$NOTIFY_PID" "Memory forgetting started" &>/dev/null &
fi

# --- Score memories and find candidates ---
log "Scoring memories..."
CANDIDATES=$(python3 -c "
import json, math
from pathlib import Path

metadata_dir = Path('${AGENT_DIR}/memory-metadata')
current_session = ${CURRENT_SESSION}
scores = []
for f in sorted(metadata_dir.glob('*.json')):
    d = json.loads(f.read_text())
    if d.get('pinned', False):
        continue
    sessions_since = current_session - d.get('last_accessed_session', 0)
    freq = d.get('frequency', 0)
    appreciation = d.get('appreciation', 0)
    score = math.log2(1 + freq) * math.exp(-0.003466 * sessions_since) + appreciation
    scores.append((score, f.stem, d))
scores.sort()
for score, name, d in scores[:3]:
    print('{:.4f}  {}  freq={} last={} appr={}'.format(
        score, name, d['frequency'], d['last_accessed_session'], d['appreciation']))
" 2>/dev/null) || { log "SKIP: scoring failed"; exit 0; }

if [[ -z "$CANDIDATES" ]]; then
  log "SKIP: no candidates found"
  exit 0
fi
log "Candidates: $(echo "$CANDIDATES" | tr '\n' ', ')"

# --- Build notification instructions ---
if [[ -n "$NOTIFY_PID" ]]; then
  NOTIFY_INSTRUCTIONS="## End Notifications
After you finish, send one notification per archived memory:
  st-notify -t 45000 -b \"#ff6b9d\" -bg \"#1a0010\" -fg \"#f1faee\" ${NOTIFY_PID} \"Forgot memory/{name}.md\"

If you archived nothing, send:
  st-notify -t 45000 -b \"#ff6b9d\" -bg \"#1a0010\" -fg \"#f1faee\" ${NOTIFY_PID} \"Memory cleanup done — nothing archived\""
else
  NOTIFY_INSTRUCTIONS="## Notifications
Notifications are disabled (no terminal PID available)."
fi

# --- Build user prompt ---
read -r -d '' USER_PROMPT << PROMPT || true
You are the memory forgetting agent. Review the candidates below and decide whether to archive or keep each one.

## Environment
- Memory files: ${AGENT_DIR}/memory/*.md
- Metadata files: ${AGENT_DIR}/memory-metadata/*.json
- Cold storage: ${AGENT_DIR}/memory-cold/

## Candidates for forgetting (lowest scoring memories)
Score  Name  Stats
${CANDIDATES}

## Your Task
1. Read each candidate's content from memory/{name}.md.
2. Decide for each:
   - KEEP: If the memory contains critical, foundational, or hard-to-reconstruct information, bump its appreciation by +1 or +2 in its memory-metadata/{name}.json file.
   - ARCHIVE: If the memory is low-value, outdated, or trivially reconstructable, move both files to cold storage:
       mv ${AGENT_DIR}/memory/{name}.md ${AGENT_DIR}/memory-cold/{name}.md
       mv ${AGENT_DIR}/memory-metadata/{name}.json ${AGENT_DIR}/memory-cold/{name}.json
3. Tell me your reasoning for each decision.

${NOTIFY_INSTRUCTIONS}

## Guidelines
- ERR ON THE SIDE OF KEEPING. Bumping appreciation is always preferred over archiving.
- Only archive memories that are clearly low-value, outdated, or trivially reconstructable.
- If in doubt, keep the memory and bump appreciation.
- Do not modify memory content — only metadata and file locations.
PROMPT

# --- Spawn forgetting agent ---
log "Spawning forgetting agent..."
STDERR_LOG=$(mktemp)
RESULT=$(echo "$USER_PROMPT" | \
  (cd /tmp && AGENT_HOOK_ID="" RECALL_HOOK_RUNNING=1 timeout 900 claude -p \
    --model opus \
    --max-turns 30 \
    --allowedTools "Read,Write,Glob,Bash(mv *),Bash(mkdir *),Bash(ls *),Bash(cd *),Bash(st-notify *),Bash(python3 *)" \
    --no-session-persistence \
    2>"$STDERR_LOG")) || { log "Forgetting agent failed (exit $?)"; log "stderr: $(cat "$STDERR_LOG")"; rm -f "$STDERR_LOG"; exit 0; }

if [[ -s "$STDERR_LOG" ]]; then
  log "stderr: $(cat "$STDERR_LOG")"
fi
rm -f "$STDERR_LOG"
log "Forgetting agent output: ${RESULT:0:500}"
log "--- Forgetting hook done ---"

exit 0
