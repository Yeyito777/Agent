<memory-metadata>
{
  "frequency": 14,
  "last_accessed_session": 0,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<memory>
st-notify popup notification system — usage and options (--timeout, --border, --background, --foreground, --textsize), _ST_NOTIFY X11 property wire protocol, xprop/xdotool, toast stacking, default appearance, sending notifications from shell scripts to st terminal

# Location
- Source: `/home/yeyito/Config/st/notif.c`, `/home/yeyito/Config/st/notif.h`
- Script: `/home/yeyito/Config/st/scripts/st-notify`
- Reference: `/home/yeyito/Config/st/reference/notifications.md`

# Quick Usage

```bash
# Basic notification (sends to current terminal via $$)
st-notify $$ "Hello world"

# With options
st-notify -t 10000 -b "#ff0000" $$ "Error occurred"
st-notify -ts 24 -fg "#00ff00" $$ "Big green text"
st-notify -fg "#ffffff" -bg "#660000" -b "#ff4444" $$ "Alert!"
```

# Options

| Option | Short | Argument | Description |
|--------|-------|----------|-------------|
| `--timeout` | `-t` | `<ms>` | Auto-dismiss timeout in milliseconds (default: 5000) |
| `--border` | `-b` | `<hex>` | Border color, e.g. `"#ff0000"` |
| `--background` | `-bg` | `<hex>` | Background color |
| `--foreground` | `-fg` | `<hex>` | Foreground/text color |
| `--textsize` | `-ts` | `<int>` | Font pixel size (window auto-fits to text) |
| `--help` | `-h` | | Show usage help |

# How It Works
- Uses X11 property `_ST_NOTIFY` on the st window (NOT OSC escape sequences)
- Script finds the X window via `xdotool search --pid <pid>`, then sets the property via `xprop`
- st detects `PropertyNotify`, reads+deletes the property, renders a styled overlay toast
- Toasts stack vertically in the top-right corner (newest on top, pushes old ones down)
- Each toast auto-dismisses independently after its timeout
- Multi-line messages supported (newlines in the message string)
- Max 8 simultaneous toasts; oldest evicted if full

# Wire Protocol (for direct xprop usage)
Options are encoded as a metadata header prepended to the message:
- `\x1f` separates key=value pairs
- `\x1e` separates metadata header from message body
- Format: `key=val\x1fkey=val\x1f\x1emessage body`
- Keys: `t` (timeout), `b` (border), `bg` (background), `fg` (foreground), `ts` (textsize)

```bash
# Direct xprop (no script needed)
xprop -id <window-id> -f _ST_NOTIFY 8u -set _ST_NOTIFY "Plain message"
```

# Default Appearance
- Border: `#1d9bf0` (blue), 2px thick
- Background: `#00050f` (terminal background)
- Foreground: `#ffffff` (white)
- Font: 1.5x terminal font size
- Timeout: 5000ms
- Margin: 10px, Padding: 8px, Toast gap: 6px

# Configuration
All defaults live in `notif.h` as `static const` variables. Rebuild st after changes:
```bash
cd /home/yeyito/Config/st && make && sudo make install
```

# Dependencies
Requires `xdotool` and `xprop` to be installed.

---
Update this memory when st-notify options, wire protocol, or defaults change.
</memory>
