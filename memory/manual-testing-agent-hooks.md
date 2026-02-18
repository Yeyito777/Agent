<memory-metadata>
{
  "frequency": 32,
  "last_accessed_session": 529,
  "created_session": 73,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
Manual testing Agent hooks in unique temp clone — running hooks manually with env vars (CLAUDE_PROJECT_DIR, AGENT_HOOK_ID, AGENT_TERMINAL_PID), bash -x tracing, mock memories and metadata, controlling runtime state (session-counter, last-forgetting-session, last-validation-session), st-notify notification testing, isolated sandbox

# Setup
Clone the Agent directory to a unique temp directory and run all tests against the clone. This isolates the live system from broken hooks, corrupted metadata, or accidental memory deletion. Using a unique name avoids colliding with other agents testing concurrently.

```bash
TEST_DIR=$(mktemp -d /tmp/Agent-test.XXXXXX)
cp -r /home/yeyito/Workspace/Agent/* "$TEST_DIR"/
```

## Path resolution
- `src/reconcile_metadata.py` uses `Path(__file__).resolve().parent.parent` — auto-resolves to the clone, no edits needed.
- Hook scripts use `$CLAUDE_PROJECT_DIR` — pass it as an env var when invoking manually.
- `start.sh` has a hardcoded `AGENT_DIR` — not used during manual hook testing (hooks use `CLAUDE_PROJECT_DIR`).

## Running hooks manually
Hooks expect specific env vars and stdin. Write stdin to a file and redirect — **do not pipe** `echo '{}' |` because Claude Code wraps commands in zsh `eval` which can corrupt multi-line piped commands:
```bash
echo '{}' > /tmp/hook-input.json
CLAUDE_PROJECT_DIR="$TEST_DIR" \
  AGENT_HOOK_ID="test01" \
  AGENT_TERMINAL_PID="" \
  bash "$TEST_DIR/src/hooks/forgetting-memories.sh" < /tmp/hook-input.json 2>&1
```

Key env vars:
- `CLAUDE_PROJECT_DIR` — the clone path (hooks derive all paths from this)
- `AGENT_HOOK_ID` — any test value; hooks use it for log filenames and session tracking
- `AGENT_TERMINAL_PID` — set to an st PID for notification testing, empty to skip notifications
- `BLOCK_HOOK_AGENTS` — leave unset (setting it causes hooks to exit immediately)

Create the hook's expected runtime files before invoking:
```bash
mkdir -p "$TEST_DIR/runtime"
touch "$TEST_DIR/runtime/hook-test01.log"
touch "$TEST_DIR/runtime/recalled-test01"
```

## Testing notifications
Spawn an st window in debug mode to see notification output:
```bash
st -d -e sleep 120 &>/tmp/st-debug.log &
ST_PID=$!
# Use ST_PID as AGENT_TERMINAL_PID when invoking hooks
# Check: cat /tmp/st-debug.log
```

## Using bash -x for tracing
When a hook isn't behaving as expected, run with `bash -x`. **Do not pipe through `tail`** — if the hook spawns `claude -p`, the pipe keeps the parent process alive indefinitely. Redirect to a file instead:
```bash
CLAUDE_PROJECT_DIR="$TEST_DIR" AGENT_HOOK_ID="test01" \
  bash -x "$TEST_DIR/src/hooks/some-hook.sh" < /tmp/hook-input.json > /tmp/trace.txt 2>&1
cat /tmp/trace.txt
```

# Test patterns

## Mock memories
Replace `$TEST_DIR/memory/*.md` with purpose-built test files:
- Clearly disposable memories (outdated info, notes that say "can delete")
- Clearly important memories (architecture docs, critical references)
- Edge cases (pinned memories with low scores)

Clear real metadata and regenerate:
```bash
rm -f "$TEST_DIR/memory-metadata/"*.json
python3 "$TEST_DIR/src/reconcile_metadata.py"
```

Then overwrite the generated metadata with known test values.

## Controlling runtime state
Use `printf` (not `echo`) and **chain with `&&`** — multi-line commands in Claude Code's zsh eval can concatenate into a single line, corrupting file contents:
```bash
printf '200' > "$TEST_DIR/runtime/session-counter" && printf '0' > "$TEST_DIR/runtime/last-forgetting-session"
```
Trigger/skip examples:
- `printf '200' > session-counter && printf '0' > last-forgetting-session` — triggers (200%200==0, lock≠200)
- `printf '200' > session-counter && printf '200' > last-forgetting-session` — skips (lock==200, already ran)
- `rm -f last-forgetting-session` — first-ever run (initializes)
- `printf '175' > session-counter && printf '75' > last-validation-session` — triggers (175%100==75, lock≠175)

**Always verify** after writing: `cat "$TEST_DIR/runtime/session-counter"` — corrupted values (e.g. `400 echo 200 echo {}`) cause `set -u` failures that are hard to diagnose.

## Testing hooks that spawn claude -p
These hooks actually call the Claude API and cost money. Test the logic around the spawn first (interval checks, scoring, env setup) using `bash -x` traces. Only run the full agent when the surrounding logic is verified.

## Sandbox gotchas
- Hooks that spawn `claude -p` fail with **exit 126** (permission denied) in Claude Code's sandbox. Use `dangerouslyDisableSandbox: true` for manual tests that need the full agent.
- `run_in_background` launches in a subshell — shell functions defined in the command body (e.g. `create_mock()`) don't affect the filesystem if the command is stopped or the subshell exits early. Prefer using the `Write` tool for creating test files.
- Metadata JSON files written via `echo "$VAR" > file.json` in multi-command bash blocks can get corrupted by zsh eval. Use the `Write` tool for JSON files.

# Cleanup
```bash
rm -rf "$TEST_DIR" /tmp/hook-input.json /tmp/trace.txt
```

# Forgetting agent behavior profile
From manual testing with mock memories (3 rounds, 9 memories total):

**Archives** — generic reference material with zero user-specific content:
- Completed/expired action items, one-off scripts, generic cheat sheets (python venv, git rebase)

**Keeps (+1)** — borderline, but has some user-specific detail mixed in:
- Generic templates that include user paths (`/home/yeyito/apps/`)
- Cheat sheets that note a user preference ("prefers yay over paru")
- Debug notes with specific IPs and resolutions

**Keeps (+2)** — confidently valuable, entirely user-specific:
- Network topology with IPs, VLANs, service assignments
- Backup/restore procedures with specific paths and schedules

**Decision boundary**: the agent forgets anything googleable with no user-specific details. The moment a memory contains user-specific information (IPs, paths, preferences, infrastructure), it tips to keep — even if the surrounding content is generic.

---
Update this memory when the manual testing methodology or Agent hook structure changes.
</memory>
