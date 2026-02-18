<memory-metadata>
{
  "frequency": 3,
  "last_accessed_session": 489,
  "created_session": 406,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
SSH remote access setup — key-based auth, port forwarding, fail2ban, sshd hardening, remote machine 192.168.0.100 whale kitsune, public IP dynamic via DHCP, kitsune.yeyito.dev DDNS via DNSimple, port 48222, ~/.ssh/config aliases kitsune kitsune-local, ed25519 key, no password auth

## Machines

- **Local (this machine):** yeyito's daily driver
- **Remote:** 192.168.0.100 (LAN), Arch Linux with systemd
- **Router:** Arris, Cable Onda ISP, dynamic IP via DHCP

## SSH Key

- Type: ed25519
- Private: `~/.ssh/id_ed25519`
- Public: `~/.ssh/id_ed25519.pub`
- Comment: `yeyito@local`

## SSH Config (`~/.ssh/config`)

```
# Local network
Host kitsune-local
    HostName 192.168.0.100
    User yeyito

# Over the internet
Host kitsune
    HostName kitsune.yeyito.dev
    User yeyito
    Port 48222
```

## Remote Machine Hardening

### sshd drop-in: `/etc/ssh/sshd_config.d/00-hardening.conf`
```
PasswordAuthentication no
PermitRootLogin no
AllowUsers yeyito
MaxAuthTries 3
PubkeyAuthentication yes
PermitEmptyPasswords no
```

- Original config backed up at `/etc/ssh/sshd_config.bak`
- Other drop-ins: `20-systemd-userdb.conf`, `99-archlinux.conf` (Arch defaults: KbdInteractiveAuthentication no, UsePAM yes)

### fail2ban: `/etc/fail2ban/jail.local`
```
[DEFAULT]
bantime = 1h
findtime = 10m
maxretry = 3

[sshd]
enabled = true
backend = systemd
```

- Enabled and running via systemd

## Port Forwarding (Router)

- External `48222` (TCP) → `192.168.0.100:22`

## Dynamic DNS (DNSimple)

- Domain: `yeyito.dev` (A record ID: 73086845, TTL: 300s)
- ISP assigns dynamic IP via DHCP — DDNS keeps the A record updated
- Script: `/home/yeyito/Workspace/DNSimple-config/update-dns.sh` on remote machine
- Systemd timer: `dnsimple-ddns.timer` runs every 5 minutes
- GitHub repo: `Yeyito777/DNSimple-config` (private)
- Env vars loaded from `/home/yeyito/Documents/Sensitive/keys.sh` on remote
- Zone had to be manually activated via API (`PUT /v2/{id}/zones/yeyito.dev/activation`)

## Updating this memory
If the DDNS setup changes (new record ID, different domain), update the Dynamic DNS section. If additional hardening is added (e.g. changing the SSH port on the server itself, adding more AllowUsers), update the sshd section. If the DNSimple-config repo moves or the script changes, update the paths.
</memory>
