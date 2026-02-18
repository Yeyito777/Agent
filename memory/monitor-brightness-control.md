<memory-metadata>
{
  "frequency": 5,
  "last_accessed_session": 0,
  "created_session": 360,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
Monitor brightness control — DDC/CI, ddcutil, ddcutil-service D-Bus daemon, busctl, VCP feature 0x10 0x12 contrast, ASUS VG328 external monitor, I2C bus 6 /dev/i2c-6, i2c-dev kernel module, ~/.local/bin/brightness script wrapper, MCCS protocol, screen dimming display backlight, brightnessctl alternative, set get increase decrease percentage, caching debounce flock, Arch Linux pacman AUR packages

## Why not brightnessctl?
`brightnessctl` only works with kernel backlight drivers (laptop panels). The system has no `/sys/class/backlight` device — only keyboard/NIC LEDs in `/sys/class/leds`. External monitors like the ASUS VG328 don't expose a kernel backlight interface.

## How it works
External monitors use **DDC/CI** (Display Data Channel Command Interface) over the **I2C** bus to control settings. The protocol follows the **MCCS** (Monitor Control Command Set) standard where each setting is a **VCP** (Virtual Control Panel) feature code.

Key VCP codes:
- `0x10` — Brightness (0-100)
- `0x12` — Contrast
- `0x16` — Red gain
- `0x60` — Input source

## Hardware details
- Monitor: **ASUS VG328** (product code 12995, manufactured 2020 week 34)
- I2C bus: `/dev/i2c-6`
- DRM connector: `card1-HDMI-A-1`
- VCP version: 2.2

## Kernel module
`i2c-dev` must be loaded for `/dev/i2c-*` devices to exist.
- Auto-loads on boot via `/etc/modules-load.d/i2c-dev.conf`
- Manual load: `sudo modprobe i2c-dev`

## ddcutil (CLI tool)
Direct CLI tool, but slow (~400ms+ per call) due to I2C bus timing and re-initialization on every invocation. Installed as a dependency of ddcutil-service.
```sh
ddcutil --bus 6 --noverify --sleep-multiplier 0.1 setvcp 10 50
```

## ddcutil-service (D-Bus daemon)
Keeps the I2C file descriptor open persistently, avoiding re-initialization overhead. D-Bus activated (starts on first call, no systemd service to manage).

D-Bus coordinates:
- Service: `com.ddcutil.DdcutilService`
- Object: `/com/ddcutil/DdcutilObject`
- Interface: `com.ddcutil.DdcutilInterface`

Raw busctl calls:
```sh
# Get brightness (returns current_val max_val description status_code status_string)
busctl --user call com.ddcutil.DdcutilService /com/ddcutil/DdcutilObject com.ddcutil.DdcutilInterface GetVcp isyu 1 "" 0x10 0

# Set brightness to 50
busctl --user call com.ddcutil.DdcutilService /com/ddcutil/DdcutilObject com.ddcutil.DdcutilInterface SetVcp isyqu 1 "" 0x10 50 0
```

SetVcp type signature `isyqu`: int (display number), string (EDID prefix, empty=""), byte (VCP code), uint16 (value), uint32 (flags, 0=none).

## brightness script
Wrapper at `~/.local/bin/brightness`:
```sh
brightness         # print current value (0-100)
brightness 50      # set to 50%
brightness +10     # increase by 10%
brightness -10     # decrease by 10%
```
Clamps values to 0-100. Caches current brightness in `/tmp/brightness-val` to avoid slow I2C reads. On first invocation per daemon lifetime, sets sleep multiplier to 0.1 (flag file `/tmp/brightness-sleep-init`). Uses debounced writes with flock (`/tmp/brightness-lock`) so only one process talks to I2C at a time; rapid calls coalesce. SetVcp uses flag 4 (NO_VERIFY) for speed.

## Packages
- `ddcutil` (pacman) — core library + CLI
- `ddcutil-service` (AUR via yay) — D-Bus daemon, depends on ddcutil
- `i2c-tools` (pacman) — pulled in as ddcutil dependency

---
*To update: if the monitor, I2C bus number, or D-Bus interface changes, update the hardware details and D-Bus coordinates above. If the brightness script at ~/.local/bin/brightness is modified, update the script section.*
</memory>
