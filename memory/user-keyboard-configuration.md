<memory-metadata>
{
  "frequency": 27,
  "last_accessed_session": 1048,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions keyd, key remapping, caps lock, repeat rate, F13, XKB, lock-keyboard-daemon, or right shift.
</conditional>

<fuzzy-match>
keyd, ardelay, arinterval, XK_F13, XF86Tools, lock-keyboard-daemon, keyd.service, inet(evdev), autosuggest-accept
</fuzzy-match>

<memory>
The user's keyboard is configured through keyd for kernel-level remappings, X server flags for repeat rate, and a custom lock-keyboard-daemon for screen locking.

## Remappings (kernel-level via keyd)

Caps Lock is remapped to Escape, and Escape is remapped to F13 (keycode 191 in X, with patched xkb `inet` symbols so X reports `F13` instead of `XF86Tools`). Right-hand modifiers are explicitly passed through to preserve their X keysym identity.

- Config: `/etc/keyd/default.conf`
- Service: `keyd.service` (systemd, enabled)
- Requires `uinput` kernel module (`/etc/modules-load.d/uinput.conf`)
- User is in `input` group (for direct evdev LED writes)

## Repeat rate

Delay is 200ms, rate is 45 repeats/sec (~22ms interval). This is set through X server flags via a startx alias in `~/.zshrc`:

```
alias startx='startx -- -ardelay 200 -arinterval 22'
```

This sets X server's default autorepeat so it survives keyd restarts and new device connections. `AutoRepeat` in xorg.conf.d `InputClass` is silently ignored by libinput, and `xset r rate` in `.xinitrc` doesn't survive keyd restarts.

## Right Shift in st

st emits `\033]777;right-shift\a` on standalone Right Shift press (configured in `Config/st/x.c` and `config.h`). zsh binds this to `autosuggest-accept`:

```
bindkey '\e]777;right-shift\a' autosuggest-accept
```

keyd normalizes left/right modifier variants by default, so `rightshift = rightshift` must be explicit in the keyd config or st won't see `XK_Shift_R`.

## F13 / XKB fix

keyd emits evdev F13 (keycode 183), and X adds 8 to get keycode 191. The default xkb `inet(evdev)` symbols mapped `<FK13>` to `XF86Tools`, so this was patched to `F13` in `/usr/share/X11/xkb/symbols/inet` line 194. A pacman hook at `/etc/pacman.d/hooks/xkb-f13.hook` reapplies the patch after `xkeyboard-config` upgrades.

Code should use `XK_F13` (from `<X11/keysym.h>`), not `XF86XK_Tools`. Keycode 179 was also mapped to `XF86Tools` (duplicate), but this no longer matters since nothing binds `XF86Tools`.

## lock-keyboard-daemon

Source lives at `~/Workspace/.cold/LockKeyboard/` (git tracked, `make install` installs to `~/.local/bin/`). It grabs the X keyboard, lights the caps lock LED, and waits for Shift+F13 to unlock.

It uses direct evdev `EV_LED` writes to `/dev/input/eventX` for instant LED control, since keyd manages sysfs LED state and would reset writes to `/sys/class/leds/`. The daemon finds the physical keyboard dynamically by scanning `/sys/class/leds/`, skipping keyd's virtual device.

## Why keyd over XKB

The previous approach used `/usr/share/X11/xkb/symbols/custom`, which lives in package-managed space (symlinked via `xkeyboard-config`) and gets wiped on package updates. keyd's config lives in `/etc/keyd/`, where pacman never overwrites untracked files. It also works at the kernel level across TTY, X11, and Wayland, even before the display server starts. If a config breaks input, the panic sequence is Backspace+Escape+Enter.

## History

- 2026-02-09: Migrated from XKB custom symbols to keyd for remappings
- 2026-02-09: Rewrote lock-keyboard-daemon with evdev LED control and XF86Tools detection
- 2026-02-09: Fixed F13 to XF86Tools xkb mapping — patched `inet` symbols + pacman hook, switched daemon and dwm bind to `XK_F13`
- 2026-02-09: Moved repeat rate back to `xset r rate` in `.xinitrc` — `AutoRepeat` in xorg.conf.d doesn't work with libinput
- 2026-02-09: Moved repeat rate from `xset r rate` in `.xinitrc` to X server flags via startx alias (`-ardelay 200 -arinterval 22`) — survives keyd restarts
- Old files removed: `/usr/share/X11/xkb/symbols/custom`, `setxkbmap`/`xmodmap` from `.xinitrc`, `~/.Xmodmap`, `/etc/X11/xorg.conf.d/00-keyboard.conf`

---
If anything changes (new remappings, different repeat rate, switching away from keyd), update this file.
If st's right shift behavior changes, update the "Right Shift in st" section.
If lock-keyboard-daemon changes, update the "lock-keyboard-daemon" section.
</memory>
