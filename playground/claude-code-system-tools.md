# Claude Code System Tools (v2.1.50)

Extracted from the Claude Code binary at `~/.local/share/claude/versions/2.1.50`
Build: 2026-02-20T23:09:04Z

These are the tool definitions sent in the API `tools` parameter. Each tool has a
`name`, a `description` (detailed usage prompt), and an `input_schema` (JSON schema).

21 tools total. Some are conditionally enabled (noted where applicable).

---

## 1. Bash

Executes a given bash command with optional timeout. Working directory persists
between commands; shell state (everything else) does not. The shell environment is
initialized from the user's profile (bash or zsh).

IMPORTANT: This tool is for terminal operations like git, npm, docker, etc. DO NOT
use it for file operations (reading, writing, editing, searching, finding files) -
use the specialized tools for this instead.

Before executing the command, please follow these steps:

1. Directory Verification:
   - If the command will create new directories or files, first use `ls` to verify
     the parent directory exists and is the correct location
   - For example, before running "mkdir foo/bar", first use `ls foo` to check that
     "foo" exists and is the intended parent directory

2. Command Execution:
   - Always quote file paths that contain spaces with double quotes
     (e.g., cd "path with spaces/file.txt")
   - Examples of proper quoting:
     - cd "/Users/name/My Documents" (correct)
     - cd /Users/name/My Documents (incorrect - will fail)
     - python "/path/with spaces/script.py" (correct)
     - python /path/with spaces/script.py (incorrect - will fail)
   - After ensuring proper quoting, execute the command.
   - Capture the output of the command.

Usage notes:
  - The command argument is required.
  - You can specify an optional timeout in milliseconds (up to 3600000ms / 60 min).
    If not specified, commands will timeout after 300000ms (5 minutes).
  - It is very helpful if you write a clear, concise description of what this command
    does. For simple commands, keep it brief (5-10 words). For complex commands (piped
    commands, obscure flags, or anything hard to understand at a glance), add enough
    context to clarify what it does.
  - If the output exceeds 30000 characters, output will be truncated before being
    returned to you.
  - You can use the `run_in_background` parameter to run the command in the background.
    Only use this if you don't need the result immediately and are OK being notified
    when the command completes later.
  - Avoid using Bash with the `find`, `grep`, `cat`, `head`, `tail`, `sed`, `awk`, or
    `echo` commands, unless explicitly instructed or when truly necessary. Instead,
    always prefer the dedicated tools:
    - File search: Use Glob (NOT find or ls)
    - Content search: Use Grep (NOT grep or rg)
    - Read files: Use Read (NOT cat/head/tail)
    - Edit files: Use Edit (NOT sed/awk)
    - Write files: Use Write (NOT echo >/cat <<EOF)
    - Communication: Output text directly (NOT echo/printf)
  - When issuing multiple commands:
    - Independent commands: make multiple Bash tool calls in parallel
    - Dependent commands: use `&&` to chain them in a single call
    - Use `;` only when you don't care if earlier commands fail
    - DO NOT use newlines to separate commands
  - Try to maintain your current working directory by using absolute paths and avoiding
    `cd`. You may use `cd` if the User explicitly requests it.

### Appended: Committing changes with git

Only create commits when requested by the user. If unclear, ask first. When the user
asks you to create a new git commit, follow these steps carefully:

Git Safety Protocol:
- NEVER update the git config
- NEVER run destructive git commands (push --force, reset --hard, checkout ., restore .,
  clean -f, branch -D) unless the user explicitly requests these actions
- NEVER skip hooks (--no-verify, --no-gpg-sign, etc) unless the user explicitly requests
- NEVER run force push to main/master, warn the user if they request it
- CRITICAL: Always create NEW commits rather than amending, unless the user explicitly
  requests a git amend. When a pre-commit hook fails, the commit did NOT happen -- so
  --amend would modify the PREVIOUS commit, which may destroy work or lose previous
  changes. Instead, after hook failure, fix the issue, re-stage, and create a NEW commit
- When staging files, prefer adding specific files by name rather than "git add -A" or
  "git add .", which can accidentally include sensitive files or large binaries
