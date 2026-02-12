~/.runtime/ persistence directory — dwm save/restore, st scrollback/CWD/cursor persistence, dwm-backup, qutebrowser basedir container, .save files, tag directories, per-terminal state, dwm.log, session survival across restarts

# Location
`~/.runtime/`

# Structure

## `dwm/` — Active Window Session State
- **`dwm.log`** — dwm runtime/debug log. Records persist events, window discovery, save file writes, startup sequencing.
- **Numbered tag directories (`1/`, `2/`, `3/`, ...)** — One per dwm tag (workspace). Contains `.save` files named `<program>-<pid>.save`.
- Each `.save` file format:
  - Line 1: relaunch command (e.g. `st --from-save /home/yeyito/.runtime/st/st-<pid>` or `qutebrowser --basedir ...`)
  - Remaining lines: window metadata — `tile_pos`, `stack_pos`, `tags`, `isfloating`, `isfullscreen`, `x`, `y`, `w`, `h`, `focused`

## `dwm-backup/` — Previous Session Snapshot
- Same structure as `dwm/`. On persist-mode restart, dwm backs up current `dwm/` here before reading save files and spawning programs. Safety net for failed restores.

## `st/` — Per-Terminal Persistence Data
- Subdirectories named `st-<pid>/`, one per running terminal instance.
- Contents:
  - **`generic-data.save`** — Plain text: `cwd=<path>` and `cursor_y=<row>`
  - **`scrollback-history.save`** — Binary blob of terminal scrollback buffer
  - **`log.log`** — st's stderr log for that instance (persist init, escape sequence warnings, etc.)

## `qutebrowser-yeyito/` — Qutebrowser Container
- Separate from the dwm/st persist system. This is qutebrowser's `--basedir` container (config, data, cache, downloads, IPC socket). See `memory/qutebrowser-runtime.md`.

# Save/Restore Cycle
1. **Running**: st saves scrollback, CWD, cursor to `~/.runtime/st/st-<pid>/` every 30s and on exit. Sets `_DWM_SAVE_ARGV` X11 property, which dwm picks up and writes as `.save` file in the appropriate tag dir under `~/.runtime/dwm/`.
2. **dwm shutdown**: `.save` files are preserved (on normal window close they get removed, but during shutdown they're kept).
3. **dwm restart**: backs up `dwm/` → `dwm-backup/`, reads `.save` files, spawns recorded commands, places windows at saved position/tag.
4. **st restore**: new st reads `generic-data.save` + `scrollback-history.save` from saved directory, restoring CWD, cursor row, and scrollback history. Uses saved dimensions so the window is created at correct size (avoids tresize content loss).

# Key Points
- `~/.runtime/` is the shared filesystem protocol between dwm and st that makes the desktop session persistent
- Programs opt in to dwm persistence by setting the `_DWM_SAVE_ARGV` X11 property
- dwm reads this property in `manage()` (pre-existing) and `propertynotify()` (later changes), using `AnyPropertyType`
- st's save directory path is based on PID: `~/.runtime/st/st-<pid>/`

---
Update this memory when the runtime directory structure, save file format, or the save/restore cycle changes.
