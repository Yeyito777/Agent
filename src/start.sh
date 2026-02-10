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
python3 src/refresh_pointers.py
export AGENT_HOOK_ID=$(openssl rand -hex 4)
mkdir -p runtime
touch "runtime/recalled-${AGENT_HOOK_ID}" "runtime/hook-${AGENT_HOOK_ID}.log"
claude --dangerously-skip-permissions