- NEVER commit changes unless the user explicitly asks you to

1. Run in parallel:
   - git status (to see untracked files; NEVER use -uall flag)
   - git diff (to see staged and unstaged changes)
   - git log (to see recent commit message style)
2. Analyze all staged changes and draft a commit message:
   - Summarize the nature (new feature, enhancement, bug fix, refactoring, test, docs)
   - Do not commit files that likely contain secrets (.env, credentials.json, etc)
   - Draft a concise (1-2 sentences) commit message focused on the "why" not the "what"
3. Run in parallel:
   - Add relevant untracked files to staging
   - Create the commit with message ending with:
     `Co-Authored-By: {model_name} <noreply@anthropic.com>`
   - Run git status after commit to verify success
4. If the commit fails due to pre-commit hook: fix the issue and create a NEW commit

Important notes:
- NEVER run additional commands to read or explore code, besides git bash commands
- NEVER use the TodoWrite or Task tools
- DO NOT push unless the user explicitly asks
- NEVER use git commands with -i flag (git rebase -i, git add -i)
- NEVER use --no-edit with git rebase
- Do not create empty commits
- ALWAYS pass commit message via a HEREDOC

### Appended: Creating pull requests

Use `gh` for ALL GitHub-related tasks. When creating a PR:

1. Run in parallel:
   - git status (no -uall flag)
   - git diff (staged and unstaged changes)
   - Check if branch tracks remote and is up to date
   - git log and `git diff [base-branch]...HEAD` for full commit history
2. Analyze all changes and draft PR title and summary:
   - Keep PR title under 70 characters
   - Use description/body for details
3. Run in parallel:
   - Create new branch if needed
   - Push to remote with -u flag if needed
   - Create PR with `gh pr create`

### Appended: Other common operations

- View comments on a Github PR: `gh api repos/foo/bar/pulls/123/comments`

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "command": { "type": "string", "description": "The command to execute" },
    "timeout": { "type": "number", "description": "Optional timeout in milliseconds (max 3600000)" },
    "description": { "type": "string", "description": "Clear, concise description of what this command does" },
    "run_in_background": { "type": "boolean", "description": "Run in background, use TaskOutput to read output later" },
    "dangerouslyDisableSandbox": { "type": "boolean", "description": "Override sandbox mode" }
  },
  "required": ["command"],
  "additionalProperties": false
}
```

---

## 2. Read

Reads a file from the local filesystem. You can access any file directly by using
this tool. Assume this tool is able to read all files on the machine. If the User
provides a path to a file assume that path is valid. It is okay to read a file that
does not exist; an error will be returned.

Usage:
- The file_path parameter must be an absolute path, not a relative path
- By default, it reads up to 2000 lines starting from the beginning of the file
- You can optionally specify a line offset and limit (especially handy for long files),
  but it's recommended to read the whole file by not providing these parameters
- Any lines longer than 2000 characters will be truncated
- Results are returned using cat -n format, with line numbers starting at 1
- This tool allows Claude Code to read images (PNG, JPG, etc). When reading an image
  file the contents are presented visually as Claude Code is a multimodal LLM.
- This tool can read PDF files (.pdf). For large PDFs (more than 10 pages), you MUST
  provide the pages parameter. Maximum 20 pages per request.
- This tool can read Jupyter notebooks (.ipynb) and returns all cells with their outputs
- This tool can only read files, not directories. Use `ls` via Bash for directories.
- You can call multiple tools in parallel. It is always better to speculatively read
  multiple potentially useful files in parallel.
- You will regularly be asked to read screenshots. ALWAYS use this tool to view them.
- If you read a file that exists but has empty contents you will receive a system
  reminder warning in place of file contents.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "file_path": { "type": "string", "description": "The absolute path to the file to read" },
    "offset": { "type": "number", "description": "The line number to start reading from" },
    "limit": { "type": "number", "description": "The number of lines to read" },
    "pages": { "type": "string", "description": "Page range for PDFs (e.g., '1-5', '3', '1-')" }
  },
  "required": ["file_path"],
  "additionalProperties": false
}
```

---

## 3. Edit

Performs exact string replacements in files.

