Linux swap file setup — 16GB /swapfile, fstab configuration, swappiness default 60, create/remove/resize swap commands, OOM prevention for heavy builds, clone-to-disk.sh integration for disk cloning

# Swap File Configuration

## Current Setup
- 16GB swapfile at `/swapfile`
- Entry in `/etc/fstab`: `/swapfile none swap sw 0 0`
- Swappiness: default (60)
- Reason: prevent OOM kills during heavy builds (e.g. Chromium)

## Clone Script Integration
- `clone-to-disk.sh` in `~/Workspace/Utils/` excludes `/swapfile` from rsync
- In full clone mode, the script creates a fresh 16GB swapfile on the target disk and adds the fstab entry

## Undo (Remove Swap)
```bash
sudo swapoff /swapfile        # Deactivate
sudo rm /swapfile             # Delete the file
```
Then remove the `/swapfile none swap sw 0 0` line from `/etc/fstab`.

## Redo (Recreate Swap)
```bash
sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```
Then add `/swapfile none swap sw 0 0` to `/etc/fstab`.

## Resize
```bash
sudo swapoff /swapfile
sudo fallocate -l <NEW_SIZE> /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

---
**Keeping this memory up to date:** If the swapfile size, location, or swappiness is changed, update this file. If the clone script swap logic changes, update the "Clone Script Integration" section.
