<memory-metadata>
{
  "frequency": 26,
  "last_accessed_session": 888,
  "created_session": 139,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions clone-to-disk, cloning the live system, rsync disk clone, portable boot drive, or USB clone script.
</conditional>

<fuzzy-match>
clone-to-disk, clone-to-disk.sh, rsync clone, USB clone, live clone, portable boot drive, disk backup script
</fuzzy-match>

<memory>
`clone-to-disk.sh` is a script that clones the live root filesystem onto a target disk (default `/dev/sda`) using rsync, producing a bootable portable drive. It lives at `~/Workspace/Utils/clone-to-disk.sh`.

## Modes

The script has three modes that control how aggressively it writes to the target:

- **full** (default): Wipes the target disk entirely, creates fresh GPT partitions (512MB EFI + remainder as ext4), copies everything, regenerates fstab with the new UUIDs, creates a 16GB swapfile, and installs a GRUB bootloader.
- **update** (`--update` / `-u`): Syncs changes to an existing clone using `--delete` so files removed from the source are also removed from the target. Excludes `/etc/fstab` and `/boot/grub/grub.cfg` to preserve the target's own boot config.
- **soft-update** (`--soft-update` / `-s`): Same as update but without `--delete`, so extra files already on the target are kept.

## What rsync excludes

These paths are always excluded because they are either virtual filesystems, mount points, or host-specific:

- Virtual filesystems: `/dev/*`, `/proc/*`, `/sys/*`, `/run/*`, `/tmp/*`
- Mount points: `/mnt/*`, `/media/*`
- Other: `/lost+found`, `/swapfile`, `/etc/ssh/ssh_host_*`, `/etc/systemd/system/*/sshd.service`

Per-directory filter rules are also supported via `--filter=': .rsync-filter'`. For example, `~/.rsync-filter` excludes `/.ssh/id_*` so private keys don't land on the clone.

In update modes specifically, `/etc/fstab` and `/boot/grub/grub.cfg` are additionally excluded to avoid overwriting the target's boot configuration.

## What is NOT excluded (notable)

- `/etc/machine-id` is cloned as-is, so both machines share the same machine-id.
- NetworkManager connection profiles are copied, but sanitized of hardware-specific fields (see below).

## Post-rsync sanitization

After the copy, the script strips hardware-specific fields from NetworkManager profiles so the clone works on different hardware. Specifically, it removes `interface-name=`, `mac-address=`, and `cloned-mac-address=` from all `.nmconnection` files. Wifi passwords and other settings are preserved.

## Full mode extras

When running in full mode, several additional steps happen after rsync:

- Regenerates `/etc/fstab` with the target disk's UUIDs
- Creates a 16GB swapfile on the target
- Bind-mounts `/proc`, `/sys`, `/dev`, `/run` for chroot, using `--make-rslave` to prevent host mount propagation (avoids "target is busy" on unmount)
- Unmounts bind mounts with `umount -R` (recursive) to handle any sub-mounts
- Adds `amdgpu.gpu_recovery=1 amdgpu.runpm=0` kernel params if not already present
- Installs GRUB EFI bootloader with `--bootloader-id=USBClone --removable`

## Accepted rsync exit codes

Because this runs against a live system, some "error" codes are expected and treated as success:

- 0: Success
- 23: Partial transfer (normal for a live system where some files are locked)
- 24: Files vanished before transfer (normal for a live system with transient files)

---
**Keeping this memory up to date:** If modes, excludes, post-rsync steps, or partition layout change in clone-to-disk.sh, update the relevant section. If new sanitization steps are added (e.g. machine-id regeneration), add them under Post-rsync sanitization.
</memory>