Usage:
- You must use your Read tool at least once in the conversation before editing. This
  tool will error if you attempt an edit without reading the file.
- When editing text from Read tool output, ensure you preserve the exact indentation
  (tabs/spaces) as it appears AFTER the line number prefix. The line number prefix
  format is: spaces + line number + tab. Everything after that tab is the actual file
  content to match. Never include any part of the line number prefix in old_string or
  new_string.
- ALWAYS prefer editing existing files. NEVER write new files unless explicitly required.
- Only use emojis if the user explicitly requests it.
- The edit will FAIL if `old_string` is not unique in the file. Either provide a larger
  string with more surrounding context to make it unique or use `replace_all` to change
  every instance.
- Use `replace_all` for replacing and renaming strings across the file (e.g., renaming
  a variable).

Also supports batch edits via an `edits` array parameter.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "file_path": { "type": "string", "description": "The absolute path to the file to edit" },
    "old_string": { "type": "string", "description": "The exact string to find in the file" },
    "new_string": { "type": "string", "description": "The replacement string" },
    "replace_all": { "type": "boolean", "description": "Replace all occurrences" }
  },
  "required": ["file_path", "old_string", "new_string"],
  "additionalProperties": false
}
```

---

## 4. Write

Writes a file to the local filesystem. This tool will overwrite the existing file if
there is one. If this is an existing file, you MUST use the Read tool first. ALWAYS
prefer editing existing files. NEVER write new files unless explicitly required. NEVER
proactively create documentation files (*.md) or README files. Only use emojis if the
user explicitly requests it.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "file_path": { "type": "string", "description": "The absolute path to the file to write (must be absolute)" },
    "content": { "type": "string", "description": "The content to write to the file" }
  },
  "required": ["file_path", "content"],
  "additionalProperties": false
}
```

---

## 5. Glob

- Fast file pattern matching tool that works with any codebase size
- Supports glob patterns like "**/*.js" or "src/**/*.ts"
- Returns matching file paths sorted by modification time
- Use this tool when you need to find files by name patterns
- When you are doing an open ended search that may require multiple rounds of globbing
  and grepping, use the Agent tool instead
