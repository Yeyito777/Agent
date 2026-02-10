Automatic memory recall system — how memories are surfaced via hooks, architecture, and debugging

# Overview
Two hook-driven subagents, both toggleable via `agent.conf`:
1. **Recall agent** — A `UserPromptSubmit` hook spawns a one-shot `claude -p --model opus` call to determine which memories are relevant to the user's prompt. Relevant memories are surfaced once per session via deduplication. Toggle: `MEMORY_RECALL=on|off`.
2. **Update agent** — A `Stop` hook (async) spawns a subclaude after every response that reviews the conversation transcript and updates/creates memories if new persistent information was discussed. Toggle: `MEMORY_UPDATE=on|off`.

# Architecture

## Shell launcher (`src/start.sh`, aliased as `agent` in `~/.zshrc`)
1. `cd` to Agent project
2. Runs `src/refresh_pointers.py` to update CLAUDE.md pointer section
3. Generates `AGENT_HOOK_ID` via `openssl rand -hex 4` (8 hex chars), exports it
4. Captures `AGENT_TERMINAL_PID` by walking up the process tree: first looks for an ancestor named `st`, falls back to first ancestor owning an X window. Exported for hooks to use with `st-notify`
5. Creates `runtime/recalled-<id>` (dedup ledger) and `runtime/hook-<id>.log` (debug log)
6. Launches `claude --dangerously-skip-permissions`

## Recall hook (`src/hooks/recall-memories.sh`)
Wired as `UserPromptSubmit` in `.claude/settings.local.json` (30s timeout, "Recalling memories..." spinner).

Flow per message:
1. Validates `AGENT_HOOK_ID` and tracking file exist (exit 2 if not — blocks prompt, notifies user)
2. Extracts prompt from stdin JSON via `jq`
3. Generates memory pointers via inline python (walks `memory/*.md`, reads first line as description)
4. Calls `claude -p --model opus --max-turns 1 --no-session-persistence` with system prompt constraining output to bare filenames only
5. Inner `claude -p` runs with `AGENT_HOOK_ID=""` and `RECALL_HOOK_RUNNING=1` (see gotchas below)
6. Parses opus response: validates files exist on disk, checks against `recalled-<id>` for dedup
7. New memories appended to tracking file, output as `Relevant memories: memory/foo.md memory/bar.md`
8. If memories were recalled and `AGENT_TERMINAL_PID` is set, fires one `st-notify` toast per memory (7s timeout, small text, warm peach `#ffaf87` border/fg on dark `#0a0806` bg, backgrounded)
9. stdout with exit 0 = context injected into the main Claude session

## Resume hook (inline in `.claude/settings.local.json`)
Wired to `SessionStart` with `"matcher": "resume"`. Truncates `runtime/recalled-<id>` so the dedup ledger resets on session resume. This allows all memories to be re-surfaced when switching between sessions, since the previous session's conversation context may no longer be present.

## Memory update hook (`src/hooks/update-memories.sh`)
Wired as `Stop` in `.claude/settings.local.json` with `async: true` (180s timeout). Runs in the background after every Claude response.

Flow:
1. Reads `transcript_path` from stdin JSON
2. Extracts last 50 user/assistant messages from the JSONL transcript via python
3. Generates current memory pointers
4. Spawns `claude -p --model opus --max-turns 15 --allowedTools "Read,Edit,Write,Glob,Bash(python3 *)"` with a strict system prompt
5. System prompt emphasizes: if nothing needs updating, exit immediately without touching files
6. If the subclaude does edit/create memories, it runs `python3 src/refresh_pointers.py` to keep CLAUDE.md pointers in sync
7. All output logged to `runtime/hook-<id>.log` with `[update]` prefix

## Cleanup hook (`src/hooks/cleanup-runtime.sh`)
Wired to `SessionEnd`. Deletes `runtime/recalled-<id>` and `runtime/hook-<id>.log`.

# Configuration
`agent.conf` at project root controls which subagents are active:
```
MEMORY_RECALL=on    # recall agent (UserPromptSubmit)
MEMORY_UPDATE=on    # update agent (Stop, async)
```
Set to `off` to disable. Checked on every hook invocation — no restart needed. Both hooks check this file early and exit 0 silently if disabled.

# Key files
- `agent.conf` — subagent toggles (MEMORY_RECALL, MEMORY_UPDATE)
- `src/hooks/recall-memories.sh` — recall agent hook (referenced by `.claude/settings.local.json`)
- `src/hooks/update-memories.sh` — update agent hook (referenced by `.claude/settings.local.json`)
- `src/hooks/cleanup-runtime.sh` — cleanup hook (referenced by `.claude/settings.local.json`)
- `src/hooks/test-recall.sh` — test harness for the recall system (run with `bash src/hooks/test-recall.sh`)
- `.claude/settings.local.json` — hook wiring (project-local, gitignored by Claude Code)
- `runtime/` — gitignored directory for session tracking files and logs

# Known gotchas
1. **Hook recursion:** The inner `claude -p` runs in the same project and inherits `.claude/settings.local.json` hooks. Without `RECALL_HOOK_RUNNING=1`, the inner session's `UserPromptSubmit` fires the recall hook again — which either blocks it (exit 2 from missing AGENT_HOOK_ID) or recurses infinitely. The hook checks `RECALL_HOOK_RUNNING` at the very top and exits 0 immediately if set.
2. **SessionEnd cascade:** Without `AGENT_HOOK_ID=""`, the inner `claude -p` finishing triggers `cleanup-runtime.sh`, which deletes the main session's tracking file mid-session.

# Debugging
Watch the log in real time from another terminal:
```
tail -f runtime/hook-*.log
```
Log shows: prompt received, pointer count, opus response, each memory's accept/reject/dedup status, final output.

---
Update this memory when hook scripts, settings, or the agent() startup flow change.
