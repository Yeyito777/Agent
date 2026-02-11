#!/usr/bin/env bash
# start.sh — Agent launcher
# Initializes the runtime environment and starts Claude.

set -euo pipefail

AGENT_DIR="/home/yeyito/Workspace/Agent"

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
mkdir -p runtime memory-metadata memory-cold

# Reconcile memory metadata (uses current counter value, does not increment)
python3 src/reconcile_metadata.py

# Notify upcoming session number (counter increments on first message, not here)
SESSION_FILE="${AGENT_DIR}/runtime/session-counter"
NEXT_SESSION=$(( $(cat "$SESSION_FILE" 2>/dev/null || echo "-1") + 1 ))
if [[ -n "$AGENT_TERMINAL_PID" ]] && command -v st-notify &>/dev/null; then
  st-notify -t 10000 -b "#ff6b9d" -bg "#1a0010" -fg "#f1faee" \
    "$AGENT_TERMINAL_PID" "Session $NEXT_SESSION" &>/dev/null &
fi

touch "runtime/recalled-${AGENT_HOOK_ID}" "runtime/hook-${AGENT_HOOK_ID}.log"
claude --dangerously-skip-permissions
