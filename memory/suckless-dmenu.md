<memory-metadata>
{
  "frequency": 27,
  "last_accessed_session": 0,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions dmenu, suckless, dynamic menu, application launcher, or vi-mode patch.
</conditional>

<fuzzy-match>
dmenu, suckless, drw.c, config.h, vi-mode, dmenu_run, center patch, border patch
</fuzzy-match>

<memory>
Patched fork of suckless dmenu, a dynamic menu and application launcher used as a fuzzy picker.

## Location

- Source: `/home/yeyito/Config/dmenu/`
- Config: `/home/yeyito/Config/dmenu/config.h`

## Code Organization

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

## Patches Applied

- **vi-mode**: dmenu starts in normal mode with vi-style keybindings; patch file kept at `vi-mode.diff`
- **center**: `-c` option to center dmenu on screen (controlled by `centered` and `min_width` in config.h)
- **border**: configurable border width and color

## Building

```bash
cd /home/yeyito/Config/dmenu && make && sudo make install
```
No need for `make clean` — just `make && sudo make install`. Changes take effect immediately on next invocation; no restart needed.

## Makefile Targets

`all` (dmenu + stest), `clean`, `dist`, `install`, `uninstall`

## Notes

- `config.h` shows clang errors when analyzed standalone — expected, it's included during the main build
- Changes should be built and installed immediately, not left as uncommitted edits
- No test suite — manual testing only

---
Update this memory when dmenu's patches, code organization, or build process changes.
</memory>
