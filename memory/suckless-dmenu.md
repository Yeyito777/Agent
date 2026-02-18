<memory-metadata>
{
  "frequency": 15,
  "last_accessed_session": 0,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<memory>
dmenu suckless dynamic menu launcher — patched fork at ~/Config/dmenu/, config.h colors fonts prompt, vi-mode center border patches, build install (make && sudo make install), code layout dmenu.c drw.c stest.c util.c arg.h, dmenu_run dmenu_path scripts, application launcher, fuzzy picker, no test suite

# Location
- Source: `/home/yeyito/Config/dmenu/`
- Config: `/home/yeyito/Config/dmenu/config.h`

# Code Organization
| File | Purpose |
|------|---------|
| `dmenu.c` | Main dmenu source |
| `drw.c` / `drw.h` | Drawing/rendering utilities |
| `stest.c` | File test utility (built alongside dmenu) |
| `util.c` / `util.h` | General utilities |
| `arg.h` | Argument parsing macros |
| `config.h` | All user configuration (colors, fonts, prompt, centering, border) |
| `config.def.h` | Default config template |
| `dmenu_run` / `dmenu_path` | Helper scripts for launching programs |
| `vi-mode.diff` | Vi-mode patch (applied — dmenu starts in normal mode) |

# Patches Applied
- **vi-mode**: dmenu starts in normal mode with vi-style keybindings; patch file kept at `vi-mode.diff`
- **center**: `-c` option to center dmenu on screen (controlled by `centered` and `min_width` in config.h)
- **border**: configurable border width and color

# Building
```bash
cd /home/yeyito/Config/dmenu && make && sudo make install
```
No need for `make clean` — just `make && sudo make install`.

# Makefile Targets
`all` (dmenu + stest), `clean`, `dist`, `install`, `uninstall`

# Applying Changes
Takes effect immediately on next invocation — no restart needed.

# Notes
- `config.h` shows clang errors when analyzed standalone — expected, it's included during the main build
- User wants changes built/installed immediately, not left as uncommitted edits
- No test suite — manual testing only

---
Update this memory when dmenu's patches, code organization, or build process changes.
</memory>
