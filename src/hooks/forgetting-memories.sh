#!/usr/bin/env bash
# forgetting-memories.sh — SessionStart hook (async) / manual via --force
# Checks if enough sessions have passed since last cleanup,
# and if so, spawns the forgetting agent to review low-scoring memories.
# Usage: forgetting-memories.sh [--force [count]] [--output-only-candidates [count]]

set -euo pipefail

FORCE=false
FORCE_COUNT=""
OUTPUT_ONLY=false
for arg in "$@"; do
  case "$arg" in
    --force) FORCE=true ;;
    --output-only-candidates) OUTPUT_ONLY=true ;;
    *) FORCE_COUNT="$arg" ;;
  esac
done

# --- When run as a hook (no --force/--output-only-candidates): gating logic ---
if [[ "$FORCE" == false && "$OUTPUT_ONLY" == false ]]; then
  # Skip nested calls
  if [[ -n "${BLOCK_HOOK_AGENTS:-}" ]]; then
    cat > /dev/null
    exit 0
  fi

  # Check agent.conf toggle
  CONF="${CLAUDE_PROJECT_DIR:-}/agent.conf"
  if [[ -f "$CONF" ]] && grep -qx 'MEMORY_FORGETTING=off' "$CONF"; then
    cat > /dev/null
    exit 0
  fi

  cat > /dev/null  # consume stdin
fi

AGENT_DIR="${CLAUDE_PROJECT_DIR:-/home/yeyito/Workspace/Agent}"
CONF="${AGENT_DIR}/agent.conf"
LOG="${AGENT_DIR}/runtime/hook-${AGENT_HOOK_ID:-none}.log"
log() { echo "[$(date +%H:%M:%S)] [forgetting] $*" >> "$LOG" 2>/dev/null; }

log "--- Forgetting hook fired ---"

# --- Read current session ---
SESSION_FILE="${AGENT_DIR}/runtime/session-counter"
CURRENT_SESSION=$(cat "$SESSION_FILE" 2>/dev/null || echo "manual")

if [[ "$OUTPUT_ONLY" == true && "$CURRENT_SESSION" == "manual" ]]; then
  echo "Error: session counter not found at ${SESSION_FILE}" >&2
  exit 1
fi

if [[ "$FORCE" == false && "$OUTPUT_ONLY" == false ]]; then
  if [[ "$CURRENT_SESSION" == "manual" ]]; then
    log "SKIP: session counter not found"
    exit 0
  fi

  # Read schedule from agent.conf (default: 0/200)
  FORGETTING_SCHEDULE=$(grep '^MEMORY_FORGETTING_SCHEDULE=' "$CONF" 2>/dev/null | cut -d= -f2 || true)
  FORGETTING_SCHEDULE="${FORGETTING_SCHEDULE:-0/200}"
  FORGETTING_OFFSET="${FORGETTING_SCHEDULE%%/*}"
  FORGETTING_CYCLE="${FORGETTING_SCHEDULE##*/}"

  # Check if cleanup is due
  if (( CURRENT_SESSION % FORGETTING_CYCLE != FORGETTING_OFFSET )); then
    log "SKIP: session $CURRENT_SESSION is not $FORGETTING_OFFSET mod $FORGETTING_CYCLE"
    exit 0
  fi

  LAST_FILE="${AGENT_DIR}/runtime/last-forgetting-session"
  if [[ -f "$LAST_FILE" ]] && [[ "$(cat "$LAST_FILE")" == "$CURRENT_SESSION" ]]; then
    log "SKIP: already ran for session $CURRENT_SESSION"
    exit 0
  fi

  # First time — set baseline, don't run
  if [[ ! -f "$LAST_FILE" ]]; then
    echo "$CURRENT_SESSION" > "$LAST_FILE"
    log "Initialized last-forgetting-session at session $CURRENT_SESSION"
    exit 0
  fi

  # Mark cleanup (lock before spawning)
  echo "$CURRENT_SESSION" > "$LAST_FILE"
fi

log "--- Forgetting agent triggered (session $CURRENT_SESSION) ---"

