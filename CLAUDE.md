# About memory/
You have memories stored in memory/ as kebab case markdown files.

## Recalling memories
A `UserPromptSubmit` hook runs on every user message. It surfaces relevant memory filenames in a `<system-reminder>` tag like:
```
Relevant memories: memory/foo.md memory/bar.md
```
**IMPORTANT — your FIRST action after seeing recalled memories must be to Read the ones relevant to the task.** Do this BEFORE any other work (reading reference files, writing code, etc.). These memories contain critical context about the user's setup, preferences, and workflows that directly affect how you should approach the task.

# Creating memories
If the user requests you to create a memory you must follow the following guideline:
1. Create a kebab case markdown file in memory/ with a descriptive filename
2. Write only the memory content — just the text. The metadata pipeline will automatically add `<memory-metadata>` and `<memory>` tags on the next session start.
3. The first line must be a plaintext description that maximizes retrieval — it is the ONLY text the recall agent sees when deciding relevance. Front-load key nouns, tools, and concepts (e.g. "st-notify popup notification system — usage, options, wire protocol" not "How notifications work"). Include synonyms and related terms a user might mention. Keep it single-lined.
4. Footer of the memory should be instructions on how to update the memory if anything becomes outdated
5. When editing existing memories, only modify content inside `<memory>` tags. Never modify `<memory-metadata>` tags — those are managed by the pipeline.
