<memory-metadata>
{
  "frequency": 2,
  "last_accessed_session": 0,
  "created_session": 949,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions Notify, notification system, X11 toast, notify-send command, notification daemon, or asks about toast notification architecture and configuration.
</conditional>

<fuzzy-match>
Notify, notify-send, X11 notification, toast notification, notification daemon, _NOTIFY_MSG, wire protocol, notification system, st-notify, config.h, notification colors, notification timeout
</fuzzy-match>

<memory>
Notify X11 toast notification system — architecture, CLI args, configuration, startup, building and installation

Notify is a standalone X11 toast notification system at ~/Workspace/Notify (GitHub: Yeyito777/Notify).

**Architecture**

Single C binary (`notify-send`) with two modes:
- `notify-send -d` — daemon mode (foreground). Watches `_NOTIFY_MSG` X property on root window.
- `notify-send [options] "message"` — client mode. Sets the root window property and exits.

Communication uses the same wire protocol as st-notify: `key=valkey=valmessage body`.

**Files**

- `notify.c` — single-file source with daemon, client, and toast rendering
- `config.h` — suckless-style configuration (colors, font, geometry, timing)
- `Makefile` — `make` builds, `make install` installs to `~/.local/bin`

**CLI Arguments**

| Option | Short | Description |
|--------|-------|-------------|
| `--daemon` | `-d` | Run as notification daemon |
| `--timeout` | `-t` | Auto-dismiss timeout in ms (default: 5000) |
| `--border` | `-b` | Border color hex |
| `--background` | `-bg` | Background color hex |
| `--foreground` | `-fg` | Foreground/text color hex |
| `--textsize` | `-ts` | Font pixel size |
| `--help` | `-h` | Show usage |

**Defaults (ocean palette)**

- Border: `#1d9bf0` (blue), 2px
- Background: `#00050f` (abyss black)
- Foreground: `#ffffff` (white)
- Font: monospace @ 22px
- Timeout: 5000ms
- Position: bottom-right of screen, stacking upward
- Max toasts: 8

**Startup**

The daemon is started in `~/.xinitrc` as `notify-send -d &` before dwm, and killed with `pkill -x notify-send` after dwm exits.

**Building**

```bash
cd ~/Workspace/Notify && make && make install
```

Installs to `~/.local/bin/notify-send`.

---
Update this memory when Notify's architecture, CLI args, defaults, or startup method changes.
</memory>
