<memory-metadata>
{
  "frequency": 21,
  "last_accessed_session": 529,
  "created_session": 73,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
Regression tests for Agent hooks — tests/run.sh, automated assertions, mock claude binary, validation tests, forgetting tests, cross-hook scheduling tests, adding new test functions

# Running regression tests
**Always run regression tests first** before manual testing when modifying hooks or Agent infrastructure:
```bash
./tests/run.sh
```
- 60 automated assertions covering validation, forgetting, and cross-hook scheduling
- Uses a mock `claude` binary (no API calls, no cost) — tests all gating logic, lock mechanisms, toggles, recursion guards, memory selection, and prompt construction
- Clones to a unique `/tmp/Agent-test.XXXXXX` temp dir internally (via `mktemp -d`), cleans up on exit — safe to run concurrently
- Filter by substring: `./tests/run.sh validation`, `./tests/run.sh forgetting`, `./tests/run.sh cross-hook`

# Adding new tests
If adding a new hook or changing scheduling logic, add corresponding test functions to `tests/run.sh`. Follow the existing patterns in the file for setup, assertions, and teardown.

---
Update this memory when the test suite structure, assertion count, or test categories change.
</memory>
