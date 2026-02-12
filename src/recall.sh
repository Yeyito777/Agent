#!/usr/bin/env bash
# recall.sh — Standalone recall agent
# Receives a user prompt on stdin, outputs recalled memory filenames to stdout.
# This is the source of truth for recall logic — used by the hook and benchmarks.

set -euo pipefail

AGENT_DIR="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/.." && pwd)}"
MEMORY_DIR="${AGENT_DIR}/memory"

# --- Read prompt from stdin ---
PROMPT=$(cat)
if [[ -z "$PROMPT" || "$PROMPT" =~ ^[[:space:]]*$ ]]; then
  exit 0
fi

# --- Check dependencies ---
if ! command -v claude &>/dev/null; then
  echo "Error: claude CLI not found" >&2
  exit 1
fi

# --- Generate memory pointers ---
POINTERS=$(python3 -c "
from pathlib import Path
d = Path('${MEMORY_DIR}')
if d.exists():
    for f in sorted(d.glob('*.md')):
        desc = f.read_text().split('\n')[0].strip()
        print(f'- memory/{f.name} — {desc}')
" 2>/dev/null) || { echo "Error: pointer generation failed" >&2; exit 1; }

if [[ -z "$POINTERS" ]]; then
  exit 0
fi

# --- Ask opus which memories are relevant ---
QUERY="Which memories are relevant to this user prompt? Be selective — only recall memories whose specific content would be needed to handle the task well. When multiple memories cover similar topics, pick only the ones that directly apply rather than everything in the same area. Output ONLY the filenames (one per line, e.g. memory/foo-bar.md). No explanations, no markdown, no numbering. If none apply, output nothing.

<user_prompt>
${PROMPT}
</user_prompt>

Available memories:
${POINTERS}"

STDERR_LOG=$(mktemp)
RESULT=$(echo "$QUERY" | (cd /tmp && AGENT_HOOK_ID="" BLOCK_HOOK_AGENTS=1 timeout 25 claude -p \
  --model opus \
  --max-turns 1 \
  --tools "" \
  --no-session-persistence \
  --system-prompt "" \
  2>"$STDERR_LOG")) || {
  echo "Error: claude -p failed or timed out (exit $?)" >&2
  cat "$STDERR_LOG" >&2
  rm -f "$STDERR_LOG"
  exit 1
}
rm -f "$STDERR_LOG"

# --- Filter and validate ---
while IFS= read -r line; do
  line=$(echo "$line" | tr -d '[:space:]')
  [[ -z "$line" ]] && continue

  # Accept both "memory/foo.md" and "foo.md"
  [[ "$line" != memory/* ]] && line="memory/${line}"

  # Must exist on disk
  if [[ -f "${AGENT_DIR}/${line}" ]]; then
    echo "$line"
  fi
done <<< "$RESULT"
