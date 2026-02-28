<memory-metadata>
{
  "frequency": 57,
  "last_accessed_session": 1021,
  "created_session": 560,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions Claude Code OSS, the Claude Code source code, building Claude Code, the buildable copy from the source map leak, or working with ClaudeCodeOSS repository at /home/yeyito/Workspace/ClaudeCodeOSS.
</conditional>

<fuzzy-match>
Claude Code OSS, ClaudeCodeOSS, source map leak, claude-code build, Ink terminal, TypeScript React CLI, Bun bundler, slash commands, tools, React hooks
</fuzzy-match>

<memory>
Claude Code OSS — buildable copy of Claude Code CLI source recovered from npm source map leak, TypeScript + React/Ink terminal app, located at /home/yeyito/Workspace/ClaudeCodeOSS

## Origin
Anthropic accidentally shipped full inline source maps in @anthropic-ai/claude-code v0.2.8 (Feb 2025). Developer Dave Schumaker recovered the source via Sublime Text's undo buffer. Community forks made it buildable. The ClaudeCodeOSS repo adds missing build config and stub files.

## Build requirements
- Bun >= 1.0, Node >= 18
- `bun install` then `bun run build` (production single-file bundle) or `bun run dev` (tsx dev mode)
- Build uses Bun.build() API (scripts/build.mjs), matching Anthropic's toolchain
- MACRO.* compile-time constants via define; dev mode uses preload script (src/setup.ts)
- Dependencies pinned to exact versions from v0.2.32 publish date (2025-03-05); key transitive deps pinned via overrides in package.json

## Architecture — monolithic CLI: TypeScript + React/Ink for terminal UI, commander for arg parsing, Bun bundler

### Key directories
- `src/tools/` — 16 tools: AgentTool, ArchitectTool, BashTool, FileEditTool, FileReadTool, FileWriteTool, GlobTool, GrepTool, lsTool, MCPTool, MemoryReadTool, MemoryWriteTool, NotebookEditTool, NotebookReadTool, StickerRequestTool, ThinkTool
- `src/commands/` — 19 slash commands (clear, compact, config, cost, doctor, help, init, login, logout, onboarding, resume, review, etc.)
- `src/hooks/` — 14 React hooks (useArrowKeyHistory, useCancelRequest, useCanUseTool, useExitOnCtrlCD, useTextInput, etc.)
- `src/services/` — API communication: claude.ts is main 28KB service, MCP client, OAuth, Sentry, Statsig feature flags
- `src/screens/` — TUI screens: REPL, Doctor, ConfigureNpmPrefix, LogList, ResumeConversation
- `src/components/` — 40+ Ink components (PromptInput, Message, ToolUseLoader, StructuredDiff, permissions/, messages/, etc.)
- `src/permissions.ts` — permission/sandbox model
- `vendor/` — vendored ripgrep binary and Anthropic SDK

### Key dependencies
@anthropic-ai/sdk (vendored), @modelcontextprotocol/sdk, ink, @inkjs/ui, react, commander, chalk, marked, highlight.js, sharp, @sentry/node, @statsig/js-client, zod

## Added/stub files (not in original source map)
- package.json, tsconfig.json, src/globals.d.ts, src/setup.ts
- src/components/CustomSelect/index.ts (barrel re-export)
- src/components/McpAddWizard.tsx (interactive MCP server setup wizard, added in v0.2.32)
- src/utils/conversationRecovery.ts, src/utils/melonWrapper.ts (stubs)
- src/tools/MemoryReadTool/prompt.ts, src/tools/MemoryWriteTool/prompt.ts (stubs, prompt.ts rewritten in v0.2.32)

## Semantic diff verification
Semantic diff compares our build against the npm binary at the AST level. Current v0.2.32 baseline: 2735 unchanged / 4480 npm chunks (61% match). String comparison: 5 missing app strings (all from intentional auto-updater stubs). See reference/build-toolchain.md for full details.

## Reference docs
- reference/about.md — backstory of the source map leak
- reference/build.md — build instructions and list of added/modified files
- reference/build-toolchain.md — toolchain matching strategy, dep pinning, semantic diff baseline

---
Update this memory when new tools, commands, hooks, or screens are added; when build process changes; or when build requirements are updated.
</memory>
