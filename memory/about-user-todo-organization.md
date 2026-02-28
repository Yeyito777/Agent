<memory-metadata>
{
  "frequency": 47,
  "last_accessed_session": 0,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions todo, task list, task management, personal tasks, or file paths for todos.
</conditional>

<fuzzy-match>
todo, my todo, task list, desktop/todo, todo.md, personal tasks, project todo, agent todo
</fuzzy-match>

<memory>
The user organizes todos across multiple files, so distinguishing which one they mean is important.

## File locations

- **Personal todo**: `~/Desktop/todo.md` — the user's own task list for personal tasks.
- **Project TODOs**: `<project-root>/TODO.md` — per-project task lists living in each project's root directory.
- **Agent TODO**: `/home/yeyito/Workspace/Agent/TODO.md` — todos specifically about the Agent project, not the user's personal tasks.

## Terminology and disambiguation

When the user says **"my todo"**, **"my tasks"**, **"check my todo"**, or **"add to my todo"**, they always mean their personal todo at `~/Desktop/todo.md` — never the TODO.md in the current project directory.

## Examples

| User says | They mean |
|-----------|-----------|
| "check my todo" | `~/Desktop/todo.md` |
| "add this to my todo" | `~/Desktop/todo.md` |
| "the project's todo" / "this project's todo" | `<current-project>/TODO.md` |
| "Agent's todo" | `/home/yeyito/Workspace/Agent/TODO.md` |

---
Update this memory when the information above becomes outdated.
</memory>
