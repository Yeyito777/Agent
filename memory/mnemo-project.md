<memory-metadata>
{
  "frequency": 5,
  "last_accessed_session": 926,
  "created_session": 842,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions Mnemo, OAuth flow, TypeScript OAuth client, Claude Code login replication, Anthropic authentication, PKCE, or TUI terminal interface.
</conditional>

<fuzzy-match>
mnemo, oauth, bun, typescript, pkce, qutebrowser, tui, anthropic, credentials, s256, auth flow, oidc
</fuzzy-match>

<memory>
Mnemo project — Bun/TypeScript OAuth client replicating Claude Code login against Anthropic subscription auth, PKCE flow, TUI chat with streaming inference, conversation persistence, sidebar

## Overview
Mnemo is a personal project at ~/Workspace/Mnemo — a Bun/TypeScript OAuth client that replicates the Claude Code login flow against Anthropic's subscription auth (platform.claude.com). Uses the same CLIENT_ID as Claude Code with a complete PKCE OAuth2 flow including S256 code challenge.

## Functionality
- Authenticates via Anthropic OAuth: authorize → token exchange → profile/roles fetch
- Uses same CLIENT_ID and scopes as Claude Code
- Credentials stored in ~/.mnemo/credentials.json (mode 0600)
- Launches qutebrowser with dedicated basedir (~/.runtime/qutebrowser-mnemo) for OAuth browser flow
- CLI mode with login/status/logout subcommands
- Interactive TUI with streaming inference and conversation persistence

## Tech Stack
- Runtime: Bun
- Language: TypeScript
- No external dependencies (only @types/bun and typescript as devDeps)
- Custom raw-mode TUI built on ANSI escape codes (alt buffer, cursor control)

## TUI Details
- Chat-like interface with commands: /login, /logout, /status, /clear, /quit, /model, /new
- Streaming inference via Anthropic Messages API (SSE), model switching (sonnet/haiku/opus)
- Conversation persistence: auto-saves to ~/.config/mnemo/conversations/ after each response
- Toggleable sidebar (Ctrl+M) showing previous conversations, navigable with j/k, loadable with Enter
- Ctrl+M requires st terminal patch (CSI 109;5u via kitty keyboard protocol)
- Multi-line input (Ctrl+J / Shift+Enter), adaptive input area (up to 6 rows)
- Right-aligned user messages with distinct background, word-wrapped assistant messages
- Vim modal editing on input prompt: insert/normal modes, cursor shape changes (bar/block), word motions (w/b/e), operators (d/c + motion, dd/cc), x/D/C/p/u, i/a/I/A — see reference/vim-bindings.md
- Nvim-style scroll: Ctrl+Y/E (line), Ctrl+U/D (half page), Ctrl+B/F (full page)

## Key Files
- src/oauth.ts — PKCE flow, token exchange, refresh, profile/roles fetch, browser launch
- src/server.ts — Local HTTP callback server (random port 39152-49151)
- src/pkce.ts — Code verifier/challenge generation (SHA-256 + base64url)
- src/store.ts — Credential persistence (~/.mnemo/credentials.json)
- src/conversations.ts — Conversation persistence (~/.config/mnemo/conversations/)
- src/api.ts — Anthropic Messages API client (streaming SSE, token refresh)
- src/tui/ — Terminal UI modules: app.ts, state.ts, renderer.ts, input.ts, terminal.ts, ansi.ts, text.ts, vim.ts

## Testing
- bun test runs unit + E2E tests
- E2E tests use a tmux harness (tests/tmux-harness.ts) — spawns the TUI in a detached tmux session, sends keystrokes, captures screen output
- Manual tmux testing is mandatory for new features (see CLAUDE.md)

## Status
Working OAuth + streaming inference + conversation persistence + sidebar + vim modal editing. Active development.

---
Update this memory when major features are added or architecture changes.
</memory>
