#!/usr/bin/env bash
# update-memories.sh — Stop hook (async)
# Reviews the conversation transcript and updates memories if needed.
# Runs in the background after Claude finishes responding.

set -euo pipefail

# --- Skip nested calls ---
if [[ -n "${BLOCK_HOOK_AGENTS:-}" ]]; then
  cat > /dev/null
  exit 0
fi

# --- Check agent.conf toggle ---
CONF="${CLAUDE_PROJECT_DIR:-}/agent.conf"
if [[ -f "$CONF" ]] && grep -qx 'MEMORY_UPDATE=off' "$CONF"; then
  cat > /dev/null
  exit 0
fi

INPUT=$(cat)
AGENT_DIR="$CLAUDE_PROJECT_DIR"
LOG="${AGENT_DIR}/runtime/hook-${AGENT_HOOK_ID:-none}.log"
log() { echo "[$(date +%H:%M:%S)] [update] $*" >> "$LOG" 2>/dev/null; }

log "--- Memory update hook fired ---"

# --- Get transcript path ---
TRANSCRIPT=$(echo "$INPUT" | jq -r '.transcript_path // empty')
if [[ -z "$TRANSCRIPT" || ! -f "$TRANSCRIPT" ]]; then
  log "SKIP: no transcript found"
  exit 0
fi
log "Transcript: $TRANSCRIPT"

# --- Extract conversation text from JSONL ---
CONVERSATION=$(python3 - "$TRANSCRIPT" <<'PYEOF'
import json, sys
messages = []
with open(sys.argv[1]) as f:
    for line in f:
        try:
            entry = json.loads(line)
        except Exception:
            continue
        role = entry.get("role", "")
        if role not in ("user", "assistant"):
            continue
        msg = entry.get("message", {})
        content = msg if isinstance(msg, str) else msg.get("content", "")
        if isinstance(content, list):
            text = " ".join(
                b.get("text", "") for b in content
                if isinstance(b, dict) and b.get("type") == "text"
            )
        else:
            text = str(content)
        if text.strip():
            messages.append(f"[{role}]: {text.strip()}")
# Last 50 messages to keep context manageable
for line in messages[-50:]:
    print(line)
PYEOF
) || { log "SKIP: transcript parsing failed"; exit 0; }

if [[ -z "$CONVERSATION" ]]; then
  log "SKIP: empty conversation"
  exit 0
fi
log "Extracted $(echo "$CONVERSATION" | wc -l) messages from transcript"

# --- Generate memory pointers ---
POINTERS=$(python3 - "$AGENT_DIR" <<'PYEOF'
import sys
sys.path.insert(0, sys.argv[1] + '/src')
from pathlib import Path
from memory_metadata import get_description
d = Path(sys.argv[1]) / "memory"
if d.exists():
    for f in sorted(d.glob("*.md")):
        desc = get_description(f)
        print(f"- memory/{f.name} — {desc}")
PYEOF
) || { log "SKIP: pointer generation failed"; exit 0; }

log "Found $(echo "$POINTERS" | wc -l) memory files"

# --- Build system prompt ---
read -r -d '' SYSTEM_PROMPT <<SEOF || true
You are a memory maintenance agent for a personal AI assistant project at ${AGENT_DIR}.

The user stores knowledge in markdown files in memory/. Your job is to review a conversation transcript and determine if any memories need updating or if new memories should be created.

CRITICAL RULES:
1. If nothing in the conversation warrants a memory update, exit IMMEDIATELY. Do NOT read any files. Do NOT touch anything. Most conversations need no memory updates — this is the common case.
2. Only update a memory if the conversation contains NEW factual information that contradicts, corrects, or meaningfully extends what is already stored.
3. Only create a new memory if a genuinely new topic was discussed that the user would want persisted long-term.
4. Do NOT make cosmetic changes, reformat, reorganize, or "improve" existing memories.
5. Do NOT create memories about transient things (one-off questions, debugging sessions, casual chat).
6. Memory file format: <memory-metadata> JSON block at top (managed by the pipeline — do NOT touch), then <memory> block containing the actual content. The first line inside <memory> = plaintext description for recall, footer = "---\nUpdate this memory when the information above becomes outdated."
7. New memory filenames must be kebab-case in memory/. When creating a new file, just write the content — the metadata pipeline will add <memory-metadata> tags automatically.
8. Only edit content inside <memory> tags. Never modify <memory-metadata> tags.

Current memories:
${POINTERS}
SEOF

# --- Run subclaude ---
log "Spawning memory update subclaude..."
STDERR_LOG=$(mktemp)
RESULT=$(echo "Review this conversation transcript and determine if any memories need updating or creating. If nothing needs changing, just say so and stop.

${CONVERSATION}" | AGENT_HOOK_ID="" BLOCK_HOOK_AGENTS=1 timeout 120 claude -p \
  --model opus \
  --max-turns 15 \
  --no-session-persistence \
  --allowedTools "Read,Edit,Write,Glob,Bash(python3 *)" \
  --system-prompt "$SYSTEM_PROMPT" \
  2>"$STDERR_LOG") || { log "subclaude failed or timed out"; log "stderr: $(cat "$STDERR_LOG")"; rm -f "$STDERR_LOG"; exit 0; }

if [[ -s "$STDERR_LOG" ]]; then
  log "subclaude stderr: $(cat "$STDERR_LOG")"
fi
rm -f "$STDERR_LOG"
log "subclaude response: ${RESULT:0:500}"
log "--- Memory update hook done ---"

exit 0
