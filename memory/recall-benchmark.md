<memory-metadata>
{
  "frequency": 26,
  "last_accessed_session": 0,
  "created_session": 142,
  "appreciation": 2,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions the recall benchmark, recall accuracy testing, .bench files, autogenerate.sh, run-benchmark.sh, or scoring recall results.
</conditional>

<fuzzy-match>
recall benchmark, .bench, autogenerate.sh, run-benchmark.sh, recall-prompts.md, PERFECT OVERRECALL UNDERRECALL, benchmark/recall
</fuzzy-match>

<memory>
Benchmark suite for measuring how accurately the recall agent identifies relevant memories from a user prompt. Everything lives in `benchmark/recall/`.

## Key files

The recall logic itself is in `src/recall.sh` — the standalone, source-of-truth script that takes a prompt on stdin and outputs `memory/*.md` filenames on stdout. It is config-driven via `agent.conf` (scheme, models, prompts). The prompt templates it uses live in `prompts/` as `.md` files, referenced by name in the `MEMORY_RECALL_PROMPTS` config. Current templates: `recall-v3.md`, `recall-v4.md`, `recall-v5-pass1.md`, `recall-v5-pass2.md`.

Within the benchmark directory:

- `autogenerate.sh` — generates `.bench` test cases using opus. Picks random memories, asks opus to craft a related prompt with self-validation (opus reports which memories are genuinely relevant).
- `run-benchmark.sh` — runs all `.bench` files through `src/recall.sh`, scores each one, and writes results.
- `recall-prompts.md` — version log of recall agent prompts that have been tested, with benchmark results per version.
- `tests/*.bench` — the test case files.
- `results/*.result` — the benchmark result files.

## .bench file format

```
## Recall Benchmark Test
## Generated: <timestamp>
## Picked: <int>
## Expected: <int>

[expected]
memory/foo.md
memory/bar.md

[prompt]
<user prompt text>
```

The expected section can be empty for no-recall tests (prompts where zero memories should be recalled).

## Generating tests with autogenerate.sh

Options:

- `--samples <int>` — how many `.bench` files to generate (default: 1).
- `--amount <int>` — how many memories to pick (default: random 0-5). Use `--amount 0` to generate no-recall tests.
- `--name <string>` — name for the `.bench` file(s) (default: random hex ID).

For normal tests (amount >= 1), the script picks N random memories, sends their full content to opus, and asks it to write a realistic prompt while self-validating which memories are genuinely relevant. Only validated memories go into `[expected]`. For no-recall tests (amount = 0), it uses sonnet to generate a generic conversational message (confirmation, correction, follow-up, reaction, etc.) with a random category for diversity. The expected set is left empty.

## Scoring

Each test is classified into one of three outcomes:

- **PERFECT** — recalled exactly the expected set (including empty for no-recall tests).
- **OVERRECALL** — got all expected memories plus extras.
- **UNDERRECALL** — missed at least one expected memory (may also have extras).

Result files contain a `[summary]` with aggregate stats (counts, percentages, total misrecalled memories) and a `[tests]` section with per-test breakdowns.

---
Update this memory when benchmark scripts, file formats, or scoring logic change.
</memory>
