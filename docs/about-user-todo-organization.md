User's todo file organization (personal todo, project TODOs, "my todo" terminology)

# Structure
- **Personal todo**: `~/Desktop/todo.md` — the user's own task list
- **Project TODOs**: `<project-root>/TODO.md` — per-project task lists for projects the user cares about

# Terminology
When the user says **"my todo"**, they mean their personal todo at `~/Desktop/todo.md`, NOT the TODO.md in the current project directory.

# Kit context
Kit (this project) has its own `TODO.md` at `/home/yeyito/Workspace/Kit/TODO.md`. This is for user-facing todos *about* Kit, not the user's personal tasks.

# Examples
| User says | They mean |
|-----------|-----------|
| "check my todo" | `~/Desktop/todo.md` |
| "add this to my todo" | `~/Desktop/todo.md` |
| "the project's todo" | `<current-project>/TODO.md` |
| "Kit's todo" | `/home/yeyito/Workspace/Kit/TODO.md` |

**FOR AI AGENTS**: You've just read a memory file containing valuable, semi-static information about the following topic: User's todo file organization and terminology. If the information contained here becomes (or already is) outdated due to your actions, the user's actions, a third party's actions, or happenings of the world. You must use your write tool to update it.

Sections prone to be outdated: Personal todo path
How to verify if any of the sections prone to be outdated is outdated: Ask the user if their personal todo location has changed
