<memory-metadata>
{
  "frequency": 7,
  "last_accessed_session": 0,
  "created_session": 0,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
systemd watchdog "did not stop!" shutdown message — sp5100_tco AMD TCO timer module, RebootWatchdogSec=off fix in /etc/systemd/system.conf, systemd 259 behavior change, hardware watchdog for future server repurposing, poweroff/reboot warning

# Watchdog Shutdown Message

## The Issue
"watchdog: watchdog0: watchdog did not stop!" printed during poweroff/reboot.

## Cause
- The **sp5100_tco** module (AMD SP5100/SB800 TCO watchdog timer) loads automatically at boot
- **systemd 259** (upgraded from 258.1 on Feb 2, 2026) changed behavior: `systemd-shutdown` now takes over the hardware watchdog during shutdown by default using `RebootWatchdogSec=10min`
- The driver prints the warning when systemd tries to stop then re-acquire it

## Fix Applied
Set `RebootWatchdogSec=off` in `/etc/systemd/system.conf` (line 37). This prevents systemd-shutdown from grabbing the watchdog, suppressing the message while keeping the module loaded.

## Why Not Blacklist
User plans to repurpose the desktop as a server, where hardware watchdog functionality (auto-reboot on hard hang) is actually useful for headless/unattended operation.

## Watchdog Details
- Module: `sp5100_tco`
- Device: `/dev/watchdog0`
- Identity: SP5100 TCO timer
- Heartbeat: 60 sec
- nowayout: 0 (can be stopped)

## If Turning Into a Server
Re-enable the reboot watchdog and consider also enabling runtime watchdog in `/etc/systemd/system.conf`:
```
RuntimeWatchdogSec=30
RebootWatchdogSec=10min
```
This will auto-reboot the machine if systemd hangs for 30 seconds, and ensure shutdown completes within 10 minutes.

---
**Keeping this memory up to date:** If systemd is upgraded and behavior changes again, or if the machine is converted to a server and watchdog settings are re-enabled, update this file.
</memory>
