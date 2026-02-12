# Forgetting Agent Analysis

## Round 1: Clearly disposable

### ARCHIVED: old-meeting-action-items
```
Meeting action items from project sync — January 2024 sprint planning, assigned tasks, all deadlines passed

Sprint Planning Jan 15 2024. Action items all completed. Next sync Jan 29. Moving to bi-weekly sprints. Using Jira instead of Trello.
```

### ARCHIVED: one-time-csv-parsing
```
One-time CSV data cleanup script — parsing export.csv, removing duplicates, fixing date formats for a one-off import

Used this to clean up a one-time data export:
import pandas as pd; df = pd.read_csv('export.csv'); df.drop_duplicates(subset=['email']); df.to_csv('cleaned.csv')
Ran it once, imported the data, done.
```

### KEPT (+1): temp-debug-session-notes
```
Temporary debugging notes from a one-time session — tried restarting nginx, checked logs, found the 502 was from upstream timeout

# Debug Session 2024-01-15
Ran: sudo systemctl restart nginx, journalctl -u nginx, curl -v localhost:8080
Found upstream at 10.0.0.5:3000 was timing out. Fixed by increasing proxy_read_timeout to 120s.
The 502 errors stopped after the restart.
```

---

## Round 2: Borderline + valuable

### ARCHIVED: python-virtualenv-commands
```
Python virtualenv quick reference — common venv commands, pip freeze, requirements.txt workflow

# Python Virtualenv Commands
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pip freeze > requirements.txt
deactivate

Note: Use python3 on systems where python defaults to 2.x.
```

### KEPT (+1): systemd-service-template
```
systemd service file template — creating custom services, ExecStart, Restart, WantedBy, common options

# Systemd Service Template
[Unit]
Description=My Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/my-app
Restart=on-failure
RestartSec=5
User=yeyito
WorkingDirectory=/home/yeyito/apps/my-app

[Install]
WantedBy=multi-user.target

Install: sudo cp my-app.service /etc/systemd/system/ && sudo systemctl daemon-reload && sudo systemctl enable --now my-app
```

### KEPT (+2): home-server-network-layout
```
Home server network topology — IP assignments, VLAN setup, DNS, services running on each machine

# Network Layout
- Router: 192.168.1.1 (OpenWrt)
- Server (proxmox): 192.168.1.10
  - VM: media (192.168.1.11) — Jellyfin, Sonarr, Radarr
  - VM: infra (192.168.1.12) — Pi-hole, Wireguard, Nginx Proxy Manager
  - CT: backups (192.168.1.13) — Borgmatic to external drive
- NAS: 192.168.1.20 — 4x4TB ZFS mirror
- Desktop (yeyito): 192.168.1.50

VLAN 10: trusted devices
VLAN 20: IoT (isolated)
Wireguard: 10.0.0.0/24, port 51820

DNS: Pi-hole at .12, upstream Cloudflare DoH
```

---

## Round 3: All borderline

### ARCHIVED: git-rebase-workflow
```
Git interactive rebase workflow — squashing commits, reordering, editing commit messages, fixup vs squash

# Interactive Rebase
git rebase -i HEAD~3       # last 3 commits
git rebase -i main         # all commits since branching from main

Commands: pick, reword, edit, squash, fixup, drop
- squash = merge into previous, combine messages
- fixup = merge into previous, discard message

If conflicts: resolve, git add ., git rebase --continue
Abort: git rebase --abort
```

### KEPT (+1): pacman-aur-helpers
```
Arch Linux pacman and AUR helpers — yay commands, package queries, cache cleanup, user prefers yay over paru

# Pacman
sudo pacman -Syu          # full system upgrade
sudo pacman -S pkg        # install
sudo pacman -Rns pkg      # remove with deps and config
pacman -Qs search         # search installed
pacman -Qe                # explicitly installed
sudo pacman -Sc           # clean old cache

# yay (user's AUR helper)
yay -S aur-pkg            # install from AUR
yay -Sua                  # update AUR packages only
yay --editmenu            # review PKGBUILD before install

User prefers yay over paru. Has yay aliased in zshrc.
```

### KEPT (+2): backup-restore-procedure
```
System backup and restore procedure — borgmatic config, backup schedule, restore steps, critical paths to back up

# Borgmatic Config
Location: /etc/borgmatic/config.yaml
Repo: /mnt/nas/backups/desktop

# What's backed up
- /home/yeyito/ (excluding .cache, .local/share/Trash, node_modules, .venv)
- /etc/ (system config)
- /home/yeyito/Config/ (suckless source, dotfiles)

# Schedule
Systemd timer runs daily at 3am. Keeps: 7 daily, 4 weekly, 6 monthly.

# Restore
borgmatic list                              # list archives
borgmatic extract --archive latest --path /home/yeyito/Config
borgmatic extract --archive 2024-01-15 --path /etc/nginx

# Critical: After fresh install
1. Install borgmatic: sudo pacman -S borgmatic
2. Copy config from NAS: sudo cp /mnt/nas/backups/borgmatic-config.yaml /etc/borgmatic/config.yaml
3. borgmatic extract --archive latest
```
