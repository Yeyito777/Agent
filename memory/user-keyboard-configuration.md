Keyboard configuration — keyd remappings (caps lock to escape, escape to F13), key repeat rate (startx -ardelay 200 -arinterval 22), right shift zsh autosuggestion in st, XKB F13 fix with pacman hook, lock-keyboard-daemon, /etc/keyd/default.conf, keysym, xmodmap alternative

# Remappings (kernel-level via keyd)
- **Caps Lock → Escape**
- **Escape → F13** (keycode 191 in X, patched xkb `inet` symbols so X reports `F13` not `XF86Tools`)
- Right-hand modifiers explicitly passed through to preserve X keysym identity
- Config: `/etc/keyd/default.conf`
- Service: `keyd.service` (systemd, enabled)
- Requires `uinput` kernel module (`/etc/modules-load.d/uinput.conf`)
- User is in `input` group (for direct evdev LED writes)

# Repeat rate (X server default via startx flags)
- Delay: 200ms, Rate: 45 repeats/sec (~22ms interval)
- Config: `~/.zshrc` — `alias startx='startx -- -ardelay 200 -arinterval 22'`
- Sets X server's default autorepeat so it survives keyd restarts and new device connections
- Note: `AutoRepeat` in xorg.conf.d `InputClass` is silently ignored by libinput; `xset r rate` in `.xinitrc` doesn't survive keyd restarts

# Right Shift in st
- st emits `\033]777;right-shift\a` on standalone Right Shift press (`Config/st/x.c`, `config.h`)
- zsh binds this to `autosuggest-accept`: `bindkey '\e]777;right-shift\a' autosuggest-accept`
- keyd normalizes left/right modifier variants by default — `rightshift = rightshift` must be explicit in the keyd config or st won't see `XK_Shift_R`

# F13 / XKB fix
- keyd emits evdev F13 (keycode 183), X adds 8 → keycode 191
- Default xkb `inet(evdev)` symbols mapped `<FK13>` to `XF86Tools` — patched to `F13` in `/usr/share/X11/xkb/symbols/inet` line 194
- Pacman hook `/etc/pacman.d/hooks/xkb-f13.hook` reapplies the patch after `xkeyboard-config` upgrades
- Code should use `XK_F13` (from `<X11/keysym.h>`), not `XF86XK_Tools`
- Note: keycode 179 also mapped to `XF86Tools` (duplicate) — no longer matters since nothing binds `XF86Tools`

# lock-keyboard-daemon
- Source: `~/Workspace/LockKeyboard/` (git tracked, `make install` → `~/.local/bin/`)
- Grabs X keyboard, lights caps lock LED, waits for Shift+F13 to unlock
- Uses direct evdev `EV_LED` writes to `/dev/input/eventX` for instant LED control
  (keyd manages sysfs LED state and would reset writes to `/sys/class/leds/`)
- Finds the physical keyboard dynamically by scanning `/sys/class/leds/`, skipping keyd's virtual device

# Why keyd over XKB
- Previous approach used `/usr/share/X11/xkb/symbols/custom` — lives in package-managed space (symlinked via `xkeyboard-config`), gets wiped on package updates
- keyd config lives in `/etc/keyd/` — pacman never overwrites untracked files in `/etc/`
- Kernel-level: works in TTY, X11, Wayland, before display server starts
- Panic sequence if config breaks input: Backspace+Escape+Enter

# History
- 2026-02-09: Migrated from XKB custom symbols to keyd for remappings
- 2026-02-09: Rewrote lock-keyboard-daemon with evdev LED control and XF86Tools detection
- 2026-02-09: Fixed F13→XF86Tools xkb mapping — patched `inet` symbols + pacman hook, switched daemon and dwm bind to `XK_F13`
- 2026-02-09: Moved repeat rate back to `xset r rate` in `.xinitrc` — `AutoRepeat` in xorg.conf.d doesn't work with libinput
- 2026-02-09: Moved repeat rate from `xset r rate` in `.xinitrc` to X server flags via startx alias (`-ardelay 200 -arinterval 22`) — survives keyd restarts
- Old files removed: `/usr/share/X11/xkb/symbols/custom`, `setxkbmap`/`xmodmap` from `.xinitrc`, `~/.Xmodmap`, `/etc/X11/xorg.conf.d/00-keyboard.conf`

---
If anything changes (new remappings, different repeat rate, switching away from keyd), update this file.
If st's right shift behavior changes, update the "Right Shift in st" section.
If lock-keyboard-daemon changes, update the "lock-keyboard-daemon" section.
