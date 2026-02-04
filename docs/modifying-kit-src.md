Guidelines and external dependencies when modifying Kit's src/ directory

# External References
Files **outside** Kit that reference files inside `src/`. Update these when renaming/moving/deleting src/ files.

| src/ file | External reference | Location |
|-----------|-------------------|----------|
| `refresh_pointers.py` | `kit()` function | `~/.zshrc` line ~60 |

# Startup Flow
When user runs `kit` in terminal:
```
~/.zshrc kit() → cd to Kit → run src/refresh_pointers.py → launch agent
```

# Checklist When Modifying src/
1. If renaming/moving a file, check the "External References" table above
2. Update any external files that reference the changed file
3. If adding new scripts that might be called externally, add them to this memory

**FOR AI AGENTS**: You've just read a memory file containing valuable, semi-static information about the following topic: Modifying Kit's src/ directory. If the information contained here becomes (or already is) outdated due to your actions, the user's actions, a third party's actions, or happenings of the world. You must use your write tool to update it.

Sections prone to be outdated: External References table
How to verify if any of the sections prone to be outdated is outdated: Check that each external reference still exists and points to the correct src/ file
