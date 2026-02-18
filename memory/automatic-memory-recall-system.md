<memory-metadata>
{
  "frequency": 47,
  "last_accessed_session": 529,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<memory>
Agent memory system architecture — recall/update/forgetting hook agents, UserPromptSubmit opus subclaude for recall, session counter, in-file memory-metadata (frequency, appreciation, pinned), agent.conf toggles, cold storage archival to memory-cold/, hook recursion prevention, runtime files, debugging hooks, memory_metadata.py

# Overview
Three hook-driven subagents, all toggleable via `agent.conf`:
1. **Recall agent** — A `UserPromptSubmit` hook spawns a one-shot `claude -p --model opus` call to determine which memories are relevant to the user's prompt. Relevant memories are surfaced once per session via deduplication. Toggle: `MEMORY_RECALL=on|off`.
2. **Update agent** — A `Stop` hook (async) spawns a subclaude after every response that reviews the conversation transcript and updates/creates memories if new persistent information was discussed. Toggle: `MEMORY_UPDATE=on|off`.
3. **Forgetting agent** — A `SessionStart` hook (async) spawns a subclaude on a configurable schedule (via `MEMORY_FORGETTING_SCHEDULE`, default `0/200` meaning session % 200 == 0) to review the lowest-scoring memories and either archive them to `memory-cold/` or bump their appreciation. Toggle: `MEMORY_FORGETTING=on|off`.

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

## Memory metadata (in-file)
Metadata is colocated inside each `memory/*.md` file using XML tags at the top:
```
<memory-metadata>
{
  "frequency": 5,
  "last_accessed_session": 42,
  "created_session": 30,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
...actual memory content...
</memory>
```
- `frequency` — incremented each time the recall hook surfaces the memory
- `last_accessed_session` — updated to current session on each recall
- `created_session` — set when metadata is first created
- `appreciation` — bonus score, set manually or by the forgetting agent to protect a memory
- `pinned` — if true, the forgetting agent will never consider this memory for archival

`src/memory_metadata.py` is the shared Python module for all metadata operations (read, write, ensure, get_description). It has a CLI interface for use from bash scripts.

`src/reconcile_metadata.py` ensures every memory file has metadata tags (adds defaults if missing). Runs at every session start via `start.sh`. If a new memory is created without tags, reconcile adds them automatically.

## Standalone recall script (`src/recall.sh`)
The source of truth for recall logic. Takes a user prompt on stdin, outputs recalled `memory/*.md` filenames to stdout (one per line). Used by the hook and by `benchmark/recall/run-benchmark.sh`.

Supports two schemes configured via `agent.conf`:

**Single scheme** (`MEMORY_RECALL_SCHEME=single`):
1. Generates memory pointers via `memory_metadata.get_description()` (reads first line inside `<memory>` tags)
2. Loads prompt template from `prompts/<name>.md` (first name in `MEMORY_RECALL_PROMPTS`)
3. Calls `claude -p --model <MODEL1> --max-turns 1 --no-session-persistence` with pointers + user prompt
4. Parses response: validates files exist on disk, outputs valid filenames

**Double scheme** (`MEMORY_RECALL_SCHEME=double`, default):
1. **Pass 1 (broad candidate selection):** Same as single — generates pointers, loads first prompt template, calls `MODEL1`. Biased toward overrecall.
2. **Pass 2 (re-rank with full content):** Reads the full content of each pass 1 candidate, loads second prompt template, calls `MODEL2`. Filters to only memories whose specific content is actually needed. Can return nothing if no candidates are truly relevant.
3. Pass 2 results are constrained to pass 1 candidates (can only remove, not add). On pass 2 failure, falls back to pass 1 results.

All inner `claude -p` calls run with `AGENT_HOOK_ID=""` and `BLOCK_HOOK_AGENTS=1` (see gotchas below).

Prompt templates live in `prompts/` as `.md` files. The script appends `<user_prompt>` tags and `Available memories:` (pass 1) or `Candidate memories:` with full content (pass 2).

Current best config (v5, ~75-79% perfect on benchmark):
```
MEMORY_RECALL_SCHEME=double
MEMORY_RECALL_MODELS=opus/opus
MEMORY_RECALL_PROMPTS=recall-v5-pass1/recall-v5-pass2
```

## Recall hook (`src/hooks/recall-memories.sh`)
Wired as `UserPromptSubmit` in `.claude/settings.local.json` (60s timeout, "Recalling memories..." spinner). Delegates core recall to `src/recall.sh`.

Flow per message:
1. On first message of session: increments session counter, writes hook ID to `runtime/session-last-increment`
2. Validates `AGENT_HOOK_ID` and tracking file exist (exit 2 if not — blocks prompt, notifies user)
3. Extracts prompt from stdin JSON via `jq`
4. Pipes prompt into `src/recall.sh`, captures output
5. Deduplicates against `recalled-<id>` ledger
6. For each recalled memory, updates its in-file metadata via `memory_metadata.py`: increments `frequency`, sets `last_accessed_session`
7. New memories appended to tracking file, output as `Relevant memories: memory/foo.md memory/bar.md`
8. If memories were recalled and `AGENT_TERMINAL_PID` is set, fires one `st-notify` toast per memory (teal border on dark green bg, backgrounded)
9. stdout with exit 0 = context injected into the main Claude session

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
6. The subclaude is instructed to only edit content inside `<memory>` tags and never touch `<memory-metadata>` tags
7. All output logged to `runtime/hook-<id>.log` with `[update]` prefix

## Forgetting hook (`src/hooks/forgetting-memories.sh`)
Wired as `SessionStart` in `.claude/settings.local.json` with `async: true` (300s timeout). Fires on every session start (new or resume).

Flow:
1. Checks `MEMORY_FORGETTING` toggle in `agent.conf`
2. Reads `runtime/session-counter` for current session number
3. Reads `MEMORY_FORGETTING_SCHEDULE` from `agent.conf` (default `0/200`), parses as `offset/cycle`, skips if `session % cycle != offset`; compares against `runtime/last-forgetting-session` lock to prevent duplicate runs
4. On first-ever run, initializes `last-forgetting-session` and exits (no cleanup on first use)
5. Sends pink st-notify toast: "Memory forgetting started" (45s, `#ff6b9d` border, `#1a0010` bg)
6. Spawns `claude -p --model opus --max-turns 30 --dangerously-skip-permissions` with `PATH` prepended to include `src/memory/` (for `forget-memory` and `appreciate-memory` commands)
7. The forgetting agent:
   - Runs a Python scoring snippet: `score = log2(1 + freq) * e^(-0.003466 * sessions_since_last_access) + appreciation` (200-session half-life)
   - Reviews bottom 3 non-pinned memories by reading their content
   - Decides per memory: bump appreciation (keep) or `mv` to `memory-cold/` (archive)
   - Sends per-memory pink st-notify toasts for each archived memory: "Forgot memory/{name}.md"

## Cold storage (`memory-cold/`)
When the forgetting agent archives a memory, the file is moved:
- `memory/{name}.md` → `memory-cold/{name}.md` (metadata travels with the file since it's embedded)

To restore: move the file back to `memory/`. The next reconciliation pass picks it up.

## Cleanup hook (`src/hooks/cleanup-runtime.sh`)
Wired to `SessionEnd`. Deletes `runtime/recalled-<id>` and `runtime/hook-<id>.log`.

# Configuration
`agent.conf` at project root controls which subagents are active:
```
MEMORY_RECALL=on       # recall agent (UserPromptSubmit)
MEMORY_UPDATE=on       # update agent (Stop, async)
MEMORY_FORGETTING=on   # forgetting agent (SessionStart, async)
MEMORY_VALIDATION=on   # validation agent (SessionStart, async)
```
Set to `off` to disable. Checked on every hook invocation — no restart needed.

Recall agent settings:
```
MEMORY_RECALL_SCHEME=double              # single or double (two-pass)
MEMORY_RECALL_MODELS=opus/opus           # model1/model2 (single uses model1 only)
MEMORY_RECALL_PROMPTS=recall-v5-pass1/recall-v5-pass2  # prompt names from prompts/ dir (single uses first only)
```
Prompt templates are stored in `prompts/` as `.md` files (e.g. `prompts/recall-v5-pass1.md`). The name in the config omits the `.md` extension.

Hook schedules are also configurable in `agent.conf` as `offset/cycle` (fires when `session % cycle == offset`):
```
MEMORY_FORGETTING_SCHEDULE=0/200    # fires at session % 200 == 0
MEMORY_VALIDATION_SCHEDULE=75/100   # fires at session % 100 == 75
```
If absent, hooks fall back to the defaults shown above.

# Key files
- `agent.conf` — subagent toggles and recall config
- `src/recall.sh` — standalone recall logic (source of truth, config-driven)
- `prompts/` — recall prompt templates (`.md` files referenced by `MEMORY_RECALL_PROMPTS`)
- `src/hooks/recall-memories.sh` — recall agent hook (calls `src/recall.sh`)
- `src/hooks/update-memories.sh` — update agent hook
- `src/hooks/forgetting-memories.sh` — forgetting agent hook
- `src/hooks/cleanup-runtime.sh` — cleanup hook
- `src/memory_metadata.py` — shared Python module for in-file metadata operations (read, write, ensure, get_description)
- `src/reconcile_metadata.py` — ensures all memory files have metadata tags (called by `start.sh`)
- `.claude/settings.local.json` — hook wiring (project-local, gitignored by Claude Code)
- `runtime/` — gitignored directory for session tracking files and logs
- `runtime/session-counter` — global session count (persists across sessions)
- `runtime/session-last-increment` — hook ID that last incremented the counter
- `runtime/last-forgetting-session` — session number of last forgetting run
- `memory-cold/` — archived memories with embedded metadata (git-tracked)
- `scripts/run-forgetting` — manual forgetting trigger
- `scripts/run-validation` — manual validation trigger
- `scripts/get-forgetting-candidates` — print lowest-scoring memories without running the agent

# Known gotchas
1. **Hook recursion:** The inner `claude -p` runs in the same project and inherits `.claude/settings.local.json` hooks. Without `BLOCK_HOOK_AGENTS=1`, the inner session's `UserPromptSubmit` fires the recall hook again — which either blocks it (exit 2 from missing AGENT_HOOK_ID) or recurses infinitely. Every hook checks `BLOCK_HOOK_AGENTS` at the very top and exits 0 immediately if set.
2. **SessionEnd cascade:** Without `AGENT_HOOK_ID=""`, the inner `claude -p` finishing triggers `cleanup-runtime.sh`, which deletes the main session's tracking file mid-session. The cleanup and resume hooks don't check `BLOCK_HOOK_AGENTS` but are independently protected by the empty `AGENT_HOOK_ID`.
3. **`--allowedTools` Bash patterns are unreliable in `-p` mode:** `Bash(cmd *)` patterns for custom scripts silently fail — the agent runs but Bash tool calls get denied with "needs your approval" (which can't be granted in non-interactive `-p` mode). Tested: bare names, colon syntax, absolute paths — none worked. For subagents that need Bash, use `--dangerously-skip-permissions` instead and constrain behavior through the prompt and `--max-turns`. Standard tool names (Read, Edit, Write, Glob) work fine in `--allowedTools`.

# Debugging
Watch the log in real time from another terminal:
```
tail -f runtime/hook-*.log
```
Log shows: prompt received, pointer count, opus response, each memory's accept/reject/dedup status, final output.

---
Update this memory when hook scripts, settings, or the agent() startup flow change.
</memory>
