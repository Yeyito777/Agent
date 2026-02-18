<memory-metadata>
{
  "frequency": 54,
  "last_accessed_session": 511,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<memory>
st simple terminal fork — source at ~/Config/st/, code organization (st.c, x.c, vimnav.c, sshind.c, notif.c, persist.c, cmdline.c, search.c), vim navigation mode, SSH indicator overlay, notification popups, command-line mode (: colon command), regex search (/ forward ? backward, n/N navigation, :noh, live incremental search, scrollback history search), CWD tracking via OSC 779, dwm persist/save/restore, debug mode, make test, config.h, zsh vi-mode coordination, suckless build workflow

# Location
- Source: `/home/yeyito/Config/st/`
- Config: `/home/yeyito/Config/st/config.h`
- Project-level instructions: `/home/yeyito/Config/st/CLAUDE.md` (read this when working in st)

# Code Organization
| File | Purpose |
|------|---------|
| `st.c` / `st.h` | Core terminal functionality |
| `x.c` / `win.h` | X11 windowing |
| `vimnav.c` / `vimnav.h` | Vim-style navigation mode (escape → hjkl, Ctrl+u/d, visual select, f/F char search, text objects) |
| `sshind.c` / `sshind.h` | SSH indicator overlay |
| `notif.c` / `notif.h` | Notification popup overlay |
| `persist.c` / `persist.h` | dwm persist integration (save/restore scrollback, screen, cursor_y, CWD, ephemeral flag) |
| `cmdline.c` / `cmdline.h` | Vim-like `:` command-line overlay (insert/normal/visual modes, text objects, history, `/`/`?` search dispatch) |
| `search.c` / `search.h` | Regex search module (pattern compilation, match highlighting, n/N navigation, scroll centering, :noh) |
| `config.h` | All user configuration (fonts, colors, keybindings) |
| `config.def.h` | Default config template |

# Key Features (Custom)
- **Nav mode**: vim-like scrollback navigation, coordinated with zsh vi-mode via custom OSC sequences (777, 778, 779)
- **SSH indicator**: overlay showing active SSH hostname
- **Notification popups**: via `_ST_NOTIFY` X11 property; helper script at `scripts/st-notify`
- **CWD tracking**: shell reports cwd via OSC 779, stored as `_ST_CWD` X11 property and in-memory via `persist_set_cwd()`
- **Save command override**: via `_ST_SAVE_CMD` X11 property; helper script at `scripts/st-save-cmd`. External programs set a custom restore command that overrides the OSC 780 altcmd. Used by Claude Code agent hook to save `agent --resume <session-id>`. See `reference/save-cmd.md`.
- **Persistence**: survives dwm restarts — saves scrollback history, screen content, cursor row, CWD, and ephemeral flag to `~/.runtime/st/st-<pid>/` every 30s and on exit. Registers with dwm via `_DWM_SAVE_ARGV`, restores via `st --from-save <dir>`. On restore, `persist_restore()` returns saved dimensions so `xinit()` creates the window at the correct size (avoids tresize content loss). Terminals launched with `-e` save `ephemeral=1` and restore with `zsh -ic <altcmd>` so st closes when the command exits. See `reference/persist.md` for full technical details.
- **Debug mode**: `-d` flag for prompt overlay/highlight
- **zsh coordination**: terminal works closely with zsh vi-mode; see `README.md` for required `.zshrc` config

# Reference Docs
Located in `reference/` directory — read these before touching related features:
- `line-highlight.md` — cursor line highlighting
- `forced-nav-mode.md` — Shift+Escape, TUI/alt-screen navigation
- `debug-mode.md` — `-d` flag, prompt overlay
- `function-keys.md` — Ctrl+number, F14-F24, screen percentage, Unicode insert
- `notifications.md` — notification internals
- `st-notify.md` — st-notify usage/options
- `cwd-property.md` — `_ST_CWD`, OSC 779, spawntermhere
- `save-cmd.md` — `_ST_SAVE_CMD`, external restore command override, st-save-cmd script, Claude agent hook
- `persist.md` — dwm restart persistence, save/restore format, binary header, exit behavior, startup flows
- `cmdline.md` — vim-like `:` command-line mode, modal editing (insert/normal/visual), text objects, operator-pending, history, X11 child window, `/`/`?` regex search (live incremental, n/N, :noh)

# Building
```bash
cd /home/yeyito/Config/st && make && sudo make install
```
No need for `make clean` — just `make && sudo make install`.

# Applying Changes
New terminals pick up the updated binary; existing terminals are unaffected.

# Testing
- Run all tests: `make test`
- Clean test artifacts: `make clean-tests`
- Test files live in `tests/` — framework is a minimal custom one in `tests/test.h`
- Mocks: `tests/mocks.c` / `tests/mocks.h`
- Available test suites: `test_vimnav`, `test_sshind`, `test_scrollback`, `test_cwd`, `test_notif`, `test_persist`, `test_search`
- Use `TEST(name)` macro to define tests, `RUN_TEST(name)` to run, assert with `ASSERT()`, `ASSERT_EQ()`, `ASSERT_STR_EQ()`
- **Bug fixes must include a regression test automatically** (per CLAUDE.md)

# Makefile Targets
`all` (st), `clean`, `dist`, `install`, `uninstall`, `test`, `test_vimnav`, `test_sshind`, `test_scrollback`, `test_cwd`, `test_notif`, `test_persist`, `test_search`

# Notes
- `config.h` shows clang errors when analyzed standalone — expected, it's included during the main build
- User wants changes built/installed immediately, not left as uncommitted edits

---
Update this memory when st's code organization, features, build process, or testing setup changes.
</memory>