- You can call multiple tools in parallel. It is always better to speculatively perform
  multiple searches in parallel if they are potentially useful.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "pattern": { "type": "string", "description": "The glob pattern to match files against" },
    "path": { "type": "string", "description": "The directory to search in (defaults to cwd)" }
  },
  "required": ["pattern"],
  "additionalProperties": false
}
```

---

## 6. Grep

A powerful search tool built on ripgrep.

Usage:
  - ALWAYS use Grep for search tasks. NEVER invoke `grep` or `rg` as a Bash command.
    The Grep tool has been optimized for correct permissions and access.
  - Supports full regex syntax (e.g., "log.*Error", "function\s+\w+")
  - Filter files with glob parameter (e.g., "*.js", "**/*.tsx") or type parameter
    (e.g., "js", "py", "rust")
  - Output modes: "content" shows matching lines, "files_with_matches" shows only file
    paths (default), "count" shows match counts
  - Use Task tool for open-ended searches requiring multiple rounds
  - Pattern syntax: Uses ripgrep (not grep) - literal braces need escaping
    (use `interface\{\}` to find `interface{}` in Go code)
  - Multiline matching: By default patterns match within single lines only. For
    cross-line patterns like `struct \{[\s\S]*?field`, use `multiline: true`

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "pattern": { "type": "string", "description": "The regex pattern to search for" },
    "path": { "type": "string", "description": "File or directory to search in" },
    "glob": { "type": "string", "description": "Glob pattern to filter files (e.g., '*.js')" },
    "type": { "type": "string", "description": "File type filter (e.g., 'js', 'py', 'rust')" },
    "output_mode": { "type": "string", "enum": ["content", "files_with_matches", "count"] },
    "multiline": { "type": "boolean", "description": "Enable multiline matching" },
    "-A": { "type": "number", "description": "Lines to show after each match" },
    "-B": { "type": "number", "description": "Lines to show before each match" },
    "-C": { "type": "number", "description": "Context lines around each match" },
    "context": { "type": "number", "description": "Context lines (alias for -C)" },
    "-i": { "type": "boolean", "description": "Case insensitive search" },
    "-n": { "type": "boolean", "description": "Show line numbers (default true)" },
    "head_limit": { "type": "number", "description": "Limit output to first N entries" },
    "offset": { "type": "number", "description": "Skip first N entries" }
  },
  "required": ["pattern"],
  "additionalProperties": false
}
```

---

## 7. Task

Launch a new agent to handle complex, multi-step tasks autonomously.

The Task tool launches specialized agents (subprocesses) that autonomously handle
complex tasks. Each agent type has specific capabilities and tools available to it.

Available agent types are dynamically populated based on configured agent definitions.
Built-in types include: Bash, general-purpose, Explore, Plan, and others.

When NOT to use the Task tool:
- If you want to read a specific file path, use the Read or Glob tool instead
- If you are searching for a specific class definition like "class Foo", use Glob/Grep
- If you are searching for code within a specific file or set of 2-3 files, use Read
- Other tasks not related to agent descriptions

Usage notes:
- Always include a short description (3-5 words) summarizing what the agent will do
- Launch multiple agents concurrently whenever possible, to maximize performance; to do
  that, use a single message with multiple tool uses
- When the agent is done, it returns a single message. The result is not visible to the
  user. To show results, send a text message with a concise summary.
- You can optionally run agents in the background using `run_in_background`
- Agents can be resumed using the `resume` parameter by passing the agent ID
- Provide clear, detailed prompts so the agent can work autonomously
- Agents with "access to current context" can see the full conversation history
- The agent's outputs should generally be trusted
- Clearly tell the agent whether you expect it to write code or just do research
- If the agent description mentions proactive use, try to use it without being asked
- You can optionally set `isolation: "worktree"` for an isolated copy of the repo

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "description": { "type": "string", "description": "Short (3-5 word) task description" },
    "prompt": { "type": "string", "description": "The detailed task for the agent" },
    "subagent_type": { "type": "string", "description": "The type of agent to launch" },
    "resume": { "type": "string", "description": "Agent ID to resume from previous invocation" },
    "isolation": { "type": "string", "enum": ["worktree"], "description": "Run in isolated git worktree" },
    "model": { "type": "string", "enum": ["sonnet", "opus", "haiku"], "description": "Model override" },
    "run_in_background": { "type": "boolean", "description": "Run agent in background" },
    "max_turns": { "type": "integer", "description": "Maximum agentic turns" }
  },
  "required": ["description", "prompt", "subagent_type"],
  "additionalProperties": false
}
```

---

## 8. WebFetch

IMPORTANT: WebFetch WILL FAIL for authenticated or private URLs. Before using this
tool, check if the URL points to an authenticated service (e.g. Google Docs, Confluence,
Jira, GitHub). If so, you MUST use ToolSearch first to find a specialized tool.

- Fetches content from a specified URL and processes it using an AI model
- Takes a URL and a prompt as input
- Fetches the URL content, converts HTML to markdown
- Processes the content with the prompt using a small, fast model
- Returns the model's response about the content

Usage notes:
  - IMPORTANT: If an MCP-provided web fetch tool is available, prefer using that tool
  - The URL must be a fully-formed valid URL
  - HTTP URLs will be automatically upgraded to HTTPS
  - This tool is read-only and does not modify any files
  - Results may be summarized if the content is very large
  - Includes a self-cleaning 15-minute cache
  - When a URL redirects to a different host, you'll be informed with the redirect URL
  - For GitHub URLs, prefer using the gh CLI via Bash instead

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "url": { "type": "string", "format": "uri", "description": "The URL to fetch content from" },
    "prompt": { "type": "string", "description": "The prompt to run on the fetched content" }
  },
  "required": ["url", "prompt"],
  "additionalProperties": false
}
```

---

## 9. WebSearch

Implemented via Anthropic's built-in `web_search_20250305` server tool type.

- Allows Claude to search the web and use the results to inform responses
- Provides up-to-date information for current events and recent data
- Returns search result information formatted as search result blocks, including links
  as markdown hyperlinks
- Use this tool for accessing information beyond Claude's knowledge cutoff

