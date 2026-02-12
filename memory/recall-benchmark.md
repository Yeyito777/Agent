Recall benchmark system — benchmark/recall/, autogenerate.sh, run-benchmark.sh, src/recall.sh standalone recall script, .bench file format, .result scoring, recall-prompts.md prompt version log, testing recall accuracy

# Overview
Benchmark suite for measuring how well the recall agent identifies relevant memories from a user prompt. Lives in `benchmark/recall/`.

# Key files
- `src/recall.sh` — standalone recall logic (source of truth). Prompt on stdin, `memory/*.md` filenames on stdout. Used by the hook and the benchmark.
- `benchmark/recall/autogenerate.sh` — generates `.bench` test cases by picking random memories and asking an agent to craft a related prompt
- `benchmark/recall/run-benchmark.sh` — runs all `.bench` files through `src/recall.sh`, scores and writes results
- `benchmark/recall/recall-prompts.md` — version log of recall agent prompts that have been tested
- `benchmark/recall/tests/*.bench` — test case files
- `benchmark/recall/results/*.result` — benchmark result files

# .bench file format
```
# Recall Benchmark Test
# Generated: <timestamp>
# Strength: <string>
# Memory count: <int>

[expected]
memory/foo.md
memory/bar.md

[prompt-data]
strength=<int>

[prompt]
<user prompt text>
```

# autogenerate.sh options
- `--samples <int>` — how many .bench files to generate (default: 1)
- `--amount <int>` — how many memories to pick (default: random 1-5)
- `--strength <string>` — prompt relatedness word (default: random from strongly/moderately/loosely)
- `--strength-value <int>` — required when using custom strength string. Built-in mapping: strongly=3, moderately=2, loosely=1
- `--name <string>` — name for the .bench file(s) (default: random hex ID)

# Scoring
Each test is classified as:
- **PERFECT** — recalled exactly the expected set
- **OVERRECALL** — got all expected memories plus extras
- **UNDERRECALL** — missed at least one expected memory (may also have extras)

Result files contain a `[summary]` with aggregate stats (counts, percentages, total misrecalled memories) and a `[tests]` section with per-test breakdowns.

---
Update this memory when benchmark scripts, file formats, or scoring logic change.
