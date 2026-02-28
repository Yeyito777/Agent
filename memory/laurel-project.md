<memory-metadata>
{
  "frequency": 5,
  "last_accessed_session": 1104,
  "created_session": 929,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions Laurel, clip recording, gpu-screen-recorder, Medal.tv replacement, replay buffer, hotkey recording, or the clips.yeyito.dev domain.
</conditional>

<fuzzy-match>
laurel, clip, gpu-screen-recorder, replay, hotkey, Super+G, kitsune, clips.yeyito.dev, medal.tv, laurel-replay, laurel-clip, laurel-hotkey, self-hosted clips, screen recording
</fuzzy-match>

<memory>
Laurel — self-hosted Medal.tv replacement for Linux — hotkey Super+G generates shareable clip links. Architecture: gpu-screen-recorder (replay mode, 60s buffer), laurel-hotkey (XGrabKey listener), laurel-clip (upload pipeline), nginx+certbot on kitsune server

## How it works
gpu-screen-recorder runs in replay mode (hardware-accelerated, rolling 60s buffer in RAM). When the hotkey (Super+G) is pressed, laurel-hotkey sends SIGUSR1 to gpu-screen-recorder, which dumps the buffer to MP4. The -sc hook fires laurel-clip, which generates a slug, renders an HTML page with OG tags, uploads via SCP to kitsune:/srv/clips/<slug>/, copies the URL to clipboard, and sends a notification. Total pipeline: 3-7 seconds.

## Architecture
- **Local**: gpu-screen-recorder (recording), laurel-replay (process manager), laurel-clip (upload hook), laurel-hotkey (XGrabKey listener for Super+G)
- **Server (kitsune)**: nginx serves clips over HTTPS at clips.yeyito.dev, certbot handles TLS, ffmpeg generates thumbnails
- **DNS**: clips.yeyito.dev → CNAME → kitsune.yeyito.dev → A record (DDNS via DNSimple, 5-min timer)

## Key files
- laurel-replay: shell script, subcommands start/stop/save/status. Manages both gpu-screen-recorder and laurel-hotkey processes. PIDs in ~/.local/share/laurel/{replay,hotkey}.pid
- laurel-clip: -sc hook, handles slug generation (timestamp+random hex), HTML templating ({{PLACEHOLDER}} tokens), SCP upload, clipboard (xclip), notification
- laurel-hotkey: C program (~95 lines), uses XGrabKey on root window to globally grab a key combo. Takes pidfile, key name, and modifier as args. Handles NumLock/CapsLock variants. Sends SIGUSR1 on keypress.
- laurel-hotkey.c + Makefile: compile with `cc -o laurel-hotkey laurel-hotkey.c -lX11`
- config.sh: all tunables — CAPTURE_TARGET, BUFFER_DURATION, FPS, CODEC, AUDIO_SOURCE, HOTKEY_KEY, HOTKEY_MOD, CLIP_SERVER, CLIP_DIR, CLIP_DOMAIN, NOTIFY_CMD
- laurel-replay.service: systemd user service (Type=forking), auto-starts on graphical-session.target
- server/clip-template.html: HTML with OG/Twitter card meta tags for rich embeds
- server/clips.yeyito.dev: nginx server block config
- install.sh / uninstall.sh: local install/uninstall (compiles laurel-hotkey, copies scripts, sets up systemd service)
- server/install.sh / server/uninstall.sh: remote server setup

## Reference documentation
Detailed docs in ~/Workspace/Laurel/reference/:
- about.md: project overview, architecture, file layout, config table, dependencies
- recording.md: gpu-screen-recorder details, replay mode, codec selection, laurel-replay subcommands, systemd integration
- upload-pipeline.md: laurel-clip step-by-step (slug gen, HTML, SCP, thumbnail, clipboard, notification), timing estimates
- install-and-config.md: install/uninstall instructions, config variables, common config changes
- server.md: nginx config, TLS/certbot, ffmpeg thumbnails, port forwarding, disk usage estimates
- dns-and-networking.md: DNS records, DDNS system, TTL, network path for uploads
- embed-system.md: OG tags, Twitter cards, platform-specific embed behavior, template customization, debugging

## Dependencies
Local: gpu-screen-recorder, xclip, ssh, scp, od, sed, notify-send, libX11
Server: nginx, certbot, certbot-nginx, ffmpeg

---
Update this memory when Laurel's architecture, key files, or configuration changes.
</memory>
