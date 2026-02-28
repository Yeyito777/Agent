<memory-metadata>
{
  "frequency": 2,
  "last_accessed_session": 1144,
  "created_session": 762,
  "appreciation": 2,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions email hosting, self-hosting email, Stalwart Mail Server, mail server setup, yeyito.dev email configuration, VPS email setup, or comparison of email providers.
</conditional>

<fuzzy-match>
email, hosting, self-host, Stalwart, mail server, VPS, SMTP, IMAP, DNS, MX records, DKIM, SPF, DMARC, Migadu, MXroute, Fastmail, Proton Mail, Hetzner, OVH, Contabo, RackNerd, Snappymail, yeyito.dev, PTR records, rDNS
</fuzzy-match>

<memory>
Email self-hosting plan for yeyito.dev using Stalwart Mail Server on Hetzner VPS instead of managed providers

DECISION: Self-host with Stalwart Mail Server on VPS
Why not Kitsune: Cable Onda ISP blocks port 25, dynamic IP blacklisted, no PTR/rDNS control on residential
Why Stalwart over Mailcow: Single Rust binary (~100 MB RAM) vs Docker (4-6 GB), native systemd, built-in JMAP/CalDAV/CardDAV/WebDAV, DKIM/SPF/DMARC auto-generated, RocksDB zero-config storage, AGPLv3 EU-funded, security audited Sept 2025

MANAGED PROVIDERS EVALUATED (rejected):
- Migadu (Swiss indie): $19-990/yr, unlimited mailboxes. 20 users = $90-290/yr. Basic CalDAV/CardDAV (beta, not focus), dated webmail, IMAP/SMTP/REST API/SPF/DKIM/DMARC
- MXroute (Texas indie): $59-79/yr unlimited domains/mailboxes, Jarland Donnell (LLC), no calendar/contacts, US jurisdiction
- Fastmail (Australia): $5/user/mo or $1200/yr for 20 users. Best webmail, CalDAV/CardDAV, no E2EE, Five Eyes
- Proton Mail (Swiss): $7.99-12.99/user/mo or $1918-3118/yr for 20 users. E2EE but no native IMAP, expensive at scale
- Tuta (German): 6-8 EUR/user/mo or 1440-1920 EUR/yr for 20 users. NO IMAP/SMTP, total vendor lock-in (Thunderbird add-on available but not standard protocols)
- Purelymail (US): ~$10/yr, small team as of Feb 2026 (was one-person, hired 2 members), no CalDAV/CardDAV
- mailbox.org (German): 1-7.50 EUR/user/mo (personal), webmail buggy on Firefox/Safari
- DNSimple email forwarding: $2/mo/domain receive only

VPS REQUIREMENTS:
- 2 GB RAM, 1-2 vCPUs, 40-50 GB SSD
- Static IPv4 with clean reputation (verify mxtoolbox.com/blacklists)
- Port 25 open inbound/outbound
- rDNS/PTR configurable to mail.yeyito.dev

BEST VPS OPTIONS:
- Hetzner Cloud (EU) ~3.79 EUR/mo (CX22): popular for self-hosted email, request port 25 unblock via support ticket (after first paid invoice)
- OVH (EU) ~4-6 EUR/mo: port 25 open by default
- Contabo (EU/US) ~6 EUR/mo: usually open
- RackNerd (US) ~$3-5/mo: open by default

SETUP STEPS:
1. Provision Hetzner VPS, configure rDNS/PTR to mail.yeyito.dev
2. Harden SSH keys and firewall (same as Kitsune pattern)
3. Install Stalwart: single binary or AUR, systemd service
4. Configure via web admin setup wizard: hostname, ACME/Let's Encrypt TLS, RocksDB
5. Add yeyito.dev domain; Stalwart auto-generates DKIM keys and shows DNS records needed
6. Configure DNS in DNSimple: MX, A record, SPF, DKIM, DMARC records (scriptable via API)
7. Install Snappymail webmail (nginx + php-fpm) pointing to localhost IMAP/SMTP
8. Create mailboxes via web admin or Stalwart API
9. Test deliverability via mail-tester.com; verify SPF/DKIM/DMARC pass

ARCHITECTURE:
- VPS at mail.yeyito.dev runs Stalwart as single systemd binary
- Ports: SMTP 25 (receiving), 587 (submission), IMAPS 993 (client access), HTTPS 443 (admin), CalDAV/CardDAV
- Snappymail webmail via nginx+php-fpm
- DNS in DNSimple: MX, A, SPF, DKIM, DMARC
- PTR set in Hetzner control panel

COSTS & MAINTENANCE:
- Total cost: ~$45/year VPS (domain yeyito.dev already owned, expires 2027)
- Stalwart free AGPLv3, Snappymail free
- Unlimited users
- Maintenance: ~15 min/month, auto-renews TLS via ACME, updates replace binary and restart
- Monitor disk space occasionally

STALWART ADVANTAGES:
- Single Rust binary, incredibly lightweight
- Built-in JMAP, CalDAV, CardDAV, WebDAV (no external dependencies)
- Auto-generates and manages DKIM keys
- No webmail yet (planned 2026) but pair with Snappymail or Roundcube
- Security audited Sept 2025
- EU-funded (NLnet/NGI0 grants)
- AGPLv3 license

---
Update this memory if VPS provider, Stalwart features, or cost assumptions change. Add actual deployment notes after setup is complete.
</memory>
