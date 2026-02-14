#!/usr/bin/env bash
# start.sh — Agent launcher
# Initializes the runtime environment and starts Claude.

set -euo pipefail

AGENT_DIR="/home/yeyito/Workspace/Agent"

# Clear screen + scrollback for a clean start (also cleans up old content after persist restore)
printf '\e[2J\e[3J\e[H'

printf '\e[38;2;72;202;228m █████╗  ██████╗ ███████╗███╗   ██╗████████╗\e[0m\n'
printf '\e[38;2;72;202;228m██╔══██╗██╔════╝ ██╔════╝████╗  ██║╚══██╔══╝\e[0m\n'
printf '\e[38;2;0;180;216m███████║██║  ███╗█████╗  ██╔██╗ ██║   ██║\e[0m\n'
printf '\e[38;2;0;180;216m██╔══██║██║   ██║██╔══╝  ██║╚██╗██║   ██║\e[0m\n'
printf '\e[38;2;46;196;182m██║  ██║╚██████╔╝███████╗██║ ╚████║   ██║\e[0m\n'
printf '\e[38;2;46;196;182m╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝\e[0m\n'

cd "$AGENT_DIR"
# python3 src/refresh_pointers.py
export AGENT_HOOK_ID=$(openssl rand -hex 4)
# Walk up process tree to find the st terminal PID
find_terminal_pid() {
  local cur=$$
  # First pass: look for ancestor named "st"
  while true; do
    cur=$(ps -o ppid= -p "$cur" 2>/dev/null | tr -d ' ') || break
    [[ -z "$cur" || "$cur" == "0" || "$cur" == "1" ]] && break
    if [[ "$(ps -o comm= -p "$cur" 2>/dev/null)" == "st" ]]; then
      echo "$cur"; return
    fi
  done
  # Fallback: first ancestor owning an X window
  cur=$$
  while true; do
    cur=$(ps -o ppid= -p "$cur" 2>/dev/null | tr -d ' ') || break
    [[ -z "$cur" || "$cur" == "0" || "$cur" == "1" ]] && break
    if xdotool search --pid "$cur" &>/dev/null; then
      echo "$cur"; return
    fi
  done
}
export AGENT_TERMINAL_PID=$(find_terminal_pid)
export AGENT_START_PID=$$
mkdir -p runtime memory-metadata memory-cold

# Prune runtime files from orphaned sessions (terminal killed, dwm restart, reboot)
# Pass 1: pid files with dead processes
for pidfile in runtime/agent-*.pid; do
  [[ -f "$pidfile" ]] || continue
  id=$(basename "$pidfile" .pid | sed 's/agent-//')
  kill -0 "$(cat "$pidfile")" 2>/dev/null && continue
  rm -f "runtime/recalled-$id" "runtime/hook-$id.log" "$pidfile"
done
# Pass 2: hook/recalled files with no pid file (pre-mechanism leftovers)
for f in runtime/hook-*.log runtime/recalled-*; do
  [[ -f "$f" ]] || continue
  id=$(basename "$f" | sed 's/^hook-//; s/^recalled-//; s/\.log$//')
  [[ -f "runtime/agent-${id}.pid" ]] || rm -f "runtime/hook-$id.log" "runtime/recalled-$id"
done

# Reconcile memory metadata (uses current counter value, does not increment)
python3 src/reconcile_metadata.py

# Notify upcoming session number (counter increments on first message, not here)
SESSION_FILE="${AGENT_DIR}/runtime/session-counter"
NEXT_SESSION=$(( $(cat "$SESSION_FILE" 2>/dev/null || echo "-1") + 1 ))
if [[ -n "$AGENT_TERMINAL_PID" ]] && command -v st-notify &>/dev/null; then
  st-notify -t 10000 -ts 18 -b "#ff6b9d" -bg "#1a0010" -fg "#f1faee" \
    "$AGENT_TERMINAL_PID" "Session $NEXT_SESSION" &>/dev/null &
fi

touch "runtime/recalled-${AGENT_HOOK_ID}" "runtime/hook-${AGENT_HOOK_ID}.log"
echo "$AGENT_START_PID" > "runtime/agent-${AGENT_HOOK_ID}.pid"

# Parse --resume flag (forwarded to claude)
CLAUDE_ARGS=(--dangerously-skip-permissions)
while [[ $# -gt 0 ]]; do
  case "$1" in
    --resume)
      [[ -n "${2:-}" ]] && CLAUDE_ARGS+=(--resume "$2") && shift 2 || { echo "--resume requires a session ID" >&2; exit 1; }
      ;;
    *)
      shift
      ;;
  esac
done

claude "${CLAUDE_ARGS[@]}"
