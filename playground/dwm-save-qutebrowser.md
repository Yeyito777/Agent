# dwm-save persistence for qutebrowser

## What was done

Added automatic `_DWM_SAVE_ARGV` registration to qutebrowser so dwm's persist mode (`--persist`) can restore it across restarts.

## File changed

`qutebrowser/mainwindow/mainwindow.py`

### Imports added

```python
import subprocess
import sys
```

### New method: `_set_dwm_save_argv()`

Sets the `_DWM_SAVE_ARGV` X11 property on the main window using `xprop`. This is the same mechanism `dwm-save` uses for terminal programs, but applied directly from inside qutebrowser.

Guards:
- **First window only** (`win_id == 0`) — IPC dedup means extra instances just exit, and session autosave restores all windows from the first instance
- **X11 only** — skips on Wayland via `qtutils.is_wayland()`

The registered argv is:
```
qutebrowser --basedir ~/.runtime/qutebrowser-yeyito
```
Built from `sys.argv[0]` + `objects.args.basedir`. Session autosave handles tab/window restore, so no URLs or `--restore` flag needed.

Wrapped in try/except — logs at debug level, never crashes.

### Hook point: `showEvent()`

Called from `showEvent()` with a `_dwm_save_registered` flag so it fires exactly once on first show (when the window ID is available).

## Verification

```bash
xprop -id $(xdotool search --name qutebrowser | head -1) _DWM_SAVE_ARGV
```

Should output:
```
_DWM_SAVE_ARGV(STRING) = "qutebrowser --basedir /home/yeyito/.runtime/qutebrowser-yeyito"
```
