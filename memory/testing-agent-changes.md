Testing Agent system changes safely — regression tests (tests/run.sh), clone to /tmp/Agent-test, running hooks manually with env vars (CLAUDE_PROJECT_DIR, AGENT_HOOK_ID, AGENT_TERMINAL_PID), bash -x tracing, mock memories and metadata, controlling runtime state (session-counter, last-forgetting-session, last-validation-session), st-notify notification testing

# Regression tests
**Always run regression tests first** before manual testing when modifying hooks or Agent infrastructure:
```bash
./tests/run.sh
```
- 60 automated assertions covering validation, forgetting, and cross-hook scheduling
- Uses a mock `claude` binary (no API calls, no cost) — tests all gating logic, lock mechanisms, toggles, recursion guards, memory selection, and prompt construction
- Clones to `/tmp/Agent-test` internally, cleans up on exit
- Filter by substring: `./tests/run.sh validation`, `./tests/run.sh forgetting`, `./tests/run.sh cross-hook`
- If adding a new hook or changing scheduling logic, add corresponding test functions to `tests/run.sh`

# Manual testing methodology
Clone the Agent directory to `/tmp/Agent-test` and run all tests against the clone. This isolates the live system from broken hooks, corrupted metadata, or accidental memory deletion.

# Setup

```bash
rm -rf /tmp/Agent-test && cp -r /home/yeyito/Workspace/Agent /tmp/Agent-test
```

## Path resolution
- `src/reconcile_metadata.py` uses `Path(__file__).resolve().parent.parent` — auto-resolves to the clone, no edits needed.
- Hook scripts use `$CLAUDE_PROJECT_DIR` — pass it as an env var when invoking manually.
- `start.sh` has a hardcoded `AGENT_DIR` — not used during manual hook testing (hooks use `CLAUDE_PROJECT_DIR`).

## Running hooks manually
Hooks expect specific env vars and stdin. Simulate with:
```bash
echo '{}' | \
  CLAUDE_PROJECT_DIR="/tmp/Agent-test" \
  AGENT_HOOK_ID="test01" \
  AGENT_TERMINAL_PID="" \
  bash /tmp/Agent-test/src/hooks/forgetting-memories.sh
```

Key env vars:
- `CLAUDE_PROJECT_DIR` — the clone path (hooks derive all paths from this)
- `AGENT_HOOK_ID` — any test value; hooks use it for log filenames and session tracking
- `AGENT_TERMINAL_PID` — set to an st PID for notification testing, empty to skip notifications
- `RECALL_HOOK_RUNNING` — leave unset (setting it causes hooks to exit immediately)

Create the hook's expected runtime files before invoking:
```bash
mkdir -p /tmp/Agent-test/runtime
touch /tmp/Agent-test/runtime/hook-test01.log
touch /tmp/Agent-test/runtime/recalled-test01
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
When a hook isn't behaving as expected, run with `bash -x` to see every line executed:
```bash
echo '{}' | CLAUDE_PROJECT_DIR="/tmp/Agent-test" AGENT_HOOK_ID="test01" \
  bash -x /tmp/Agent-test/src/hooks/some-hook.sh 2>&1 | tail -40
```

# Test patterns

## Mock memories
Replace `/tmp/Agent-test/memory/*.md` with purpose-built test files:
- Clearly disposable memories (outdated info, notes that say "can delete")
- Clearly important memories (architecture docs, critical references)
- Edge cases (pinned memories with low scores)

Clear real metadata and regenerate:
```bash
rm -f /tmp/Agent-test/memory-metadata/*.json
python3 /tmp/Agent-test/src/reconcile_metadata.py
```

Then overwrite the generated metadata with known test values.

## Controlling runtime state
Set specific values to trigger or skip behaviors:
```bash
echo "100" > /tmp/Agent-test/runtime/session-counter
echo "0"   > /tmp/Agent-test/runtime/last-forgetting-session  # triggers at session 200 (200%200==0, lock≠200)
echo "200" > /tmp/Agent-test/runtime/last-forgetting-session  # skips at session 200 (lock==200, already ran)
rm -f /tmp/Agent-test/runtime/last-forgetting-session          # first-ever run (initializes)
echo "75"  > /tmp/Agent-test/runtime/last-validation-session   # triggers at session 175 (175%100==75, lock≠175)
echo "175" > /tmp/Agent-test/runtime/last-validation-session   # skips at session 175 (lock==175, already ran)
rm -f /tmp/Agent-test/runtime/last-validation-session           # first-ever run (initializes)
```

## Testing hooks that spawn claude -p
These hooks actually call the Claude API and cost money. Test the logic around the spawn first (interval checks, scoring, env setup) using `bash -x` traces. Only run the full agent when the surrounding logic is verified.

# Cleanup
```bash
rm -rf /tmp/Agent-test
```

---
Update this memory when the testing methodology or Agent structure changes.
