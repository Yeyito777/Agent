# LibrePods Patch: Audio Sink Switching on Ear Detection

## Goal
Patch LibrePods' Linux app so that putting AirPods on switches the default audio
sink to AirPods, and taking them off switches back to speakers.

## Repo
https://github.com/kavishdevar/librepods — `linux/` directory (Qt6/C++/QML)

## How Ear Detection Currently Works

The signal flow is:

```
Bluetooth packet → parseData() → EarDetection → MediaController::handleEarDetection()
```

1. **`eardetection.hpp`** — Parses raw BT packets (bytes 6 and 7) into per-earbud
   states: `InEar`, `NotInEar`, `InCase`, `Disconnected`. Exposes helpers like
   `oneOrMorePodsInEar()`. Emits `statusChanged()` signal.

2. **`main.cpp`** — When an 8-byte ear detection packet arrives, it calls
   `m_deviceInfo->getEarDetection()->parseData(data)` then passes the result to
   `mediaController->handleEarDetection(...)`.

3. **`MediaController`** — Receives ear state and does MPRIS play/pause via D-Bus.

Currently, taking AirPods off **pauses playback** but does NOT switch the audio
output device. AirPods remain the active PipeWire sink.

## The Patch

### Approach A: Patch MediaController (simplest)

Inside `MediaController::handleEarDetection()`, after the existing play/pause
logic, add a system call to switch the PipeWire default sink:

```cpp
#include <cstdlib>

void MediaController::handleEarDetection(EarDetection* earDetection) {
    // ... existing play/pause logic ...

    if (earDetection->oneOrMorePodsInEar()) {
        // Switch output to AirPods
        system("wpctl set-default <AIRPODS_SINK_ID>");
    } else {
        // Switch output to speakers
        system("wpctl set-default <SPEAKERS_SINK_ID>");
    }
}
```

**Problem:** Hardcoded sink IDs. They change across reboots/reconnects.

### Approach B: Dynamic sink lookup (recommended)

Instead of hardcoding IDs, resolve them at runtime:

```cpp
void switchSink(const std::string& sinkName) {
    // Use pw-cli or wpctl to find the sink ID by name, then set it
    std::string cmd = "wpctl set-default $(wpctl status | grep '"
                      + sinkName + "' | head -1 | awk '{print $1}')";
    system(cmd.c_str());
}
```

Or better yet, use PipeWire's D-Bus interface directly since the app already has
a D-Bus connection for BlueZ and MPRIS. This avoids shelling out.

### Approach C: Config-driven (most complete)

Add a user-facing config (in the QML settings or a config file) where you specify:
- Sink name for "ears on" (e.g., `bluez_output.XX_XX_XX_XX_XX_XX.a2dp-sink`)
- Sink name for "ears off" (e.g., `alsa_output.pci-0000_00_1f.3.analog-stereo`)

This makes it work for anyone, not just your specific hardware.

## Recommended Implementation Order

1. **Start with Approach A** — hardcode your sink IDs just to prove it works
2. **Graduate to Approach B** — dynamic lookup by name/description
3. **Optionally do Approach C** — if you want to upstream the patch

## How to Find Your Sink IDs

```sh
# List all sinks with their IDs and names
wpctl status          # look under "Audio > Sinks"
pw-cli list-objects   # verbose, shows node.name and node.description
pactl list sinks      # if using PipeWire's PulseAudio compat layer
```

## Files to Modify

| File | Change |
|---|---|
| `linux/MediaController` (`.cpp`/`.hpp`) | Add sink switching logic in `handleEarDetection()` |
| `linux/eardetection.hpp` | No changes needed — already exposes the right state |
| `linux/main.cpp` | No changes needed — already wires ear detection to MediaController |

## Build & Test

```sh
cd linux/
mkdir build && cd build
cmake ..
make
./librepods
```

Then just put AirPods on/off and check `wpctl status` to see if the default sink
changes.

## Notes
- The Rust rewrite (PR #241) is in draft and takes a totally different approach.
  This patch targets the current Qt/C++ codebase which is what's usable today.
- If you want D-Bus sink switching instead of shelling out to wpctl, look at
  PipeWire's `org.freedesktop.portal.Desktop` or the WirePlumber D-Bus API.
