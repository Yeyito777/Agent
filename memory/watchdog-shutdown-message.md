<memory-metadata>
{
  "frequency": 11,
  "last_accessed_session": 0,
  "created_session": 0,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions watchdog, shutdown message, reboot warning, sp5100_tco, or systemd stopping the watchdog.
</conditional>

<fuzzy-match>
watchdog, sp5100_tco, watchdog0, RebootWatchdogSec, did not stop, systemd-shutdown
</fuzzy-match>

<memory>
Fixing the "watchdog did not stop!" message that appears during poweroff and reboot, caused by a systemd 259 behavior change with the sp5100_tco AMD watchdog module.

## The Issue
The message `watchdog: watchdog0: watchdog did not stop!` prints during every poweroff or reboot.

## Cause
The **sp5100_tco** module (AMD SP5100/SB800 TCO watchdog timer) loads automatically at boot. When systemd was upgraded from 258.1 to **259** on Feb 2, 2026, `systemd-shutdown` began taking over the hardware watchdog during shutdown by default, using `RebootWatchdogSec=10min`. The driver prints the warning when systemd tries to stop and then re-acquire the device.

## Fix Applied
Set `RebootWatchdogSec=off` in `/etc/systemd/system.conf` (line 37). This prevents systemd-shutdown from grabbing the watchdog, which suppresses the message while keeping the module loaded.

## Why Not Blacklist
The plan is to repurpose this desktop as a server, where hardware watchdog functionality (auto-reboot on hard hang) is actually useful for headless/unattended operation.

## Watchdog Details
- Module: `sp5100_tco`
- Device: `/dev/watchdog0`
- Identity: SP5100 TCO timer
- Heartbeat: 60 sec
- nowayout: 0 (can be stopped)

## If Turning Into a Server
Re-enable the reboot watchdog and consider also enabling the runtime watchdog in `/etc/systemd/system.conf`:
```
RuntimeWatchdogSec=30
RebootWatchdogSec=10min
```
This auto-reboots the machine if systemd hangs for 30 seconds, and ensures shutdown completes within 10 minutes.

---
**Keeping this memory up to date:** If systemd is upgraded and behavior changes again, or if the machine is converted to a server and watchdog settings are re-enabled, update this file.
</memory>
