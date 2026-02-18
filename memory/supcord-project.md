<memory-metadata>
{
  "frequency": 7,
  "last_accessed_session": 347,
  "created_session": 0,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
Supcord decentralized Discord alternative — Rust Axum backend, React TypeScript Vite frontend, Tauri v2 desktop app, Ed25519 identity, SQLite storage, WebSocket JSON protocol, privacy-first chat at ~/Workspace/Supcord, Phase 1 complete, E2EE planned

# Motivation
Built because Discord added age verification and face ID tracking. Privacy-first alternative with no verification, no accounts, no data harvesting.

# Tech Stack
- **Backend**: Rust (Axum + Tokio), SQLite via sqlx, Ed25519 identity (ed25519-dalek)
- **Frontend**: React 19 + TypeScript + Vite 7, dark Discord-like UI
- **Desktop**: Tauri v2 (WebKit on Linux/macOS, Chromium on Windows)
- **Browser identity**: @noble/ed25519 for keypair generation, stored in localStorage

# Architecture
- **Zero-trust infrastructure**: servers relay and persist, but are not trust anchors (E2EE planned)
- **Identity**: Ed25519 keypair, UserId = first 16 bytes of public key base64url-encoded, display names not unique
- **Wire protocol**: tagged JSON over WebSocket (`{ "type": "...", "data": ... }`)
- **Server deployment**: single binary with `--port`, `--bind`, `--text-only`, `--database` flags
- **License**: MIT OR Apache-2.0

# Workspace Layout
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

# Current State (Phase 1 complete)
All foundation work is done: SQLite storage, auth flow, real message send/receive with broadcast, server/channel CRUD with invite codes, frontend wired to backend. The app is functional end-to-end.

# Key Design Decisions
- TLS now, E2EE (MLS/mls-rs) later — "unable to decrypt" is worse than no encryption
- Always-on node first, evolving to super-peers then auto-replication
- Voice planned as adaptive: admin-hosted SFU for 5+, WebRTC P2P fallback for 1-4
- Admin-configurable history visibility (None / Days(N) / All)
- No federation yet — intentional, makes everything harder

# Running It
```bash
# Server
cd ~/Workspace/Supcord && cargo run --bin supcord-server

# Frontend dev
cd ~/Workspace/Supcord/client && bun run dev

# Open http://localhost:5173
```

# System Dependencies (Arch)
Tauri requires: gtk3, webkit2gtk-4.1, libappindicator-gtk3, librsvg. See `reference/dependencies.md` for full list.

---
Update this memory when the project structure, architecture decisions, tech stack, or current phase changes significantly.
</memory>
