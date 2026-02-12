#!/usr/bin/env bash
# forgetting-memories.sh — SessionStart hook (async)
# Checks if enough sessions have passed since last cleanup,
# and if so, spawns the forgetting agent to review low-scoring memories.

set -euo pipefail

# --- Skip nested calls ---
if [[ -n "${BLOCK_HOOK_AGENTS:-}" ]]; then
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

# --- Read schedule from agent.conf (default: 0/200) ---
FORGETTING_SCHEDULE=$(grep '^MEMORY_FORGETTING_SCHEDULE=' "$CONF" 2>/dev/null | cut -d= -f2 || true)
FORGETTING_SCHEDULE="${FORGETTING_SCHEDULE:-0/200}"
FORGETTING_OFFSET="${FORGETTING_SCHEDULE%%/*}"
FORGETTING_CYCLE="${FORGETTING_SCHEDULE##*/}"

# --- Check if cleanup is due ---
if (( CURRENT_SESSION % FORGETTING_CYCLE != FORGETTING_OFFSET )); then
  log "SKIP: session $CURRENT_SESSION is not $FORGETTING_OFFSET mod $FORGETTING_CYCLE"
  exit 0
fi

LAST_FILE="${AGENT_DIR}/runtime/last-forgetting-session"
if [[ -f "$LAST_FILE" ]] && [[ "$(cat "$LAST_FILE")" == "$CURRENT_SESSION" ]]; then
  log "SKIP: already ran for session $CURRENT_SESSION"
  exit 0
fi

# First time — set baseline, don't run cleanup yet
if [[ ! -f "$LAST_FILE" ]]; then
  echo "$CURRENT_SESSION" > "$LAST_FILE"
  log "Initialized last-forgetting-session at session $CURRENT_SESSION"
  exit 0
fi

log "--- Forgetting agent triggered (session $CURRENT_SESSION) ---"

# --- Mark cleanup ---
echo "$CURRENT_SESSION" > "$LAST_FILE"

# --- Start notification ---
if [[ -n "${AGENT_TERMINAL_PID:-}" ]] && command -v st-notify &>/dev/null; then
  st-notify -t 45000 -b "#ff6b9d" -bg "#1a0010" -fg "#f1faee" \
    "$AGENT_TERMINAL_PID" "Memory forgetting started" &>/dev/null &
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

## Tools
You have two tools available as Bash commands:
- \`forget-memory memory/{name}.md\` — archives the memory and its metadata to memory-cold/
- \`appreciate-memory memory/{name}.md <int>\` — bumps the memory's appreciation score by the given amount

## Your Task
1. Read each candidate's content from memory/{name}.md.
2. Decide for each:
   - KEEP: If the memory contains critical, foundational, or hard-to-reconstruct information, run \`appreciate-memory memory/{name}.md 1\` (or 2 for especially valuable ones).
   - ARCHIVE: If the memory is low-value, outdated, or trivially reconstructable, run \`forget-memory memory/{name}.md\`.
3. Tell me your reasoning for each decision.

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
  (cd /tmp && PATH="${AGENT_DIR}/src/memory:$PATH" AGENT_HOOK_ID="" BLOCK_HOOK_AGENTS=1 timeout 900 claude -p \
    --model opus \
    --max-turns 30 \
    --allowedTools "Read,Glob,Bash(forget-memory *),Bash(appreciate-memory *)" \
    --no-session-persistence \
    2>"$STDERR_LOG")) || { log "Forgetting agent failed (exit $?)"; log "stderr: $(cat "$STDERR_LOG")"; rm -f "$STDERR_LOG"; exit 0; }

if [[ -s "$STDERR_LOG" ]]; then
  log "stderr: $(cat "$STDERR_LOG")"
fi
rm -f "$STDERR_LOG"
log "Forgetting agent output: ${RESULT:0:500}"
log "--- Forgetting hook done ---"

exit 0
