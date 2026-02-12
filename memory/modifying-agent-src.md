Agent src/ modification guide — renaming moving deleting files in src/, external references table (start.sh zshrc alias, hook scripts in .claude/settings.local.json, reconcile_metadata.py), startup boot flow (agent alias → start.sh → reconcile → claude launch), hooks wiring (recall-memories update-memories forgetting-memories cleanup-runtime validation-memories), checklist for keeping paths in sync across Agent codebase

# External References
Files **outside** Agent that reference files inside `src/`. Update these when renaming/moving/deleting src/ files.

| src/ file | External reference | Location |
|-----------|-------------------|----------|
| `start.sh` | `alias agent=...` | `~/.zshrc` |
| `hooks/recall-memories.sh` | UserPromptSubmit hook | `.claude/settings.local.json` |
| `hooks/update-memories.sh` | Stop hook (async) | `.claude/settings.local.json` |
| `hooks/forgetting-memories.sh` | SessionStart hook (async) | `.claude/settings.local.json` |
| `hooks/cleanup-runtime.sh` | SessionEnd hook | `.claude/settings.local.json` |
| `hooks/validation-memories.sh` | SessionStart hook (async) | `.claude/settings.local.json` |
| `reconcile_metadata.py` | `src/start.sh` | `src/start.sh` line ~44 |

# Startup Flow
When user runs `agent` in terminal:
```
~/.zshrc alias → src/start.sh → cd to Agent → export AGENT_HOOK_ID → run src/reconcile_metadata.py → create runtime/recalled-<id> → launch claude
```

# Checklist When Modifying src/
1. If renaming/moving a file, check the "External References" table above
2. Update any external files that reference the changed file
3. If adding new scripts that might be called externally, add them to this memory
4. Hook scripts in src/hooks/ are referenced by .claude/settings.local.json — keep paths in sync

---
Update this memory when the information above becomes outdated.
