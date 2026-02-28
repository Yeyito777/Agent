<memory-metadata>
{
  "frequency": 8,
  "last_accessed_session": 896,
  "created_session": 428,
  "appreciation": 2,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions DNSimple, DNS records, DDNS, dynamic DNS, yeyito.dev, kitsune.yeyito.dev, or domain/zone management.
</conditional>

<fuzzy-match>
DNSimple, dnsimple, DDNS, dynamic DNS, yeyito.dev, kitsune.yeyito.dev, zone activation, DNS record, A record
</fuzzy-match>

<memory>
How to interact with the DNSimple API v2 for managing DNS records, zones, and DDNS on yeyito.dev.

## Authentication

The account token is preferred for all domain and zone operations. Both tokens and the account ID live in `/home/yeyito/Documents/Sensitive/keys.sh`.

- **Account token** (`DNSIMPLE_ACCOUNT_ACCESS_TOKEN`): scoped to account 171315
- **User token** (`DNSIMPLE_USER_ACCESS_TOKEN`): tied to user ID 172929 (alinerob31@gmail.com)
- **Account ID** (`DNSIMPLE_ACCOUNT_ID`): 171315

Account tokens have prefix `dnsimple_a_`, are scoped to one account, and are needed for `/v2/{account_id}/...` endpoints. User tokens have prefix `dnsimple_u_`, return `"account": null` from whoami, and can access all accounts the user owns.

## Loading tokens in the Bash tool

Do NOT use `source` in the Bash tool. Each invocation is a fresh shell, so sourced vars don't persist and expand to empty strings, causing silent auth failures. Instead, read `keys.sh` with the Read tool first, then inline the values directly:

```bash
curl -s -H "Authorization: Bearer dnsimple_a_79dwgsRO3lkWqcYBnaCPGZKerNa1TSi4" -H "Accept: application/json" "https://api.dnsimple.com/v2/171315/endpoint"
```

## Curl pitfalls

**Always include the Accept header.** Every call MUST have `-H "Accept: application/json"` or DNSimple returns a misleading 404 instead of actual data.

**Always write single-line curl commands.** The Bash tool does not reliably handle backslash line continuations. Never use the multiline `\` format:

```bash
## BROKEN — do not use
curl -s \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Accept: application/json" \
  "https://api.dnsimple.com/v2/..."

## CORRECT — everything on one line
curl -s -H "Authorization: Bearer ${TOKEN}" -H "Accept: application/json" "https://api.dnsimple.com/v2/171315/endpoint"
```

## Key endpoints

- List domains: `GET /v2/{account_id}/domains`
- List zones: `GET /v2/{account_id}/zones`
- List zone records: `GET /v2/{account_id}/zones/{domain}/records`
- Get single record: `GET /v2/{account_id}/zones/{domain}/records/{record_id}`
- Create record: `POST /v2/{account_id}/zones/{domain}/records`
- Update record: `PATCH /v2/{account_id}/zones/{domain}/records/{record_id}`
- Activate zone: `PUT /v2/{account_id}/zones/{domain}/activation`
- Check delegation: `GET /v2/{account_id}/registrar/domains/{domain}/delegation`

## Zone activation

Zones can be `active: false` even after domain registration. When inactive, DNSimple's nameservers refuse all queries, which shows up as "lame delegation" in DNS lookups. Always check zone status and activate if needed:

```bash
curl -s -X PUT -H "Authorization: Bearer ${TOKEN}" -H "Accept: application/json" "https://api.dnsimple.com/v2/171315/zones/yeyito.dev/activation"
```

## Domain: yeyito.dev

- ID: 1416817, Zone ID: 1361096
- State: registered, auto-renew on, private whois
- Expires: 2027-02-12
- Nameservers: ns1.dnsimple.com, ns2.dnsimple-edge.net, ns3.dnsimple.com, ns4.dnsimple-edge.org

### A records

- `@` (yeyito.dev): ID 73086845, TTL 300s — reserved for future website, NOT managed by DDNS
- `kitsune` (kitsune.yeyito.dev): ID 73089868, TTL 300s — SSH access to whale, managed by DDNS updater on whale

## DDNS multi-domain architecture

The DDNS setup lives in `~/Workspace/DNSimple-config` (GitHub: Yeyito777/DNSimple-config, private). Each domain gets its own config file and systemd service/timer pair. The naming convention uses a slug where dots become dashes:

- Config: `configs/<slug>.env` (e.g. `configs/kitsune-yeyito-dev.env`)
- Service: `dnsimple-ddns-<slug>.service`
- Timer: `dnsimple-ddns-<slug>.timer`

Key scripts:

- `setup.sh` — interactive, prompts for domain, creates A record + config + systemd units
- `update-dns.sh <config-file>` — updater, takes config file as argument
- `remove.sh <domain>` — tears down DDNS for a domain (timer, units, config). Does NOT delete the DNS record.

## Rate limiting

The API allows 30 requests per time window (visible in `x-ratelimit-*` headers). There is also a secondary IP-level rate limiter for failed auth attempts that is not reflected in those headers. Hitting "Too many requests" can take hours to clear, so be conservative with API calls and avoid rapid-fire debugging.

## Updating this memory
If new endpoints are used, add them. If rate limit behavior becomes clearer, update that section. If tokens are rotated, note the new env var names. If new domains are added, add their info.
</memory>
