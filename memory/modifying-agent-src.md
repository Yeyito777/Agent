<memory-metadata>
{
  "frequency": 49,
  "last_accessed_session": 529,
  "created_session": 0,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
Agent src/ and scripts/ modification guide — adding new hooks, registering new scripts, renaming moving deleting files in src/ and scripts/, external references table (start.sh zshrc alias, hook scripts in .claude/settings.local.json, reconcile_metadata.py), startup boot flow (agent alias → start.sh → reconcile → claude launch), hooks wiring (recall-memories save-cmd update-memories forgetting-memories cleanup-runtime validation-memories), scripts/ runner utilities, checklist for keeping paths and references in sync across Agent codebase

# External References
Files **outside** Agent that reference files inside `src/`. Update these when renaming/moving/deleting src/ files.

| src/ file | External reference | Location |
|-----------|-------------------|----------|
| `start.sh` | `alias agent=...` | `~/.zshrc` |
| `recall.sh` | Recall hook + benchmark | `hooks/recall-memories.sh`, `benchmark/recall/run-benchmark.sh` |
| `hooks/recall-memories.sh` | UserPromptSubmit hook | `.claude/settings.local.json` |
| `hooks/save-cmd.sh` | UserPromptSubmit + SessionStart hook | `.claude/settings.local.json` |
| `hooks/update-memories.sh` | Stop hook (async) | `.claude/settings.local.json` |
| `hooks/forgetting-memories.sh` | SessionStart hook (async) | `.claude/settings.local.json` |
| `hooks/cleanup-runtime.sh` | SessionEnd hook | `.claude/settings.local.json` |
| `hooks/validation-memories.sh` | SessionStart hook (async) | `.claude/settings.local.json` |
| `memory_metadata.py` | All hooks, reconcile, presearch, recall | imported by all metadata consumers |
| `reconcile_metadata.py` | `src/start.sh` | `src/start.sh` line ~44 |

# Startup Flow
When user runs `agent` in terminal:
```
~/.zshrc alias → src/start.sh → cd to Agent → export AGENT_HOOK_ID → run src/reconcile_metadata.py → create runtime/recalled-<id> → launch claude
```

# scripts/
Runner utilities that wrap hook scripts for manual invocation:
- `scripts/run-forgetting` — calls `src/hooks/forgetting-memories.sh --force`
- `scripts/run-validation` — calls `src/hooks/validation-memories.sh --force`
- `scripts/get-forgetting-candidates` — calls `src/hooks/forgetting-memories.sh --output-only-candidates`

# Checklist When Modifying src/ or scripts/
1. If renaming/moving a file, check the "External References" table above
2. Update any external files that reference the changed file
3. If adding new scripts that might be called externally, add them to this memory
4. Hook scripts in src/hooks/ are referenced by .claude/settings.local.json — keep paths in sync
5. Runner scripts in scripts/ reference hook scripts in src/hooks/ — keep paths in sync

---
Update this memory when the information above becomes outdated.
</memory>
