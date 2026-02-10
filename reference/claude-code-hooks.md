# Claude Code Hooks Reference

## Hook Events

| Event | When it fires | Can block? | Matcher |
|---|---|---|---|
| SessionStart | Session begins, resumes, clear, or compact | No | `startup`, `resume`, `clear`, `compact` |
| UserPromptSubmit | After user hits enter, before Claude processes | Yes | None (always fires) |
| PreToolUse | Before a tool executes | Yes | Tool name (`Bash`, `Edit`, `Write`, `Read`, etc.) |
| PostToolUse | After a tool succeeds | No | Tool name |
| PostToolUseFailure | After a tool fails | No | Tool name |
| PermissionRequest | When permission dialog appears | Yes | Tool name |
| Stop | When Claude finishes responding | Yes | None |
| Notification | When a notification is sent | No | `permission_prompt`, `idle_prompt`, `auth_success`, `elicitation_dialog` |
| SubagentStart | When a subagent spawns | No | Agent type name |
| SubagentStop | When a subagent finishes | Yes | Agent type name |
| PreCompact | Before context compaction | No | `manual`, `auto` |
| TaskCompleted | When a task is marked complete | Yes | None |
| TeammateIdle | Agent team member goes idle | Yes | None |
| SessionEnd | Session terminates | No | `clear`, `logout`, `prompt_input_exit`, etc. |

## Hook Types

- **command** — runs a shell script; communicates via stdin (JSON) and stdout/exit code
- **prompt** — single-turn LLM call (Haiku by default); must return `{"ok": true/false}`
- **agent** — multi-turn subagent with tool access

## Configuration

Hooks live in settings JSON at three levels:
- `~/.claude/settings.json` — user-global
- `.claude/settings.json` — project (committed)
- `.claude/settings.local.json` — project-local (gitignored)

```json
{
  "hooks": {
    "EventName": [
      {
        "matcher": "optional-regex",
        "hooks": [
          {
            "type": "command",
            "command": "/path/to/script.sh",
            "timeout": 600
          }
        ]
      }
    ]
  }
}
```

## stdin/stdout Protocol

All command hooks receive JSON on stdin:
```json
{
  "session_id": "abc123",
  "cwd": "/project",
  "hook_event_name": "UserPromptSubmit",
  "prompt": "user message here"
}
```

Exit code determines behavior:
- **0** — success; stdout is injected as context (plain text or JSON)
- **2** — block; stderr is fed to Claude as error
- **other** — non-blocking error; logged only

Structured output (exit 0):
```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "allow|deny|ask",
    "additionalContext": "text Claude sees"
  }
}
```

## Environment Variables

- `$CLAUDE_PROJECT_DIR` — project root
- `$CLAUDE_ENV_FILE` — (SessionStart only) path to write persistent env vars

## Hook Config Fields

| Field | Type | Default | Notes |
|---|---|---|---|
| matcher | string | (empty) | Regex; omit to match all |
| type | string | required | `command`, `prompt`, or `agent` |
| command | string | required (command type) | Shell command; supports env vars |
| async | boolean | false | Background execution (command only) |
| timeout | number | 600/30/60 | Seconds; varies by type |
| statusMessage | string | none | Custom spinner text |
