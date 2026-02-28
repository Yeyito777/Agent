<memory-metadata>
{
  "frequency": 19,
  "last_accessed_session": 1195,
  "created_session": 637,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions Whisper-inference, speech-to-text, ASR (automatic speech recognition), transcription, whisper.cpp, GGML, GPU-accelerated audio processing, Vulkan audio, offline speech recognition, dictation, push-to-talk, whisper-dictate, whisper-ctl, XTest, keystroke injection, or asks about the Whisper workspace at ~/Config/whisper/.
</conditional>

<fuzzy-match>
whisper, whisper-inference, speech-to-text, ASR, transcription, whisper.cpp, GGML, GPU, Vulkan, audio, offline speech, ggml-large, ggml-turbo, run.sh, Makefile, transcribe, dictate, dictation, push-to-talk, whisper-dictate, whisper-ctl, XTest, F1
</fuzzy-match>

<memory>
Whisper-inference workspace — GPU-accelerated speech-to-text, file transcription, and push-to-talk dictation daemon

Whisper-inference is a self-contained, GPU-accelerated speech recognition workspace at ~/Config/whisper/ (git remote: Whisper-inference), built on whisper.cpp (MIT license). Everything is self-contained in this directory — binaries, libs, config, models.

## Structure
- **Makefile** — builds whisper.cpp with CMake (Vulkan + SDL2), then builds dictate binaries (direct g++/gcc). Targets: `all` (configure+build+libs+dictate, build only), `install` (build + install systemd service), `uninstall` (remove service), `dictate` (just dictate binaries, fast), `rebuild`, `clean`
- **run.sh** — interactive TUI model selector + transcription launcher (fuzzy search, j/k navigation, insert mode filtering)
- **whisper-dictate.cpp** (C++17) — push-to-talk dictation daemon. Loads model into VRAM at startup, listens on Unix socket, plays sound feedback (connected/disconnected.wav from assets/), captures mic via SDL2, transcribes with whisper.cpp, injects text via XTest
- **assets/** — sound effects: `connected.wav` (played on F1 press/start), `disconnected.wav` (played on F1 release/stop). Loaded at startup via `SDL_LoadWAV`, played non-blocking via `SDL_QueueAudio` on a separate SDL2 playback device
- **whisper-ctl.c** (C11) — 42-line IPC client. Sends `start`/`stop` to daemon over Unix socket. Spawned by dwm on F1 press/release
- **whisper-dictate.service** — systemd user service source of truth (installed by `make install`)
- **dictate.conf** — runtime config (lives in project dir, resolved via /proc/self/exe): `capture_id`, `model`, `language`, `prompt` (initial decoder prompt for vocab bias), `replace` (post-processing text replacements, e.g. `Qt browser -> qutebrowser`)
- **src/** — whisper.cpp git submodule (from github.com/ggml-org/whisper.cpp)
- **whispercpp/** — compiled binaries + shared libs (whisper-cli, whisper-server, whisper-stream, whisper-bench, libwhisper.so, libggml.so, etc.)
- **models/** — GGML model files: ggml-large-v3.bin (3.1GB, 1.55B params), ggml-large-v3-turbo.bin (1.6GB, 809M params)
- **reference/** — docs: quickstart.md (build/run/flags/hardware), dictate.md (architecture/config/usage), dictate-internals.md (deep implementation details)

## Install
- `make install` builds everything then copies only the service file to `~/.config/systemd/user/` and enables it
- `make uninstall` disables and removes the service file
- All binaries, libs, config, and models stay in ~/Config/whisper/ (self-contained)

## Push-to-Talk Dictation System
Hold F1 to record speech, release to transcribe and type into the focused X11 window.

### Architecture
```
F1 press → dwm → whisper-ctl start → Unix socket → whisper-dictate daemon
F1 release → dwm → whisper-ctl stop → Unix socket →   ├── model in VRAM (turbo)
                                                        ├── SDL2 mic capture (30s buffer)
                                                        ├── whisper.cpp inference (greedy)
                                                        └── XTest keystroke injection → focused window
```

### How it works
1. On login, systemd starts `whisper-dictate`. Turbo model loads into VRAM (~1.6 GB). Daemon opens mic (paused), loads sound effects from `assets/`, and waits on socket.
2. User presses F1 → dwm spawns `whisper-ctl start` → daemon plays `connected.wav`, resumes mic capture, clears audio buffer.
3. User speaks while holding F1. SDL2 audio callback fills 30s circular buffer (480k float32 samples, 1.83 MB).
4. User releases F1 → dwm spawns `whisper-ctl stop` → daemon plays `disconnected.wav`, pauses capture (100ms grace period), grabs buffered audio, runs `whisper_full()`.
5. Transcribed text injected char-by-char into focused window via XTest fake key events (handles UTF-8, shift detection).

### Daemon internals (whisper-dictate.cpp)
- Resolves exe directory via `/proc/self/exe` for portable config/model paths (all relative to project dir)
- `ggml_backend_load_all()` discovers Vulkan + CPU backends
- Whisper context: `use_gpu=true`, `flash_attn=true`
- Inference params: greedy sampling, `no_context=true`, `no_timestamps=true`, `n_threads=4`, language from config
- Socket at `$XDG_RUNTIME_DIR/whisper-dictate.sock` (or `/tmp/whisper-dictate-{uid}.sock`)
- Main loop: `poll()` with 200ms timeout on listening socket
- XTest: opens separate X11 display connection, UTF-8→codepoint→keysym conversion, Unicode keysyms via `0x01000000 | codepoint`

### whisper-ctl (whisper-ctl.c)
- Minimal: `socket()` → `connect()` → `write("start"/"stop")` → `close()`
- Silent failure if daemon not running (so dwm doesn't stall)

### dwm integration
- `keyrelease()` handler added (mirrors `keypress()`, iterates `keyreleases[]` array)
- `XkbSetDetectableAutoRepeat(dpy, True, NULL)` in `setup()` — suppresses X11 autorepeat so holding F1 doesn't spam start/stop
- F1 KeyPress → `spawn whisper-ctl start`, F1 KeyRelease → `spawn whisper-ctl stop` (modifier=0)
- `grabkeys()` grabs keys from both `keys[]` and `keyreleases[]`

### X server disconnect handling
- Daemon survives X restarts without exiting — model stays in VRAM, no reload needed
- `XSetIOErrorHandler` + `setjmp`/`longjmp`: on X disconnect, longjmp back to reconnect loop instead of crashing
- Reconnect loop: polls `XOpenDisplay` every 2s until X is back, then resumes normal operation
- `pending_text` retry: if `xtest_type` was interrupted mid-injection, the text is retried after reconnect (no lost dictations)
- First dictation after X restart has ~2s extra latency (one reconnect cycle), subsequent dictations are normal
- `ExecStartPre` in the service blocks until X is available (`xset q` loop), preventing VRAM churn on initial startup

### systemd user service
- Source of truth: `whisper-dictate.service` in the project, installed to `~/.config/systemd/user/` by `make install`
- `ConditionPathIsDirectory=/sys/module/amdgpu` — service is cleanly skipped (not failed) on machines without AMD GPU
- `ExecStartPre=/bin/sh -c 'until xset q >/dev/null 2>&1; do sleep 2; done'` — waits for X server before starting
- `ExecStart=%h/Config/whisper/whisper-dictate` (uses systemd `%h` home dir specifier)
- `Type=simple`, `Environment=DISPLAY=:0`, `Restart=on-failure`, `RestartSec=2`
- `Restart=on-failure` — daemon survives X disconnects (no exit), only restarts on actual crashes
- `systemctl --user start/stop/restart/enable whisper-dictate`
- Logs: `journalctl --user -u whisper-dictate -f`

### Design decisions
- **No VAD**: Rejected continuous VAD approach due to Whisper hallucinating on silence, buffer management issues, and timing sensitivity. User is the VAD (hold to talk).
- **XTest over xdotool**: No process spawn overhead, direct shift/modifier control, no runtime dependency
- **Greedy over beam search**: ~2x faster, marginal accuracy difference for dictation

## File Transcription (CLI)
- `make` → configure + build + libs + dictate (build only)
- `make install` → build + install systemd service
- `./run.sh [audio.wav]` — TUI model selector, then transcribe
- Direct: `whispercpp/whisper-cli -m models/ggml-large-v3.bin -f audio.wav`
- Audio format: 16-bit WAV, 16kHz, mono. Convert: `ffmpeg -i input.mp3 -ar 16000 -ac 1 -c:a pcm_s16le output.wav`
- Output formats: txt, srt, vtt, csv, json
- `LD_LIBRARY_PATH=~/Config/whisper/whispercpp` needed for direct CLI use

## Hardware
- GPU: AMD Radeon RX 5700 XT (RDNA 1 / Navi 10 / gfx1010), 8 GB VRAM
- Backend: Vulkan via RADV (Mesa)
- Model sizes: tiny 75MB/~400MB VRAM, base 142MB/~500MB, small 466MB/~1GB, medium 1.5GB/~3GB, large-v3 3.1GB/~6GB, large-v3-turbo 1.6GB/~3GB
- Turbo: 4 decoder layers (vs 32 in large-v3), ~6x faster, minimal accuracy loss

## Dependencies
- CMake 3.5+, C/C++ compiler, Vulkan SDK, SDL2, X11 + XTest (libxtst, libx11)
- Optional: FFmpeg, libcurl

---
Update this memory when workspace structure, dictation system, build flags, models, or dependencies change.
</memory>