CRITICAL REQUIREMENT: After answering the user's question, you MUST include a
"Sources:" section at the end of your response listing all relevant URLs as markdown
hyperlinks.

Usage notes:
  - Domain filtering is supported to include or block specific websites
  - Web search is only available in the US
  - Use the correct year in search queries (current month is dynamically inserted)

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "query": { "type": "string", "minLength": 2, "description": "The search query" },
    "allowed_domains": { "type": "array", "items": { "type": "string" }, "description": "Only include results from these domains" },
    "blocked_domains": { "type": "array", "items": { "type": "string" }, "description": "Exclude results from these domains" }
  },
  "required": ["query"],
  "additionalProperties": false
}
```

---

## 10. AskUserQuestion

Use this tool when you need to ask the user questions during execution. This allows you to:
1. Gather user preferences or requirements
2. Clarify ambiguous instructions
3. Get decisions on implementation choices as you work
4. Offer choices to the user about what direction to take.

Usage notes:
- Users will always be able to select "Other" to provide custom text input
- Use multiSelect: true to allow multiple answers to be selected for a question
- If you recommend a specific option, make that the first option in the list and add
  "(Recommended)" at the end of the label

Plan mode note: In plan mode, use this tool to clarify requirements or choose between
approaches BEFORE finalizing your plan. Do NOT use this tool to ask "Is my plan ready?"
or "Should I proceed?" -- use ExitPlanMode for plan approval.

Preview feature: Use the optional `markdown` field on options when presenting concrete
artifacts that users need to visually compare (ASCII mockups, code snippets, diagrams,
configuration examples). Previews are only supported for single-select questions.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "questions": {
      "type": "array", "minItems": 1, "maxItems": 4,
      "items": {
        "type": "object",
        "properties": {
          "question": { "type": "string", "description": "The question to ask" },
          "header": { "type": "string", "description": "Short label (max 12 chars)" },
          "options": {
            "type": "array", "minItems": 2, "maxItems": 4,
            "items": {
              "type": "object",
              "properties": {
                "label": { "type": "string" },
                "description": { "type": "string" },
                "markdown": { "type": "string" }
              },
              "required": ["label", "description"]
            }
          },
          "multiSelect": { "type": "boolean", "default": false }
        },
        "required": ["question", "header", "options", "multiSelect"]
      }
    }
  },
  "required": ["questions"],
  "additionalProperties": false
}
```

---

## 11. NotebookEdit

Completely replaces the contents of a specific cell in a Jupyter notebook (.ipynb file)
with new source. The notebook_path parameter must be an absolute path. The cell_number
is 0-indexed. Use edit_mode=insert to add a new cell. Use edit_mode=delete to delete a
cell.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "notebook_path": { "type": "string", "description": "Absolute path to notebook" },
    "new_source": { "type": "string", "description": "New source content for the cell" },
    "cell_id": { "type": "string", "description": "The ID of the cell to edit" },
    "cell_type": { "type": "string", "enum": ["code", "markdown"], "description": "Cell type" },
    "edit_mode": { "type": "string", "enum": ["replace", "insert", "delete"], "description": "Edit operation" }
  },
  "required": ["notebook_path", "new_source"],
  "additionalProperties": false
}
```

---

## 12. Skill

Execute a skill within the main conversation.

When users ask you to perform tasks, check if any of the available skills match. Skills
provide specialized capabilities and domain knowledge.

When users reference a "slash command" or "/<something>" (e.g., "/commit", "/review-pr"),
they are referring to a skill. Use this tool to invoke it.

How to invoke:
- Use this tool with the skill name and optional arguments
- Examples:
  - `skill: "pdf"` -- invoke the pdf skill
  - `skill: "commit", args: "-m 'Fix bug'"` -- invoke with arguments
  - `skill: "review-pr", args: "123"` -- invoke with arguments

Important:
- Available skills are listed in system-reminder messages in the conversation
- When a skill matches the user's request, this is a BLOCKING REQUIREMENT: invoke the
  Skill tool BEFORE generating any other response
- NEVER mention a skill without actually calling this tool
- Do not invoke a skill that is already running
- Do not use this tool for built-in CLI commands (like /help, /clear, etc.)
- If you see a <command-name> tag in the current turn, the skill has ALREADY been loaded

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "skill": { "type": "string", "description": "The skill name" },
    "args": { "type": "string", "description": "Optional arguments" }
  },
  "required": ["skill"],
  "additionalProperties": false
}
```

