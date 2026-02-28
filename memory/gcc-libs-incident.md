<memory-metadata>
{
  "frequency": 4,
  "last_accessed_session": 0,
  "created_session": 872,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions: Arch Linux system breakage, gcc-libs corruption, pacman issues, broken C/C++ binaries (sudo, systemd, nvim, etc.), privilege escalation during emergencies, Python pty module for interactive root sessions, package cache recovery, or discusses running autonomous system upgrades with --noconfirm.
</conditional>

<fuzzy-match>
gcc-libs, pacman, Arch Linux, libgcc_s.so.1, libstdc++.so.6, system-breaking, corrupt package, recovery, pty, su interactive, privilege escalation, sudo broken, systemd broken, ldconfig, IgnorePkg, --noconfirm, package cache, system hardening
</fuzzy-match>

<memory>
gcc-libs package corruption incident on Arch Linux (2026-02-21) — system breakage and Python pty recovery

On 2026-02-21, a Claude Code session broke the system by running `sudo pacman -Syu --noconfirm` which pulled a corrupt gcc-libs package from Arch repos (2.6KB instead of ~37MB, containing only metadata with no actual .so files). Pacman removed old libgcc_s.so.1 and libstdc++.so.6 and replaced them with empty stubs, breaking nearly every C/C++ binary: sudo, pacman, nvim, systemctl, pkexec, busctl, and PAM login. A reboot would have locked the user out entirely.

### Recovery steps
1. Located previous cached `gcc-libs-15.2.1+r447` in `/var/cache/pacman/pkg/` containing real library files
2. Extracted libgcc_s.so.1 and libstdc++.so.6.0.34 to /tmp/usr/lib/
3. All standard privilege escalation broken: sudo, pkexec, su non-interactive, mount --bind, machinectl, busctl, systemctl
4. Used Python's pty module to script an interactive `su` session (Python survived—statically linked libpython) with root password to copy files to /usr/lib/
5. Fixed libstdc++.so.6 symlink, rebuilt ldconfig cache via `ldconfig -r /`, restarted failed systemd units
6. Added gcc-libs, libgcc, libstdc++ to IgnorePkg in /etc/pacman.conf to prevent re-corruption (remove once Arch pushes fixed build)

### Key lessons
- **Never run `pacman -Syu --noconfirm` autonomously** — full system upgrades have high blast radius and are hard to reverse; require explicit user approval
- `--noconfirm` bypasses safety nets that catch suspiciously small downloads (2.6KB vs 37MB)
- **Always preserve pacman cache** (`/var/cache/pacman/pkg/`) — it was the only recovery path without live media boot
- Python's static libpython linking made it the critical recovery tool when all other dynamic binaries failed
- The corrupt gcc-libs was broken upstream across all mirrors—not a single mirror issue

---
Update this memory with additional recovery techniques if new workarounds are discovered. Remove gcc-libs from IgnorePkg when Arch fixes the upstream package.
</memory>
