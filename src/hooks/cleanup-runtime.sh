#!/usr/bin/env bash
# cleanup-runtime.sh — SessionEnd hook
# Removes the session's recalled-memories tracking file.

if [[ -n "${AGENT_HOOK_ID:-}" ]]; then
  rm -f "${CLAUDE_PROJECT_DIR}/runtime/recalled-${AGENT_HOOK_ID}" \
        "${CLAUDE_PROJECT_DIR}/runtime/hook-${AGENT_HOOK_ID}.log"
fi

exit 0