---

## 13. TodoWrite

(Legacy tool -- replaced by TaskCreate/TaskUpdate/TaskList/TaskGet in newer configs.
Only enabled when the Task tools are disabled.)

Use this tool to create and manage a structured task list for your current coding session.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "todos": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "content": { "type": "string", "minLength": 1 },
          "status": { "type": "string", "enum": ["pending", "in_progress", "completed"] },
          "activeForm": { "type": "string", "minLength": 1 }
        },
        "required": ["content", "status", "activeForm"]
      }
    }
  },
  "required": ["todos"],
  "additionalProperties": false
}
```

---

## 14. TaskCreate

Use this tool to create a structured task list for your current coding session. This
helps you track progress, organize complex tasks, and demonstrate thoroughness.

When to use:
- Complex multi-step tasks (3+ distinct steps)
- Non-trivial and complex tasks
- Plan mode (to track the work)
- User explicitly requests todo list
- User provides multiple tasks
- After receiving new instructions

When NOT to use:
- Single, straightforward task
- Trivial tasks (< 3 steps)
- Purely conversational or informational

Task fields:
- **subject**: Brief, actionable title in imperative form (e.g., "Fix auth bug")
- **description**: Detailed description with context and acceptance criteria
- **activeForm**: Present continuous form for spinner (e.g., "Fixing auth bug")

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "subject": { "type": "string", "description": "Brief task title" },
    "description": { "type": "string", "description": "Detailed description" },
    "activeForm": { "type": "string", "description": "Present continuous form for spinner" },
    "metadata": { "type": "object", "additionalProperties": true }
  },
  "required": ["subject", "description"],
  "additionalProperties": false
}
```

---

## 15. TaskGet

Retrieve a task by its ID from the task list.

When to use:
- When you need full description and context before starting work
- To understand task dependencies (blocks/blockedBy)
- After being assigned a task, to get complete requirements

Returns: subject, description, status, blocks, blockedBy.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "taskId": { "type": "string", "description": "The ID of the task to retrieve" }
  },
  "required": ["taskId"],
  "additionalProperties": false
}
```

---

## 16. TaskUpdate

Update a task in the task list.

When to use:
- Mark tasks as resolved (when work is completed)
- Delete tasks (when no longer relevant)
- Update task details (when requirements change)
- Establish dependencies between tasks

Fields you can update:
- **status**: pending | in_progress | completed | deleted
- **subject**, **description**, **activeForm**, **owner**
- **metadata**: Merge metadata keys (set key to null to delete)
- **addBlocks** / **addBlockedBy**: Set up dependencies

Status workflow: pending -> in_progress -> completed. Use deleted to remove.

ONLY mark completed when FULLY accomplished. Never mark completed if tests fail,
implementation is partial, or unresolved errors exist.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "taskId": { "type": "string" },
    "subject": { "type": "string" },
    "description": { "type": "string" },
    "activeForm": { "type": "string" },
    "status": { "type": "string", "enum": ["pending", "in_progress", "completed", "deleted"] },
    "addBlocks": { "type": "array", "items": { "type": "string" } },
    "addBlockedBy": { "type": "array", "items": { "type": "string" } },
    "owner": { "type": "string" },
    "metadata": { "type": "object", "additionalProperties": true }
  },
  "required": ["taskId"],
  "additionalProperties": false
}
```

---

## 17. TaskList

List all tasks in the task list.

When to use:
- To see available tasks (pending, no owner, not blocked)
- To check overall progress
- To find blocked tasks needing dependencies resolved
- After completing a task, to find next work

Prefer working on tasks in ID order (lowest first).

Returns: id, subject, status, owner, blockedBy.

### Input Schema

```json
{
  "type": "object",
  "properties": {},
  "additionalProperties": false
}
```

---

## 18. TaskOutput

Aliases: AgentOutputTool, BashOutputTool

