Guidelines and external dependencies when modifying Agent's src/ directory

# External References
Files **outside** Agent that reference files inside `src/`. Update these when renaming/moving/deleting src/ files.

| src/ file | External reference | Location |
|-----------|-------------------|----------|
| `start.sh` | `alias agent=...` | `~/.zshrc` |
| `refresh_pointers.py` | `src/start.sh` | `src/start.sh` line ~20 |
| `hooks/recall-memories.sh` | UserPromptSubmit hook | `.claude/settings.local.json` |
| `hooks/update-memories.sh` | Stop hook (async) | `.claude/settings.local.json` |
| `hooks/forgetting-memories.sh` | SessionStart hook (async) | `.claude/settings.local.json` |
| `hooks/cleanup-runtime.sh` | SessionEnd hook | `.claude/settings.local.json` |
| `reconcile_metadata.py` | `src/start.sh` | `src/start.sh` line ~50 |

# Startup Flow
When user runs `agent` in terminal:
```
~/.zshrc alias → src/start.sh → cd to Agent → run src/refresh_pointers.py → export AGENT_HOOK_ID → create runtime/recalled-<id> → launch claude
```

# Checklist When Modifying src/
1. If renaming/moving a file, check the "External References" table above
2. Update any external files that reference the changed file
3. If adding new scripts that might be called externally, add them to this memory
4. Hook scripts in src/hooks/ are referenced by .claude/settings.local.json — keep paths in sync

---
Update this memory when the information above becomes outdated.
