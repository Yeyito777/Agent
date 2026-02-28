<memory-metadata>
{
  "frequency": 40,
  "last_accessed_session": 1201,
  "created_session": 73,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions regression tests, run.sh, test suite, or modifying hooks.
</conditional>

<fuzzy-match>
run.sh, regression tests, mock claude, tests/run.sh, hook tests
</fuzzy-match>

<memory>
The Agent project has a regression test suite that should always be run before manual testing when modifying hooks or infrastructure.

## Running the tests

```bash
./tests/run.sh
```

The suite contains 60 automated assertions across three categories: validation, forgetting, and cross-hook scheduling. It uses a mock `claude` binary so there are no API calls and no cost. The tests cover gating logic, lock mechanisms, toggles, recursion guards, memory selection, and prompt construction.

Each run clones the repo to a unique `/tmp/Agent-test.XXXXXX` temp directory (via `mktemp -d`) and cleans up on exit, so concurrent runs are safe. You can filter tests by substring:

```bash
./tests/run.sh validation
./tests/run.sh forgetting
./tests/run.sh cross-hook
```

## Adding new tests

When adding a new hook or changing scheduling logic, add corresponding test functions to `tests/run.sh`. Follow the existing patterns in the file for setup, assertions, and teardown.

---
Update this memory when the test suite structure, assertion count, or test categories change.
</memory>
