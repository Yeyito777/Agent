<memory-metadata>
{
  "frequency": 16,
  "last_accessed_session": 529,
  "created_session": 142,
  "appreciation": 2,
  "pinned": false
}
</memory-metadata>

<memory>
Recall benchmark system — benchmark/recall/, autogenerate.sh, run-benchmark.sh, src/recall.sh standalone recall script, .bench file format, .result scoring, recall-prompts.md prompt version log, testing recall accuracy, prompts/ directory

# Overview
Benchmark suite for measuring how well the recall agent identifies relevant memories from a user prompt. Lives in `benchmark/recall/`.

# Key files
- `src/recall.sh` — standalone recall logic (source of truth). Prompt on stdin, `memory/*.md` filenames on stdout. Config-driven via `agent.conf` (scheme, models, prompts).
- `prompts/` — prompt template files (`.md`) used by `src/recall.sh`. Referenced by name in `MEMORY_RECALL_PROMPTS` config. Current: `recall-v3.md`, `recall-v4.md`, `recall-v5-pass1.md`, `recall-v5-pass2.md`.
- `benchmark/recall/autogenerate.sh` — generates `.bench` test cases using opus. Picks random memories, asks opus to craft a related prompt with self-validation (opus reports which memories are genuinely relevant).
- `benchmark/recall/run-benchmark.sh` — runs all `.bench` files through `src/recall.sh`, scores and writes results
- `benchmark/recall/recall-prompts.md` — version log of recall agent prompts that have been tested, with benchmark results per version
- `benchmark/recall/tests/*.bench` — test case files
- `benchmark/recall/results/*.result` — benchmark result files

# .bench file format
```
# Recall Benchmark Test
# Generated: <timestamp>
# Picked: <int>
# Expected: <int>

[expected]
memory/foo.md
memory/bar.md

[prompt]
<user prompt text>
```
Expected section can be empty for no-recall tests (prompts where zero memories should be recalled).

# autogenerate.sh options
- `--samples <int>` — how many .bench files to generate (default: 1)
- `--amount <int>` — how many memories to pick (default: random 0-5). Use `--amount 0` to generate no-recall tests.
- `--name <string>` — name for the .bench file(s) (default: random hex ID)

## Test generation
- **Normal tests (amount >= 1):** Picks N random memories, sends full content to opus, asks it to write a realistic prompt and self-validate which memories are genuinely relevant. Only validated memories go into `[expected]`.
- **No-recall tests (amount = 0):** Uses sonnet to generate a generic conversational message (confirmation, correction, follow-up, reaction, etc.) with a random category for diversity. Expected set is empty.

# Scoring
Each test is classified as:
- **PERFECT** — recalled exactly the expected set (including empty for no-recall tests)
- **OVERRECALL** — got all expected memories plus extras
- **UNDERRECALL** — missed at least one expected memory (may also have extras)

Result files contain a `[summary]` with aggregate stats (counts, percentages, total misrecalled memories) and a `[tests]` section with per-test breakdowns.

---
Update this memory when benchmark scripts, file formats, or scoring logic change.
</memory>