Retrieves output from a running or completed task (background shell, agent, or remote
session).

- Takes a task_id parameter identifying the task
- Use block=true (default) to wait for completion
- Use block=false for non-blocking check
- Task IDs can be found using /tasks command
- Works with all task types

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "task_id": { "type": "string", "description": "The task ID to get output from" },
    "block": { "type": "boolean", "default": true, "description": "Wait for completion" },
    "timeout": { "type": "number", "minimum": 0, "maximum": 600000, "default": 30000, "description": "Max wait time in ms" }
  },
  "required": ["task_id"],
  "additionalProperties": false
}
```

---

## 19. TaskStop

Alias: KillShell

Stops a running background task by its ID.

- Takes a task_id parameter identifying the task to stop
- Returns a success or failure status
- Use this tool when you need to terminate a long-running task

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "task_id": { "type": "string", "description": "The ID of the background task to stop" },
    "shell_id": { "type": "string", "description": "Deprecated: use task_id instead" }
  },
  "additionalProperties": false
}
```

---

## 20. EnterPlanMode

Requests permission to enter plan mode for complex tasks requiring exploration and
design. This tool REQUIRES user approval.

What happens in plan mode:
1. Thoroughly explore the codebase using Glob, Grep, and Read tools
2. Understand existing patterns and architecture
3. Design an implementation approach
4. Present your plan to the user for approval
5. Use AskUserQuestion if you need to clarify approaches
6. Exit plan mode with ExitPlanMode when ready to implement

Use when: new features, multiple valid approaches, code modifications, architectural
decisions, multi-file changes, unclear requirements, user preferences matter.

Don't use for: trivial fixes, single-line changes, pure research tasks.

### Input Schema

```json
{
  "type": "object",
  "properties": {},
  "additionalProperties": false
}
```

---

## 21. ExitPlanMode

Use this tool when you are in plan mode and have finished writing your plan to the
plan file and are ready for user approval.

How it works:
- You should have already written your plan to the plan file specified in the plan mode
  system message
- This tool does NOT take the plan content as a parameter -- it reads from the file
- It signals you're done planning and ready for user review
- The user will see the contents of your plan file

Only use when planning implementation steps of a task requiring code. Do NOT use for
research/exploration tasks.

Before using, ensure your plan is complete. If unresolved questions remain, use
AskUserQuestion first. Do NOT use AskUserQuestion to ask "Is my plan okay?" -- that's
what ExitPlanMode does.

### Input Schema

```json
{
  "type": "object",
  "properties": {
    "allowedPrompts": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "tool": { "type": "string", "enum": ["Bash"] },
          "prompt": { "type": "string", "description": "Semantic description of the action" }
        },
        "required": ["tool", "prompt"]
      },
      "description": "Prompt-based permissions needed to implement the plan"
    }
  },
  "additionalProperties": true
}
```

---

## Conditional/Internal Tools

### StructuredOutput
Used to return structured responses in a specific JSON schema format. Dynamically
configured per-request. Not always present.

### EnterWorktree
Creates an isolated worktree (via git or configured hooks) and switches the session
into it. Input: `{ "name": "string (optional)" }`

### SendMessage (Team mode only)
Send messages to agent teammates. Only available in multi-agent team contexts.

### TeamCreate (Team mode only)
Create a new team to coordinate multiple agents.

### TeamDelete (Team mode only)
Remove team and task directories when swarm work is complete.

---

## Tool Name -> Minified Variable Mapping

```
Bash             = lD
Read             = LB
Edit             = SB
Write            = u1
Glob             = Jf
Grep             = a1
Task             = T0
WebFetch         = pW
WebSearch        = rT
AskUserQuestion  = S4
NotebookEdit     = $J
Skill            = JJ
TodoWrite        = qp
TaskCreate       = ih
TaskGet          = D6H
TaskUpdate       = kS
TaskList         = B6H
TaskOutput       = L6H
TaskStop         = O1H
EnterPlanMode    = tV$
ExitPlanMode     = k3
StructuredOutput = IQ
EnterWorktree    = eV$
SendMessage      = Bd
TeamCreate       = fd
TeamDelete       = NkH
```
