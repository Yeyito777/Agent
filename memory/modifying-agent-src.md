Guidelines and external dependencies when modifying Agent's src/ directory

# External References
Files **outside** Agent that reference files inside `src/`. Update these when renaming/moving/deleting src/ files.

| src/ file | External reference | Location |
|-----------|-------------------|----------|
| `refresh_pointers.py` | `agent()` function | `~/.zshrc` line ~60 |

# Startup Flow
When user runs `agent` in terminal:
```
~/.zshrc agent() → cd to Agent → run src/refresh_pointers.py → launch agent
```

# Checklist When Modifying src/
1. If renaming/moving a file, check the "External References" table above
2. Update any external files that reference the changed file
3. If adding new scripts that might be called externally, add them to this memory

---
Update this memory when the information above becomes outdated.
