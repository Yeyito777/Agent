# About memory/ 
You have memories stored in memory/ as kebab case markdown files.
If the user references a topic stored in a memory read that file before addresing his request.

# Creating memories
If the user requesets you to create a memory you must follow the following guideline:
1. Create a kebab case markdown file in memory/ with a descriptive filename
2. The first line in the memory should be a plaintext description of what the memory is about (this is how src/refresh_pointers.py gets the description for each file)
3. Footer of the memory should be instructions on how to update the memory if anything becomes outdated

# Memory pointers (run src/refresh_pointers.py after creating/deleting memories):
```md
- memory/about-user-todo-organization.md — User's todo file organization (personal todo, project TODOs, "my todo" terminology)
- memory/automatic-memory-recall-system.md — Automatic memory recall system — how memories are surfaced via hooks, architecture, and debugging
- memory/claude-code-binary-inspection.md — Inspecting Claude Code's bundled binary for source code and config validation (strings, ELF, minified JS)
- memory/disk-audit-cleanup-guide.md — Disk audit and cleanup guide for the user's Arch Linux system (single 916G NVMe, ext4, ~68G used as of Feb 2026)
- memory/dmenu-usage-and-scripting.md — How dmenu works, where scripts go, and how it integrates with dwm
- memory/modifying-agent-src.md — Guidelines and external dependencies when modifying Agent's src/ directory
- memory/swap-file-configuration.md — Swap file setup on the user's system — how it's configured, and how to undo/redo it.
- memory/user-git-config-location.md — User's git config location (gitconfig, GIT_CONFIG_GLOBAL, credentials)
- memory/user-keyboard-configuration.md — User's keyboard configuration — keyd remappings, repeat rate, and right shift behavior in st
- memory/user-suckless-build-workflow.md — Workflow for modifying user's suckless tools (dwm, st, dmenu, etc.)
- memory/user-terminal-aesthetics.md — User's CLI/terminal visual style preferences (bold, gradients, ASCII art, branding)
- memory/user-terminal-color-scheme.md — Ocean-themed st terminal palette (hex values, ANSI escapes, color names)
- memory/watchdog-shutdown-message.md — Watchdog "did not stop!" shutdown message — cause, fix, and future server considerations.
```

