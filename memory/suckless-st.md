<memory-metadata>
{
  "frequency": 76,
  "last_accessed_session": 1164,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions st, suckless terminal, vimnav, sshind, notif, persist, cmdline, search, config.h, or building/patching a terminal emulator.
</conditional>

<fuzzy-match>
st, suckless, st.c, x.c, vimnav, sshind, notif.c, persist.c, cmdline.c, search.c, config.h, st-notify, OSC 779, _ST_CWD, _ST_NOTIFY, dwm persist
</fuzzy-match>

<memory>
The user's st (simple terminal) is a heavily customized suckless fork with vim-style navigation, a command-line overlay, regex search, SSH indicators, notification popups, and dwm persist integration. It is not vanilla st — most features are implemented as separate C modules bolted onto the core.

The source lives at `/home/yeyito/Config/st/`. Before doing any work there, read the project-level instructions at `/home/yeyito/Config/st/CLAUDE.md`. User configuration (fonts, colors, keybindings) is in `/home/yeyito/Config/st/config.h`, with `config.def.h` as the default template.

## Code organization

Each major feature lives in its own file pair, keeping the codebase modular:

| File | Purpose |
|------|---------|
| `st.c` / `st.h` | Core terminal functionality |
| `x.c` / `win.h` | X11 windowing |
| `vimnav.c` / `vimnav.h` | Vim-style navigation mode (Escape to enter, hjkl movement, Ctrl+u/d half-page scroll, visual select, f/F char search, text objects) |
| `sshind.c` / `sshind.h` | SSH indicator overlay — shows active SSH hostname |
| `notif.c` / `notif.h` | Notification popup overlay — driven by the `_ST_NOTIFY` X11 property; helper script at `scripts/st-notify` |
| `persist.c` / `persist.h` | dwm persist integration — save/restore scrollback, screen, cursor_y, CWD, and ephemeral flag |
| `cmdline.c` / `cmdline.h` | Vim-like `:` command-line overlay with insert/normal/visual modes, text objects, history, and `/`/`?` search dispatch |
| `search.c` / `search.h` | Regex search module — pattern compilation, match highlighting, n/N navigation, scroll centering, `:noh` to clear |
| `config.h` | All user configuration (fonts, colors, keybindings) |
| `config.def.h` | Default config template |

## Custom features

**Nav mode** — Vim-like scrollback navigation, coordinated with zsh vi-mode via custom OSC sequences (777, 778, 779). The terminal works closely with zsh vi-mode; see `README.md` for required `.zshrc` config.

**CWD tracking** — The shell reports its working directory via OSC 779. st stores this as the `_ST_CWD` X11 property and in-memory via `persist_set_cwd()`. Other tools (like `spawntermhere`) read it to open new terminals in the same directory.

**Save command override** — External programs can set a custom restore command via the `_ST_SAVE_CMD` X11 property (helper script at `scripts/st-save-cmd`). This overrides the OSC 780 altcmd. Used by the Claude Code agent hook to save `agent --resume <session-id>`. See `reference/save-cmd.md`.

**Persistence** — Terminals survive dwm restarts. Every 30 seconds (and on exit), st saves scrollback history, screen content, cursor row, CWD, and an ephemeral flag to `~/.runtime/st/st-<pid>/`. It registers with dwm via `_DWM_SAVE_ARGV` and restores via `st --from-save <dir>`. On restore, `persist_restore()` returns saved dimensions so `xinit()` creates the window at the correct size (avoids tresize content loss). Terminals launched with `-e` save `ephemeral=1` and restore with `zsh -ic <altcmd>` so st closes when the command exits. See `reference/persist.md` for full technical details.

**Notification popups** — Triggered via the `_ST_NOTIFY` X11 property; helper script at `scripts/st-notify`.

**Debug mode** — The `-d` flag enables a prompt overlay/highlight for debugging.

## Reference docs

The `reference/` directory contains detailed documentation for each feature area. Read the relevant doc before touching a feature:

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

## Building and applying changes

```bash
cd /home/yeyito/Config/st && make && sudo make install
```

No need for `make clean` — just `make && sudo make install`. New terminals pick up the updated binary; existing terminals are unaffected. The user expects changes to be built and installed immediately, not left as uncommitted edits.

Note: `config.h` shows clang errors when analyzed standalone — this is expected because it is included during the main build, not compiled on its own.

## Testing

Tests use a minimal custom framework in `tests/test.h` with mocks in `tests/mocks.c` / `tests/mocks.h`.

- Run all tests: `make test`
- Clean test artifacts: `make clean-tests`
- Define tests with `TEST(name)`, run them with `RUN_TEST(name)`, assert with `ASSERT()`, `ASSERT_EQ()`, `ASSERT_STR_EQ()`
- Available test suites: `test_vimnav`, `test_sshind`, `test_scrollback`, `test_cwd`, `test_notif`, `test_persist`, `test_search`
- **Bug fixes must include a regression test automatically** (per CLAUDE.md)

## Makefile targets

`all` (st), `clean`, `dist`, `install`, `uninstall`, `test`, `test_vimnav`, `test_sshind`, `test_scrollback`, `test_cwd`, `test_notif`, `test_persist`, `test_search`

---
Update this memory when st's code organization, features, build process, or testing setup changes.
</memory>
