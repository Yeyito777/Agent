Go through every file in memory/*.md and update the first line of each to maximize retrieval by the recall agent.

Context: The recall system generates pointers by reading ONLY the first line of each memory file. These pointers are shown to an opus subclaude that decides which memories are relevant to the user's prompt. The first line is the ONLY signal it has — it never sees the rest of the file.

Rules:
- The first line must be a single line (no line breaks) of plaintext — no markdown, no # headers
- Front-load key nouns, tools, technologies, and concepts
- Include synonyms and alternate phrasings a user might use when asking about this topic
- Be specific, not generic (e.g. "dwm window manager — tiling, tags, keybindings, config.h,
patching suckless" not "Window manager notes")
- Mention the tool/system name AND what it does AND key subtopics
- Read the full content of each memory before writing its description — the description should
cover all major topics in the file
- Do NOT change anything else in the file — only the first line

Process:
1. Read each memory file
2. Draft a better first line based on the full content
3. Edit only the first line
4. Move to the next file