if [[ "$OUTPUT_ONLY" == false ]]; then
  # --- Forgetting log file ---
  mkdir -p "${AGENT_DIR}/logs"
  FLOG="${AGENT_DIR}/logs/forgetting-${CURRENT_SESSION}.log"

  # --- Start notification ---
  if [[ -n "${AGENT_TERMINAL_PID:-}" ]] && command -v st-notify &>/dev/null; then
    st-notify -t 16000 -ts 18 -b "#ff6b9d" -bg "#1a0010" -fg "#f1faee" \
      "$AGENT_TERMINAL_PID" "Memory cleanup started" &>/dev/null &
  fi
fi

# --- Score memories and find candidates ---
DEFAULT_CANDIDATES=$(grep '^MEMORY_FORGETTING_CANDIDATES=' "$CONF" 2>/dev/null | cut -d= -f2 || true)
DEFAULT_CANDIDATES="${DEFAULT_CANDIDATES:-3}"
FORGETTING_CANDIDATES="${FORCE_COUNT:-$DEFAULT_CANDIDATES}"

FORGETTING_MIN_AGE=$(grep '^MEMORY_FORGETTING_MIN_AGE=' "$CONF" 2>/dev/null | cut -d= -f2 || true)
FORGETTING_MIN_AGE="${FORGETTING_MIN_AGE:-50}"

log "Scoring memories..."
CANDIDATES=$(python3 -c "
import sys, math
sys.path.insert(0, '${AGENT_DIR}/src')
from pathlib import Path
from memory_metadata import read_metadata

memory_dir = Path('${AGENT_DIR}/memory')
current_session = ${CURRENT_SESSION}
scores = []
for f in sorted(memory_dir.glob('*.md')):
    d = read_metadata(f)
    if d.get('pinned', False):
        continue
    age = current_session - d.get('created_session', 0)
    if age < ${FORGETTING_MIN_AGE}:
        continue
    sessions_since = current_session - d.get('last_accessed_session', 0)
    freq = d.get('frequency', 0)
    appreciation = d.get('appreciation', 0)
    score = math.log2(1 + freq) * math.exp(-0.003466 * sessions_since) + appreciation
    scores.append((score, f.stem, d))
scores.sort()
for score, name, d in scores[:${FORGETTING_CANDIDATES}]:
    print('{:.4f}  {}  freq={} last={} appr={}'.format(
        score, name, d['frequency'], d['last_accessed_session'], d['appreciation']))
" 2>/dev/null) || { log "SKIP: scoring failed"; exit 0; }

if [[ -z "$CANDIDATES" ]]; then
  log "SKIP: no candidates found"
  exit 0
fi
log "Candidates: $(echo "$CANDIDATES" | tr '\n' ', ')"

# --- Output-only mode: print candidates and exit ---
if [[ "$OUTPUT_ONLY" == true ]]; then
  echo "$CANDIDATES"
  exit 0
fi

# --- Build user prompt ---
read -r -d '' USER_PROMPT << PROMPT || true
You are the memory forgetting agent. Review the candidates below and decide whether to archive or keep each one.

## Environment
- Memory files: ${AGENT_DIR}/memory/*.md (metadata is embedded in <memory-metadata> tags at the top of each file)
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
echo "$USER_PROMPT" | \
  (cd /tmp && PATH="${AGENT_DIR}/src/memory:$PATH" AGENT_HOOK_ID="" BLOCK_HOOK_AGENTS=1 timeout 900 claude -p \
    --model opus \
    --max-turns 30 \
    --dangerously-skip-permissions \
    --no-session-persistence \
    2>"$STDERR_LOG") >> "$FLOG" || { log "Forgetting agent failed (exit $?)"; log "stderr: $(cat "$STDERR_LOG")"; rm -f "$STDERR_LOG"; exit 0; }

if [[ -s "$STDERR_LOG" ]]; then
  log "stderr: $(cat "$STDERR_LOG")"
fi
rm -f "$STDERR_LOG"
log "Forgetting agent done (output in $FLOG)"
log "--- Forgetting hook done ---"

exit 0
