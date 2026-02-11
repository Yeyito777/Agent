Agent memory system architecture — recall/update/forgetting hook agents, UserPromptSubmit opus subclaude for recall, session counter, memory-metadata JSON (frequency, appreciation, pinned), agent.conf toggles, cold storage archival to memory-cold/, hook recursion prevention, runtime files, debugging hooks

# Overview
Three hook-driven subagents, all toggleable via `agent.conf`:
1. **Recall agent** — A `UserPromptSubmit` hook spawns a one-shot `claude -p --model opus` call to determine which memories are relevant to the user's prompt. Relevant memories are surfaced once per session via deduplication. Toggle: `MEMORY_RECALL=on|off`.
2. **Update agent** — A `Stop` hook (async) spawns a subclaude after every response that reviews the conversation transcript and updates/creates memories if new persistent information was discussed. Toggle: `MEMORY_UPDATE=on|off`.
3. **Forgetting agent** — A `SessionStart` hook (async) spawns a subclaude every ~60 sessions to review the lowest-scoring memories and either archive them to `memory-cold/` or bump their appreciation. Toggle: `MEMORY_FORGETTING=on|off`.

# Architecture

## Shell launcher (`src/start.sh`, aliased as `agent` in `~/.zshrc`)
1. `cd` to Agent project
2. Generates `AGENT_HOOK_ID` via `openssl rand -hex 4` (8 hex chars), exports it
3. Captures `AGENT_TERMINAL_PID` by walking up the process tree: first looks for an ancestor named `st`, falls back to first ancestor owning an X window. Exported for hooks to use with `st-notify`
4. Runs `python3 src/reconcile_metadata.py` to sync `memory/` with `memory-metadata/`
5. Sends a pink st-notify toast showing the upcoming session number (current counter + 1)
6. Creates `runtime/recalled-<id>` (dedup ledger) and `runtime/hook-<id>.log` (debug log)
7. Launches `claude --dangerously-skip-permissions`

## Session counter
Tracks how many sessions have been actively used (not just opened).
- `runtime/session-counter` — persists across sessions, starts at 0
- Incremented on the **first message** of each session (not on launch), so accidental opens don't count
- The recall hook compares `AGENT_HOOK_ID` against `runtime/session-last-increment` to detect first-message-of-session
- On launch, `start.sh` shows a preview notification with `counter + 1` (the number it will become)

## Memory metadata (`memory-metadata/`)
Each `memory/*.md` file has a corresponding `memory-metadata/{name}.json`:
```json
{
  "frequency": 5,
  "last_accessed_session": 42,
  "created_session": 30,
  "appreciation": 0,
  "pinned": false
}
```
- `frequency` — incremented each time the recall hook surfaces the memory
- `last_accessed_session` — updated to current session on each recall
- `created_session` — set when metadata is first created
- `appreciation` — bonus score, set manually or by the forgetting agent to protect a memory
- `pinned` — if true, the forgetting agent will never consider this memory for archival

`src/reconcile_metadata.py` keeps metadata in sync: creates defaults for new memories, deletes orphans for removed memories. Runs at every session start via `start.sh`.

## Recall hook (`src/hooks/recall-memories.sh`)
Wired as `UserPromptSubmit` in `.claude/settings.local.json` (60s timeout, "Recalling memories..." spinner).

Flow per message:
1. On first message of session: increments session counter, writes hook ID to `runtime/session-last-increment`
2. Validates `AGENT_HOOK_ID` and tracking file exist (exit 2 if not — blocks prompt, notifies user)
3. Extracts prompt from stdin JSON via `jq`
4. Generates memory pointers via inline python (walks `memory/*.md`, reads first line as description)
5. Calls `claude -p --model opus --max-turns 1 --no-session-persistence` with system prompt constraining output to bare filenames only
6. Inner `claude -p` runs with `AGENT_HOOK_ID=""` and `RECALL_HOOK_RUNNING=1` (see gotchas below)
7. Parses opus response: validates files exist on disk, checks against `recalled-<id>` for dedup
8. For each recalled memory, updates its metadata: increments `frequency`, sets `last_accessed_session`
9. New memories appended to tracking file, output as `Relevant memories: memory/foo.md memory/bar.md`
10. If memories were recalled and `AGENT_TERMINAL_PID` is set, fires one `st-notify` toast per memory (teal border on dark green bg, backgrounded)
11. stdout with exit 0 = context injected into the main Claude session

