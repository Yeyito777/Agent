<memory-metadata>
{
  "frequency": 76,
  "last_accessed_session": 1148,
  "created_session": 0,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions adding, renaming, moving, or deleting files in src/ or scripts/, registering hooks, or modifying start.sh.
</conditional>

<fuzzy-match>
src/, scripts/, hooks, start.sh, settings.local.json, reconcile_metadata, hook wiring
</fuzzy-match>

<memory>
Guide for modifying files in src/ and scripts/, including how hooks are wired, how the agent boots, and what external references must stay in sync.

## External References

Files outside the Agent repo that point into `src/`. Whenever you rename, move, or delete a src/ file, update the corresponding external reference.

| src/ file | Referenced by | Location |
|-----------|--------------|----------|
| `start.sh` | `alias agent=...` | `~/.zshrc` |
| `recall.sh` | Recall hook + benchmark | `hooks/recall-memories.sh`, `benchmark/recall/run-benchmark.sh` |
| `hooks/recall-memories.sh` | UserPromptSubmit hook | `.claude/settings.local.json` |
| `hooks/save-cmd.sh` | UserPromptSubmit + SessionStart hook | `.claude/settings.local.json` |
| `hooks/update-memories.sh` | Stop hook (async) | `.claude/settings.local.json` |
| `hooks/forgetting-memories.sh` | SessionStart hook (async) | `.claude/settings.local.json` |
| `hooks/cleanup-runtime.sh` | SessionEnd hook | `.claude/settings.local.json` |
| `hooks/validation-memories.sh` | SessionStart hook (async) | `.claude/settings.local.json` |
| `presearch.py` | Recall script | `src/recall.sh` |
| `memory_metadata.py` | All hooks, reconcile, presearch, recall | imported by all metadata consumers |
| `reconcile_metadata.py` | `src/start.sh` | `src/start.sh` line ~63 |
| `src/memory/recall` | `start.sh` PATH setup, used interactively | `src/start.sh` PATH line, main Claude session |

## Startup Flow

When the user runs `agent` in the terminal, the boot sequence is:

```
~/.zshrc alias → src/start.sh → cd to Agent → export AGENT_HOOK_ID → run src/reconcile_metadata.py → create runtime/recalled-<id> → launch claude
```

## Runner Scripts in scripts/

These utilities wrap hook scripts so they can be invoked manually outside of a session:

- `scripts/run-forgetting` — calls `src/hooks/forgetting-memories.sh --force`
- `scripts/run-validation` — calls `src/hooks/validation-memories.sh --force`
- `scripts/get-forgetting-candidates` — calls `src/hooks/forgetting-memories.sh --output-only-candidates`

## Checklist for Modifying src/ or scripts/

1. If renaming or moving a file, consult the External References table above.
2. Update every external file that references the changed path.
3. If adding a new script that may be called externally, record it in this memory.
4. Hook scripts in `src/hooks/` are registered in `.claude/settings.local.json` — keep paths in sync.
5. Runner scripts in `scripts/` call hook scripts in `src/hooks/` — keep those paths in sync too.

---
Update this memory when the information above becomes outdated.
</memory>
