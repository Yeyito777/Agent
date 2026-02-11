User's dwm (dynamic window manager) fork — location, build workflow, and key details.

# Location
- Source: `/home/yeyito/Config/dwm/`
- Config: `/home/yeyito/Config/dwm/config.h`

# Code Organization
| File | Purpose |
|------|---------|
| `dwm.c` | Main window manager source (monolithic) |
| `drw.c` / `drw.h` | Drawing/rendering utilities |
| `util.c` / `util.h` | General utilities |
| `transient.c` | Transient window handling |
| `config.h` | All user configuration (keybindings, layouts, colors, rules) |
| `config.def.h` | Default config template |
| `reference/` | Reference docs — read these before touching related features |

# Reference Docs
Located in `reference/` directory — read these before touching related features:
- `spawn-term-here.md` — spawning terminals in the current working directory
- `persist-mode.md` — `--persist` flag, session save/restore, `_DWM_SAVE_ARGV` IPC

# Building
```bash
cd /home/yeyito/Config/dwm && make && sudo make install
```
No need for `make clean` — just `make && sudo make install`.

# Makefile Targets
`all` (dwm), `clean`, `dist`, `install`, `uninstall`

# Applying Changes
**CRITICAL**: The user restarts dwm themselves. NEVER send signals to dwm (kill -HUP, pkill, etc.) — this kills the entire X session and all running programs. After building, just tell the user the build is ready and they'll restart dwm on their own.

# Notes
- `config.h` shows clang errors when analyzed standalone — expected, it's included during the main build
- User wants changes built/installed immediately, not left as uncommitted edits
- No test suite — manual testing only
- dwmblocks (status bar) is a separate project at `/home/yeyito/Config/dwmblocks/` (dwmblocks-async fork); restart it with `killall dwmblocks; setsid dwmblocks &` or just restart dwm

---
Update this memory when dwm's code organization, build process, or restart workflow changes.
