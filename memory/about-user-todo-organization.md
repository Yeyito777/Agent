Todo file locations and terminology — personal todo at ~/Desktop/todo.md ("my todo"), project-specific TODO.md files, Agent TODO.md, disambiguating "my todo" vs "project todo" vs "Agent todo"

# Structure
- **Personal todo**: `~/Desktop/todo.md` — the user's own task list
- **Project TODOs**: `<project-root>/TODO.md` — per-project task lists for projects the user cares about

# Terminology
When the user says **"my todo"**, they mean their personal todo at `~/Desktop/todo.md`, NOT the TODO.md in the current project directory.

# Agent context
Agent (this project) has its own `TODO.md` at `/home/yeyito/Workspace/Agent/TODO.md`. This is for user-facing todos *about* Agent, not the user's personal tasks.

# Examples
| User says | They mean |
|-----------|-----------|
| "check my todo" | `~/Desktop/todo.md` |
| "add this to my todo" | `~/Desktop/todo.md` |
| "the project's todo" / "this project's todo" | `<current-project>/TODO.md` |
| "Agent's todo" | `/home/yeyito/Workspace/Agent/TODO.md` |

---
Update this memory when the information above becomes outdated.
