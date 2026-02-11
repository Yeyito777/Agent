Go through every file in memory/*.md and verify that the information in each one is still accurate. Update anything you can confirm is outdated.

Process for each memory:
1. Read the full memory file
2. For every factual claim in the memory, verify it against the actual source of truth:
    - File paths mentioned → check they exist with ls or Read
    - File contents described (config values, code snippets, function signatures) → read the actual file and compare
    - CLI tools/commands mentioned → run which, --help, or --version to confirm they exist and behave as described
    - Directory structures described → list the actual directories and compare
    - Hook wiring (settings.local.json references) → read .claude/settings.local.json and verify
    - Aliases or shell config → read ~/.zshrc and verify
    - Default values, option names, flag syntax → check against the actual tool/source code
3. If something is outdated:
    - Fix it to match current reality
    - Do NOT remove information that you can't verify — only update what you can confirm has changed
4. If a file path no longer exists or a tool is gone, note it in the memory rather than silently deleting the reference
5. Move to the next memory

Rules:
- Be thorough — read every referenced file, run every checkable command
- Do NOT make cosmetic changes, reformat, or reorganize — only fix factual inaccuracies
- Do NOT change the first line (description) unless it is factually wrong
- Do NOT change the footer
- If the entire memory is accurate, move on without editing it
- Log which memories you checked and what (if anything) you changed, as a summary at the end
