<memory-metadata>
{
  "frequency": 12,
  "last_accessed_session": 896,
  "created_session": 406,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions SSH, remote access, kitsune, port forwarding, DDNS, fail2ban, or sshd hardening.
</conditional>

<fuzzy-match>
ssh, kitsune, sshd, fail2ban, port forwarding, ddns, dnsimple, 48222, ed25519
</fuzzy-match>

<memory>
This covers the full SSH remote access setup for connecting to the remote machine "kitsune" — both on the local network and over the internet. It includes key-based authentication, sshd hardening, fail2ban, port forwarding through the router, and a DDNS system that keeps a public hostname pointed at a dynamic IP.

## The machines involved

- **Local (this machine):** yeyito's daily driver, where SSH connections originate.
- **Remote (kitsune):** reachable at `192.168.0.100` on the LAN. Runs Arch Linux with systemd.
- **Router:** Arris, through Cable Onda ISP. The public IP is dynamic (assigned via DHCP), which is why DDNS is needed.

## SSH key

A single ed25519 keypair is used for authentication (password auth is disabled on the remote):

- Private key: `~/.ssh/id_ed25519`
- Public key: `~/.ssh/id_ed25519.pub`
- Comment: `yeyito@local`

## SSH config (`~/.ssh/config`)

Two host aliases are configured — one for LAN access and one for internet access. The internet alias uses the DDNS hostname and the non-standard port that the router forwards:

```
## Local network
Host kitsune-local
    HostName 192.168.0.100
    User yeyito

## Over the internet
Host kitsune
    HostName kitsune.yeyito.dev
    User yeyito
    Port 48222
```

## Remote machine hardening

The remote machine is locked down in two layers: sshd configuration and fail2ban.

### sshd drop-in: `/etc/ssh/sshd_config.d/00-hardening.conf`

This disables password auth entirely and restricts access to a single user:

```
PasswordAuthentication no
PermitRootLogin no
AllowUsers yeyito
MaxAuthTries 3
PubkeyAuthentication yes
PermitEmptyPasswords no
```

- The original config is backed up at `/etc/ssh/sshd_config.bak`.
- Other drop-ins exist: `20-systemd-userdb.conf` and `99-archlinux.conf` (Arch defaults that set `KbdInteractiveAuthentication no` and `UsePAM yes`).

### fail2ban: `/etc/fail2ban/jail.local`

Bans IPs that fail authentication repeatedly, adding a second line of defense on top of key-only auth:

```
[DEFAULT]
bantime = 1h
findtime = 10m
maxretry = 3

[sshd]
enabled = true
backend = systemd
```

fail2ban is enabled and running via systemd.

## Port forwarding (router)

The router forwards external port `48222` (TCP) to `192.168.0.100:22`. This is the non-standard port used by the `kitsune` SSH alias to reach sshd on the remote machine from the internet.

## Dynamic DNS (DNSimple)

Because the ISP assigns a dynamic public IP via DHCP, a DDNS system keeps the `kitsune.yeyito.dev` A record updated so the hostname always resolves to the current IP.

- **Domain:** `yeyito.dev` (A record ID: `73086845`, TTL: 300s)
- **Update script:** `/home/yeyito/Workspace/DNSimple-config/update-dns.sh` on the remote machine
- **Systemd timer:** `dnsimple-ddns.timer` runs every 5 minutes to check and update the record
- **Source repo:** `Yeyito777/DNSimple-config` (private GitHub repo)
- **Credentials:** env vars loaded from `/home/yeyito/Documents/Sensitive/keys.sh` on the remote
- **Note:** the zone had to be manually activated via the API (`PUT /v2/{id}/zones/yeyito.dev/activation`)

## Updating this memory
If the DDNS setup changes (new record ID, different domain), update the Dynamic DNS section. If additional hardening is added (e.g. changing the SSH port on the server itself, adding more AllowUsers), update the sshd section. If the DNSimple-config repo moves or the script changes, update the paths.
</memory>
