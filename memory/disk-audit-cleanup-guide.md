<memory-metadata>
{
  "frequency": 26,
  "last_accessed_session": 1173,
  "created_session": 0,
  "appreciation": 1,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions disk space, storage cleanup, disk audit, freeing space, partition usage, pacman cache, coredumps, orphaned packages, or specific caches (pip, bun, yay, go, cargo).
</conditional>

<fuzzy-match>
disk audit, du -sh, paccache, pacman cache, coredump, orphaned packages, pip cache, bun cache, yay cache, go-build, nvme, vacuum journal, rustup toolchain, cargo cache, disk cleanup
</fuzzy-match>

<memory>
Disk audit and cleanup reference for this Arch Linux system. Covers partition layout, per-directory size breakdown, cleanup candidates ranked by risk, orphaned/reviewable packages, known anomalies, and a command cheat sheet. All sizes are from the most recent audit.

## System Layout

The system runs on a single NVMe partition (`/dev/nvme1n1p2`, 916G, roughly 8% used) with a 16G file-based swap at `/swapfile`. No zram is active despite `zram-generator` being installed. Boot uses GRUB with EFI and carries two kernels: `linux` mainline and `linux-lts`, though only LTS is actually booted. The machine has 32G of RAM.

## Home Directory (~48G)

### Workspace (~37G)

The Qutebrowser custom build dominates at 25G, split across `build/` (14G), `.git/` (6.3G), and `qtwebengine/` (4.6G). Supcord takes 5.4G, Playground 1.8G, and everything else (Utils, Agent, etc.) is under 5M combined. Previously present directories Polymarketing/, XColor/, and PersonalWebsite/ have been removed since the last audit.

### Dotfiles and Hidden Directories (~9G)

Rust tooling under `.local/rust/` accounts for 3.8G (toolchains at 1.4G, cargo registry at 1012M). Bun lives in `.local/bun/` at 2.8G total (install cache 2.7G, global installs 1.6G, binary 97M). Claude Code stores three versions in `.local/share/claude/` totaling 637M. The `.claude/` directory holds 484M across projects (355M), debug logs (77M), and file-history (38M).

Caches: pip at 566M (downloaded wheels, safe to purge), yay at 151M (AUR build cache), go-build at 136M (rebuilds on demand), and qutebrowser at 12K (already cleaned, negligible). Remaining: `.bun/` at 63M, `.config/` at 46M. The `.local/share/qutebrowser/` directory was removed since the last audit.

## System Directories

### /var (6.3G)

The pacman package cache at `/var/cache/pacman/pkg/` is 5.0G of old package versions, trimmable with `paccache -rk2` or `-rk1` (requires `pacman-contrib`, which is currently NOT installed). Coredumps under `/var/lib/systemd/coredump/` sit at 969M, mostly from Python segfaults in qutebrowser and QtWebEngine crashes. The systemd journal at `/var/log/journal/` is 311M and can be vacuumed. The pacman database at `/var/lib/pacman/` (30M) should never be touched.

### /usr (4.5G)

System libraries in `/usr/lib/` take 2.7G, shared data in `/usr/share/` takes 1.2G, binaries in `/usr/bin/` take 394M, and firmware blobs in `/usr/lib/firmware/` take 380M. Notable entries: the Go standard library at `/usr/lib/go/` (237M) is orphaned with nothing depending on it, Python 3.14 stdlib takes 146M, and Qt6 libraries take 56M.

### /boot (125M)

Contains `vmlinuz-linux` + `vmlinuz-linux-lts` and their initramfs images. The user boots into LTS; the mainline kernel (`linux` 6.18.8) is unused.

## Cleanup Candidates

### Safe (zero-risk caches that regenerate)

- `pip cache purge` — 566M
- `rm -rf ~/.cache/qutebrowser` — 12K (already cleaned, negligible now)
- `rm -rf ~/.cache/go-build` — 136M
- `rm -rf ~/.cache/yay` — 151M (rebuilds when needed)
- `sudo journalctl --vacuum-size=100M` — reclaims ~200M

### Low-Risk (build artifacts, rebuild on demand)

- `rm -rf ~/Workspace/Qutebrowser/build/` — 14G
- `sudo rm -rf /var/lib/systemd/coredump/*` — 969M
- `sudo paccache -rk2` — keeps last 2 versions, reclaims ~2-3G (requires `pacman-contrib`, currently NOT installed; install with `sudo pacman -S pacman-contrib`)
- `bun pm cache rm` — 2.7G bun cache

### Worth Reviewing with User

- **Old Claude Code versions** (~637M in `.local/share/claude/versions/`) — 3 versions stored (2.1.37, 2.1.38, 2.1.39), probably only the current one is needed
- **Bun global installs** (1.6G) — check what is installed globally
- **Rust toolchains** — run `rustup toolchain list` to check for old or unused toolchains
- **Cargo registry** (1012M) — `cargo cache` can prune old crate versions

## Packages to Review

Orphaned packages (installed as dependencies, nothing needs them anymore): `ffmpeg, go, minizip, python-jinja, python-pyqt6, python-yaml, re2`. Remove with `sudo pacman -Rns $(pacman -Qdtq)`. Note that `libxdamage` and `libxslt` are no longer orphaned.

Other reviewable packages:
- **`speech-dispatcher`** (28M) — text-to-speech, NOT running (service disabled, no processes), has Python bindings. Installed because qutebrowser TTS requires it and was nagging about it. DO NOT suggest removing.
- **`noto-fonts-cjk`** (299M) — CJK fonts, removable if the user does not read Chinese/Japanese/Korean
- **`linux`** mainline kernel (144M) — unused since the user boots LTS only. Could remove if LTS-only is acceptable.
- **`zram-generator`** (768K) — installed but zram is not active, only the swapfile is used. Tiny footprint. User is unsure why it is there but not ready to remove it yet.

## Packages Confirmed Needed (DO NOT suggest removing)

- **`chromium-widevine`** — needed for Spotify playback in the custom qutebrowser build
- **`arch-install-scripts`** — user runs their own Arch installs
- **`yay-debug`** — user actively uses it

## Known Anomalies

Python 3.14 segfaults regularly due to the user experimenting with their custom qutebrowser/qtwebengine build. This is expected behavior for the dev workflow and causes coredumps to accumulate over time. Python 3.13 is no longer installed.

The `zram-generator` package is installed but not functioning (no zram devices are active).

A 476M QtWebEngine coredump from Feb 2 was a SIGTRAP from a renderer process (client-id=67). It was so large because it dumped the full renderer memory including GPU raster threads and V8 context. This is a normal consequence of hacking on qtwebengine.

## Commands Cheat Sheet

```bash
## Check current disk usage
df -h /
du -sh /home/yeyito/* /home/yeyito/.* 2>/dev/null | sort -rh | head -20

## Pacman cache cleanup (keep last N versions) — requires pacman-contrib (not currently installed)
sudo paccache -rk2

## List orphaned packages
pacman -Qdtq

## Remove orphaned packages
sudo pacman -Rns $(pacman -Qdtq)

## Clear coredumps
sudo rm -rf /var/lib/systemd/coredump/*

## Limit coredump storage (edit /etc/systemd/coredump.conf)
## Set: MaxUse=500M or Storage=none

## Vacuum journal logs
sudo journalctl --vacuum-size=100M

## Clear pip cache
pip cache purge

## Clear cargo build artifacts in a project
cargo clean

## Check rust toolchains
rustup toolchain list
rustup toolchain remove <name>

## Clear bun cache
bun pm cache rm
```

---

**IMPORTANT: Do NOT clean, delete, or remove anything from the user's disk without explicit instruction. This memory is a reference guide only. Always present options and wait for the user to tell you what to clean. Never be proactive about disk cleanup — the user decides what goes and what stays.**

---

To keep this memory current: re-run the disk audit (`du -sh` commands above) and update sizes/candidates as the system changes. Add new anomalies or large directories as they appear. Remove entries for things that have already been cleaned.
</memory>
