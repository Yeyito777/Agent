<memory-metadata>
{
  "frequency": 19,
  "last_accessed_session": 0,
  "created_session": 139,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
clone-to-disk.sh live system cloning script — ~/Workspace/Utils/clone-to-disk.sh, rsync full/update/soft-update modes, USB disk cloning, GPT partitioning, EFI/GRUB bootloader, fstab UUID regeneration, swapfile creation, NetworkManager profile sanitization, .rsync-filter rules, disk backup, portable boot drive

# clone-to-disk.sh

**Location:** `~/Workspace/Utils/clone-to-disk.sh`

## What It Does
Clones the live root filesystem to a target disk (default `/dev/sda`) using rsync, making it a bootable portable drive.

## Modes
- **full** (default): Wipes target, creates fresh GPT partitions (512MB EFI + rest ext4), copies everything, regenerates fstab with new UUIDs, creates 16GB swapfile, installs GRUB bootloader
- **update** (`--update` / `-u`): Syncs changes to existing clone, uses `--delete` to remove files no longer on source. Excludes `/etc/fstab` and `/boot/grub/grub.cfg` to preserve target's boot config
- **soft-update** (`--soft-update` / `-s`): Same as update but without `--delete`, keeps extra files on target

## Rsync Excludes
- Virtual filesystems: `/dev/*`, `/proc/*`, `/sys/*`, `/run/*`, `/tmp/*`
- Mount points: `/mnt/*`, `/media/*`
- Other: `/lost+found`, `/swapfile`, `/etc/ssh/ssh_host_*`, `/etc/systemd/system/*/sshd.service`
- Uses `--filter=': .rsync-filter'` to pick up per-directory filter rules (e.g. `~/.rsync-filter` excludes `/.ssh/id_*`)
- In update modes: also excludes `/etc/fstab` and `/boot/grub/grub.cfg`

## Post-Rsync Sanitization
- **NetworkManager profiles**: Strips `interface-name=`, `mac-address=`, and `cloned-mac-address=` from all `.nmconnection` files so profiles aren't pinned to source hardware. Wifi passwords and other settings are preserved.

## Full Mode Extras
- Regenerates `/etc/fstab` with target disk UUIDs
- Creates 16GB swapfile on target
- Bind-mounts `/proc`, `/sys`, `/dev`, `/run` for chroot with `--make-rslave` to prevent host mount propagation (avoids "target is busy" on unmount)
- Unmounts bind mounts with `umount -R` (recursive) to handle any sub-mounts
- Adds `amdgpu.gpu_recovery=1 amdgpu.runpm=0` kernel params if not present
- Installs GRUB EFI bootloader (`--bootloader-id=USBClone --removable`)

## What Is NOT Excluded (notable)
- `/etc/machine-id` — cloned as-is (both machines share same machine-id)
- NetworkManager connection profiles — copied but sanitized of hardware-specific fields

## Accepted Rsync Exit Codes
- 0: Success
- 23: Partial transfer (normal for live system)
- 24: Files vanished before transfer (normal for live system)

---
**Keeping this memory up to date:** If modes, excludes, post-rsync steps, or partition layout change in clone-to-disk.sh, update the relevant section. If new sanitization steps are added (e.g. machine-id regeneration), add them under Post-Rsync Sanitization.
</memory>
