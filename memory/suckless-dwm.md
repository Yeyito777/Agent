<memory-metadata>
{
  "frequency": 73,
  "last_accessed_session": 1165,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions dwm, dwmblocks, suckless, tiling window manager, config.h, persist mode, or the dwm source at ~/Config/dwm/.
</conditional>

<fuzzy-match>
dwm, dwmblocks, suckless, config.h, persist-mode, _DWM_SAVE_ARGV, dwm-save, tiling WM
</fuzzy-match>

<memory>
The user's window manager is a custom fork of dwm, the suckless dynamic tiling window manager, with source code at ~/Config/dwm/.

## Location

- Source: `/home/yeyito/Config/dwm/`
- Config: `/home/yeyito/Config/dwm/config.h`

## Code Organization

| File | Purpose |
|------|---------|
| `dwm.c` | Main window manager source (monolithic) |
| `drw.c` / `drw.h` | Drawing/rendering utilities |
| `util.c` / `util.h` | General utilities |
| `transient.c` | Transient window handling |
| `config.h` | All user configuration (keybindings, layouts, colors, rules) |
| `config.def.h` | Default config template |
| `reference/` | Reference docs — read these before touching related features |
| `scripts/` | Helper scripts (e.g. `dwm-save`), installed to `/usr/local/bin/` |

## Reference Docs

Located in `reference/` — always read these before touching related features:

- `spawn-term-here.md` — spawning terminals in the current working directory
- `persist-mode.md` — `--persist` flag, session save/restore, `_DWM_SAVE_ARGV` IPC
- `dwm-save.md` — `dwm-save` helper script for registering/clearing window save entries
- `cfact-per-window-resize.md` — per-window column width resizing via `cfact` field in tilecols layout

## Building

```bash
cd /home/yeyito/Config/dwm && make && sudo make install
```

No need for `make clean` — just `make && sudo make install`. Makefile targets: `all` (dwm), `clean`, `dist`, `install`, `uninstall`, `test`.

## Persist Mode (`--persist` / `-p`)

`dwm -p` saves and restores windows across restarts via `~/.runtime/dwm/`. Programs opt in by setting the `_DWM_SAVE_ARGV` X11 property (any string type — `STRING` or `UTF8_STRING`). dwm reads the property in two places: `manage()` (catches pre-existing properties) and `propertynotify()` (catches later changes) — both use `AnyPropertyType`.

dwm writes `.save` files (argv + metadata) in numbered tag dirs (`1/`, `2/`, ...). On window death while running (`unmanage()` with `running == 1`), the `.save` file is removed; during shutdown (`running == 0`), save files are preserved for restore. On restore startup it backs up to `dwm-backup/`, reads `.save` files, spawns programs, and deletes the files (programs re-register themselves). Uses a SIGTERM handler for clean shutdown and liveness pruning on quit.

See `reference/persist-mode.md` and `reference/dwm-save.md` for full details.

## Applying Changes

**CRITICAL**: The user restarts dwm themselves. NEVER send signals to dwm (kill -HUP, pkill, etc.) — this kills the entire X session and all running programs. After building, just tell the user the build is ready and they'll restart dwm on their own.

## Notes

- `config.h` shows clang errors when analyzed standalone — expected, it's included during the main build.
- The user wants changes built and installed immediately, not left as uncommitted edits.
- Tests live in `test/` — run with `make test`. Tests extract pure math from layout/resize logic into standalone C that compiles without X11 dependencies.
- dwmblocks (status bar) is a separate project at `/home/yeyito/Config/dwmblocks/` (dwmblocks-async fork). Restart it with `killall dwmblocks; setsid dwmblocks &` or just restart dwm.

---
Update this memory when dwm's code organization, build process, or restart workflow changes.
</memory>
