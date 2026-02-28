<memory-metadata>
{
  "frequency": 50,
  "last_accessed_session": 1176,
  "created_session": 187,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions runtime directory, dwm save/restore, st persistence, scrollback saving, session survival, or .save files.
</conditional>

<fuzzy-match>
~/.runtime, dwm persist, st persist, scrollback save, .save file, dwm-backup, st-<pid>, _DWM_SAVE_ARGV
</fuzzy-match>

<memory>
The `~/.runtime/` directory is the shared filesystem layer that makes the desktop session persistent across restarts. dwm and st coordinate through it to save and restore windows, scrollback, working directories, and layout — and qutebrowser uses it as its basedir container.

## Directory Structure

### `dwm/` — Active Window Session State
`dwm.log` lives here as the runtime/debug log, recording persist events, window discovery, save file writes, and startup sequencing. Numbered tag directories (`1/`, `2/`, `3/`, ...) correspond to dwm tags (workspaces), each containing `.save` files named `<program>-<pid>.save`. The first line of a `.save` file is the relaunch command (e.g. `st --from-save /home/yeyito/.runtime/st/st-<pid>` or `qutebrowser --basedir ...`), and the remaining lines hold window metadata: `tile_pos`, `stack_pos`, `tags`, `isfloating`, `isfullscreen`, `x`, `y`, `w`, `h`, `focused`.

### `dwm-backup/` — Previous Session Snapshot
Mirrors the structure of `dwm/`. When dwm restarts in persist mode, it backs up the current `dwm/` here before reading save files and spawning programs. Acts as a safety net for failed restores.

### `st/` — Per-Terminal Persistence Data
Contains subdirectories named `st-<pid>/`, one per running terminal instance. Each holds:
- **`generic-data.save`** — Plain text with `cwd=<path>` and `cursor_y=<row>`
- **`scrollback-history.save`** — Binary blob of the terminal scrollback buffer
- **`log.log`** — st's stderr log for that instance (persist init, escape sequence warnings, etc.)

### `qutebrowser-yeyito/` — Qutebrowser Container
Separate from the dwm/st persist system. This is qutebrowser's `--basedir` container (config, data, cache, downloads, IPC socket). See `memory/qutebrowser-runtime.md`.

## Save/Restore Cycle

1. **While running**, st saves scrollback, CWD, and cursor position to `~/.runtime/st/st-<pid>/` every 30 seconds and on exit. It sets the `_DWM_SAVE_ARGV` X11 property, which dwm picks up and writes as a `.save` file in the appropriate tag directory under `~/.runtime/dwm/`.
2. **On dwm shutdown**, `.save` files are preserved. During normal window close they get removed, but during shutdown they are kept.
3. **On dwm restart**, the current `dwm/` is backed up to `dwm-backup/`, then dwm reads the `.save` files, spawns the recorded commands, and places windows at their saved position and tag.
4. **On st restore**, the new st process reads `generic-data.save` and `scrollback-history.save` from the saved directory, restoring CWD, cursor row, and scrollback history. It uses the saved dimensions so the window is created at the correct size, avoiding content loss from tresize.

## Key Details

Programs opt in to dwm persistence by setting the `_DWM_SAVE_ARGV` X11 property. dwm reads this property in `manage()` (for pre-existing windows) and `propertynotify()` (for later changes), using `AnyPropertyType`. st's save directory path is always based on its PID: `~/.runtime/st/st-<pid>/`.

---
Update this memory when the runtime directory structure, save file format, or the save/restore cycle changes.
</memory>
