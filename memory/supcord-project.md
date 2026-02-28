<memory-metadata>
{
  "frequency": 19,
  "last_accessed_session": 1159,
  "created_session": 0,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions Supcord, Discord alternative, the Rust Axum backend, Tauri desktop app, or the Ed25519 identity system.
</conditional>

<fuzzy-match>
Supcord, supcord-server, Ed25519, Axum, Tauri, WebSocket protocol, decentralized chat
</fuzzy-match>

<memory>
Supcord is a privacy-first, decentralized Discord alternative built because Discord introduced age verification and face ID tracking. The goal is zero verification, zero accounts, zero data harvesting. The project lives at `~/Workspace/Supcord` and Phase 1 is complete — the app is functional end-to-end.

## Tech Stack

- **Backend**: Rust with Axum + Tokio for async, SQLite via sqlx for storage, and Ed25519 identity using ed25519-dalek.
- **Frontend**: React 19 + TypeScript + Vite 7 with a dark Discord-like UI.
- **Desktop**: Tauri v2 wraps the frontend (WebKit on Linux/macOS, Chromium on Windows).
- **Browser identity**: @noble/ed25519 handles keypair generation in the browser, persisted in localStorage.

## Architecture

The infrastructure is zero-trust by design — servers relay and persist messages but are not trust anchors. E2EE is planned but not yet implemented.

Identity is based on Ed25519 keypairs. A user's ID is the first 16 bytes of their public key, base64url-encoded. Display names are not unique.

Communication uses a tagged JSON wire protocol over WebSocket: `{ "type": "...", "data": ... }`.

The server deploys as a single binary with CLI flags: `--port`, `--bind`, `--text-only`, `--database`.

Licensed under MIT OR Apache-2.0.

## Workspace Layout

```
~/Workspace/Supcord/
  Cargo.toml           # workspace root (edition 2024, resolver 2)
  TODO.md              # immediate action items
  protocol/            # shared types crate (identity, message, permissions, wire)
  server/              # axum server binary
    src/main.rs        # CLI entry point (clap)
    src/state.rs       # AppState with Database + DashMap connections
    src/storage/mod.rs # SQLite layer (5 tables: users, servers, channels, members, messages)
    src/api/mod.rs     # router (/health, /ws)
    src/api/ws.rs      # WebSocket handler (auth, messages, CRUD, subscriptions, history)
  desktop/src-tauri/   # Tauri v2 shell
  client/              # React frontend
    src/lib/types.ts   # Wire protocol TypeScript types
    src/lib/identity.ts # Ed25519 keypair generation + localStorage persistence
    src/lib/store.tsx  # React context (WebSocket, state management, all actions)
    src/components/    # ServerList, ChannelList, MessageArea, MemberList
  reference/           # roadmap.md, dependencies.md
```

## Current State (Phase 1 complete)

All foundation work is done: SQLite storage, auth flow, real message send/receive with broadcast, server/channel CRUD with invite codes, and the frontend fully wired to the backend. The app works end-to-end.

## Key Design Decisions

- **TLS now, E2EE later**: Using TLS for transport security first. E2EE via MLS/mls-rs is planned, but "unable to decrypt" is worse than no encryption at this stage.
- **Topology**: Starting with an always-on node, then evolving to super-peers and eventually auto-replication.
- **Voice**: Planned as adaptive — admin-hosted SFU for groups of 5+, WebRTC P2P fallback for 1-4 participants.
- **History visibility**: Admin-configurable per channel (None / Days(N) / All).
- **No federation**: Intentionally deferred because it makes everything harder.

## Running It

```bash
## Server
cd ~/Workspace/Supcord && cargo run --bin supcord-server

## Frontend dev
cd ~/Workspace/Supcord/client && bun run dev

## Open http://localhost:5173
```

## System Dependencies (Arch)

Tauri requires: gtk3, webkit2gtk-4.1, libappindicator-gtk3, librsvg. See `reference/dependencies.md` for the full list.

---
Update this memory when the project structure, architecture decisions, tech stack, or current phase changes significantly.
</memory>
