Arch Linux disk audit and cleanup — NVMe partition usage breakdown, cleanup candidates (pip/qutebrowser/go/yay caches, build artifacts, pacman cache, coredumps, orphaned packages), du/paccache/journalctl commands, per-directory size analysis, safe vs risky cleanup actions, disk space, storage

## System layout

- Single partition: `/dev/nvme1n1p2` (916G, ~8% used)
- Swap: `/swapfile` (16G, file-based, no zram active despite `zram-generator` being installed)
- Boot: GRUB, EFI, two kernels (`linux` mainline + `linux-lts`, booted into LTS)
- RAM: 32G

## Home directory (~41G)

### Workspace (~30G)
| Directory | Size | Notes |
|---|---|---|
| Qutebrowser/ | 26G | Custom build. `build/` is 14G, `.git/` is 6.3G, `qtwebengine/` is 4.6G |
| Polymarketing/ | 4G | V4 has 3.4G Rust `target/` build artifacts. V2 is 522M (old version) |
| XColor/ | 434M | |
| PersonalWebsite/ | 156M | |
| Everything else | <200M combined | Small projects |

### Dotfiles / hidden dirs (~11G)
| Directory | Size | Notes |
|---|---|---|
| .local/rust/ | 3.7G | rustup toolchains (1.4G) + cargo registry (858M) |
| .local/bun/ | 2.8G | bun install cache (2.6G) + global installs (1.6G) + binary (97M) |
| .local/share/claude/ | 850M | Old Claude Code versions (4 stored, likely only need latest) |
| .local/share/qutebrowser/ | 461M | Browser data |
| .cache/qutebrowser/ | 1.4G | Browser cache, regenerates automatically |
| .cache/pip/ | 555M | Downloaded wheels, safe to purge |
| .cache/yay/ | 151M | AUR build cache |
| .cache/go-build/ | 136M | Go build cache, rebuilds on demand |
| .claude/ | 375M | Projects (286M), debug logs (47M), file-history (30M) |
| .bun/ | 61M | |
| .config/ | 49M | |

## System directories

### /var (6.5G)
| Directory | Size | Notes |
|---|---|---|
| /var/cache/pacman/pkg/ | 4.9G | Old package versions. `paccache -rk2` or `paccache -rk1` to trim |
| /var/lib/systemd/coredump/ | 1.3G | Crash dumps — python segfaults (qutebrowser), QtWebEngine crashes, occasional zsh/test crashes |
| /var/log/journal/ | 311M | Systemd journal. Can vacuum with `journalctl --vacuum-size=100M` |
| /var/lib/pacman/ | 28M | Package database, do not touch |

### /usr (4.3G)
| Directory | Size | Notes |
|---|---|---|
| /usr/lib/ | 2.6G | System libraries |
| /usr/share/ | 1.1G | Shared data, fonts, etc. |
| /usr/bin/ | 457M | Binaries |
| /usr/lib/firmware/ | 380M | Hardware firmware blobs |
| /usr/lib/go/ | 237M | Go standard library (orphaned — nothing depends on it) |
| /usr/lib/python3.14/ | 146M | Python stdlib |
| /usr/lib/qt6/ | 56M | Qt6 libraries |

### /boot (125M)
- `vmlinuz-linux` + `vmlinuz-linux-lts` (two kernels)
- `initramfs-linux.img` + `initramfs-linux-lts.img`
- User boots into LTS; mainline (`linux` 6.18.8) is unused

## Cleanup candidates

### Safe / zero-risk (caches that regenerate)
- `pip cache purge` — 555M
- `rm -rf ~/.cache/qutebrowser` — 1.4G
- `rm -rf ~/.cache/go-build` — 136M
- `rm -rf ~/.cache/yay` — 151M (rebuilds when needed)
- `sudo journalctl --vacuum-size=100M` — reclaims ~200M

### Low-risk (build artifacts, rebuild on demand)
- `rm -rf ~/Workspace/Qutebrowser/build/` — 14G
- `cd ~/Workspace/Polymarketing/PolymarketingV4 && cargo clean` — 3.4G
- `sudo rm -rf /var/lib/systemd/coredump/*` — 1.3G
- `sudo paccache -rk2` — keeps last 2 versions, reclaims ~2-3G from pacman cache
- `bun pm cache rm` — 2.6G bun cache

### Worth reviewing with user
- **Old Claude Code versions** (~850M in `.local/share/claude/versions/`) — 4 versions stored, probably only need current
- **Bun global installs** (1.6G) — check what's installed globally
- **PolymarketingV2** (522M) — old project version, may not be needed
- **Rust toolchains** — `rustup toolchain list` to check for old/unused toolchains
- **Cargo registry** (858M) — `cargo cache` can prune old crate versions

### Packages to review
- **Orphaned packages** (installed as deps, nothing needs them): `ffmpeg, go, libxdamage, libxslt, minizip, python-jinja, python-pyqt6, python-yaml, re2` — remove with `sudo pacman -Rns $(pacman -Qdtq)`
- **`speech-dispatcher`** (28M) — text-to-speech. NOT running (service disabled, no processes). Has Python bindings in site-packages. Installed because qutebrowser TTS requires it and was nagging about it. DO NOT suggest removing.
- **`noto-fonts-cjk`** (299M) — CJK fonts, remove if user doesn't read Chinese/Japanese/Korean
- **`linux`** mainline kernel (144M) — unused, user boots LTS. Could remove if LTS-only is fine
- **`zram-generator`** (768K) — installed but zram is not active, only swapfile is used. Tiny footprint. User unsure why it's there but not sure about removing it yet.

### Packages confirmed needed (DO NOT suggest removing)
- **`chromium-widevine`** — needed for Spotify playback in custom qutebrowser build
- **`arch-install-scripts`** — user runs their own Arch installs
- **`yay-debug`** — user actively uses it

### Anomalies
- Python (3.13/3.14) segfaults regularly — caused by user experimenting with their custom qutebrowser/qtwebengine build. Expected behavior given the dev workflow. Coredumps accumulate over time.
- `zram-generator` installed but not functioning (no zram devices active)
- The 476M QtWebEngine coredump (Feb 2) was a SIGTRAP from a renderer process with client-id=67. Huge because it dumped the full renderer memory (GPU raster threads, V8 context, the works). Normal consequence of hacking on qtwebengine.

## Commands cheat sheet
```bash
# Check current disk usage
df -h /
du -sh /home/yeyito/* /home/yeyito/.* 2>/dev/null | sort -rh | head -20

# Pacman cache cleanup (keep last N versions)
sudo paccache -rk2

# List orphaned packages
pacman -Qdtq

# Remove orphaned packages
sudo pacman -Rns $(pacman -Qdtq)

# Clear coredumps
sudo rm -rf /var/lib/systemd/coredump/*

# Limit coredump storage (edit /etc/systemd/coredump.conf)
# Set: MaxUse=500M or Storage=none

# Vacuum journal logs
sudo journalctl --vacuum-size=100M

# Clear pip cache
pip cache purge

# Clear cargo build artifacts in a project
cargo clean

# Check rust toolchains
rustup toolchain list
rustup toolchain remove <name>

# Clear bun cache
bun pm cache rm
```

---

**IMPORTANT: Do NOT clean, delete, or remove anything from the user's disk without explicit instruction. This memory is a reference guide only. Always present options and wait for the user to tell you what to clean. Never be proactive about disk cleanup — the user decides what goes and what stays.**

---

To keep this memory current: re-run the disk audit (`du -sh` commands above) and update sizes/candidates as the system changes. Add new anomalies or large directories as they appear. Remove entries for things that have already been cleaned.