## Resume hook (inline in `.claude/settings.local.json`)
Wired to `SessionStart` with `"matcher": "resume"`. Truncates `runtime/recalled-<id>` so the dedup ledger resets on session resume. This allows all memories to be re-surfaced when switching between sessions, since the previous session's conversation context may no longer be present.

## Memory update hook (`src/hooks/update-memories.sh`)
Wired as `Stop` in `.claude/settings.local.json` with `async: true` (300s timeout). Runs in the background after every Claude response.

Flow:
1. Reads `transcript_path` from stdin JSON
2. Extracts last 50 user/assistant messages from the JSONL transcript via python
3. Generates current memory pointers
4. Spawns `claude -p --model opus --max-turns 15 --allowedTools "Read,Edit,Write,Glob,Bash(python3 *)"` with a strict system prompt
5. System prompt emphasizes: if nothing needs updating, exit immediately without touching files
6. If the subclaude does edit/create memories, it is instructed to run `python3 src/refresh_pointers.py` — however, this file no longer exists on disk (also commented out in `start.sh`)
7. All output logged to `runtime/hook-<id>.log` with `[update]` prefix

## Forgetting hook (`src/hooks/forgetting-memories.sh`)
Wired as `SessionStart` in `.claude/settings.local.json` with `async: true` (300s timeout). Fires on every session start (new or resume).

Flow:
1. Checks `MEMORY_FORGETTING` toggle in `agent.conf`
2. Reads `runtime/session-counter` for current session number
3. Compares against `runtime/last-forgetting-session` — skips if fewer than 60 sessions have passed
4. On first-ever run, initializes `last-forgetting-session` and exits (no cleanup on first use)
5. Sends pink st-notify toast: "Memory forgetting started" (45s, `#ff6b9d` border, `#1a0010` bg)
6. Spawns `claude -p --model opus --max-turns 30` with tools: `Read,Write,Glob,Bash(mv/mkdir/ls/cd/st-notify/python3)`
7. The forgetting agent:
   - Runs a Python scoring snippet: `score = log2(1 + freq) * e^(-0.003466 * sessions_since_last_access) + appreciation` (200-session half-life)
   - Reviews bottom 3 non-pinned memories by reading their content
   - Decides per memory: bump appreciation (keep) or `mv` to `memory-cold/` (archive)
   - Sends per-memory pink st-notify toasts for each archived memory: "Forgot memory/{name}.md"

## Cold storage (`memory-cold/`)
When the forgetting agent archives a memory, both files are moved:
- `memory/{name}.md` → `memory-cold/{name}.md`
- `memory-metadata/{name}.json` → `memory-cold/{name}.json`

To restore: move both files back. The next reconciliation pass picks them up.

## Cleanup hook (`src/hooks/cleanup-runtime.sh`)
Wired to `SessionEnd`. Deletes `runtime/recalled-<id>` and `runtime/hook-<id>.log`.

# Configuration
`agent.conf` at project root controls which subagents are active:
```
MEMORY_RECALL=on       # recall agent (UserPromptSubmit)
MEMORY_UPDATE=on       # update agent (Stop, async)
MEMORY_FORGETTING=on   # forgetting agent (SessionStart, async)
```
Set to `off` to disable. Checked on every hook invocation — no restart needed.

# Key files
- `agent.conf` — subagent toggles
- `src/hooks/recall-memories.sh` — recall agent hook
- `src/hooks/update-memories.sh` — update agent hook
- `src/hooks/forgetting-memories.sh` — forgetting agent hook
- `src/hooks/cleanup-runtime.sh` — cleanup hook
- `src/reconcile_metadata.py` — metadata reconciliation (called by `start.sh`)
- `.claude/settings.local.json` — hook wiring (project-local, gitignored by Claude Code)
- `runtime/` — gitignored directory for session tracking files and logs
- `runtime/session-counter` — global session count (persists across sessions)
- `runtime/session-last-increment` — hook ID that last incremented the counter
- `runtime/last-forgetting-session` — session number of last forgetting run
- `memory-metadata/` — per-memory JSON metadata (git-tracked)
- `memory-cold/` — archived memories + metadata (git-tracked)

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
