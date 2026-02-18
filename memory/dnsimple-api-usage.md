<memory-metadata>
{
  "frequency": 1,
  "last_accessed_session": 440,
  "created_session": 428,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<memory>
DNSimple API v2 usage — authentication, account token, user token, DNS records, domains, yeyito.dev, dynamic DNS, Accept header required, rate limiting, env vars, zone activation, curl pitfalls

## Authentication

- **Account token** (preferred): `DNSIMPLE_ACCOUNT_ACCESS_TOKEN` — scoped to account 171315
- **User token**: `DNSIMPLE_USER_ACCESS_TOKEN` — tied to user ID 172929 (alinerob31@gmail.com)
- Account ID: `DNSIMPLE_ACCOUNT_ID` = 171315
- All tokens and IDs stored in `/home/yeyito/Documents/Sensitive/keys.sh`

## Loading env vars

Tokens and IDs are in `/home/yeyito/Documents/Sensitive/keys.sh`. **Do NOT use `source` in the Bash tool** — each invocation is a fresh shell so sourced vars don't persist, and they don't survive into pipes within the same command either (vars expand to empty strings, causing silent auth failures and wrong paths).

**Instead, just use the values directly in commands:**
```bash
curl -s -H "Authorization: Bearer dnsimple_a_79dwgsRO3lkWqcYBnaCPGZKerNa1TSi4" -H "Accept: application/json" "https://api.dnsimple.com/v2/171315/endpoint"
```
If you need to look up a token, read keys.sh with the Read tool first, then use the value directly.

## Critical: Accept header required

Every API call MUST include `-H "Accept: application/json"` or DNSimple returns a misleading 404 "Not Found" instead of actual data.

## Critical: Use single-line curl commands

The Bash tool does NOT reliably handle `\` backslash line continuations in curl commands. Always write curl calls as a single line. Do NOT use the multiline format from the example below.

**BROKEN (do not use):**
```bash
curl -s \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Accept: application/json" \
  "https://api.dnsimple.com/v2/..."
```

**CORRECT:**
```bash
curl -s -H "Authorization: Bearer ${TOKEN}" -H "Accept: application/json" "https://api.dnsimple.com/v2/171315/endpoint"
```

## Key endpoints

- List domains: `GET /v2/{account_id}/domains`
- List zones: `GET /v2/{account_id}/zones`
- List zone records: `GET /v2/{account_id}/zones/{domain}/records`
- Get single record: `GET /v2/{account_id}/zones/{domain}/records/{record_id}`
- Create record: `POST /v2/{account_id}/zones/{domain}/records`
- Update record: `PATCH /v2/{account_id}/zones/{domain}/records/{record_id}`
- **Activate zone**: `PUT /v2/{account_id}/zones/{domain}/activation`
- Check delegation: `GET /v2/{account_id}/registrar/domains/{domain}/delegation`

## Zone activation

Zones can be `active: false` even after domain registration. When a zone is inactive, DNSimple's nameservers REFUSE all queries (appears as "lame delegation" in DNS lookups). Always check zone status and activate if needed:
```bash
curl -s -X PUT -H "Authorization: Bearer ${TOKEN}" -H "Accept: application/json" "https://api.dnsimple.com/v2/171315/zones/yeyito.dev/activation"
```

## Domain info

- Domain: `yeyito.dev` (ID: 1416817, Zone ID: 1361096)
- State: registered, auto-renew on, private whois
- Expires: 2027-02-12
- Nameservers: ns1.dnsimple.com, ns2.dnsimple-edge.net, ns3.dnsimple.com, ns4.dnsimple-edge.org

### A records
- `@` (yeyito.dev): ID 73086845, TTL 300s — reserved for future website, NOT managed by DDNS
- `kitsune` (kitsune.yeyito.dev): ID 73089868, TTL 300s — SSH access to whale, managed by DDNS updater on whale

## DDNS multi-domain architecture

Repo: `~/Workspace/DNSimple-config` (GitHub: Yeyito777/DNSimple-config, private)

Each domain gets its own config + systemd service/timer. Naming convention — slug = domain with dots replaced by dashes:
- Config: `configs/<slug>.env` (e.g. `configs/kitsune-yeyito-dev.env`)
- Service: `dnsimple-ddns-<slug>.service`
- Timer: `dnsimple-ddns-<slug>.timer`

Key scripts:
- `setup.sh` — interactive, prompts for domain, creates A record + config + systemd units
- `update-dns.sh <config-file>` — updater, takes config file as argument
- `remove.sh <domain>` — tears down DDNS for a domain (timer, units, config). Does NOT delete DNS record.

## Rate limiting

- 30 requests per time window (shown in `x-ratelimit-*` headers)
- There is ALSO a secondary IP-level rate limiter for failed auth attempts that is NOT reflected in those headers
- If you hit "Too many requests", it can take a LONG time to clear (potentially hours)
- Be conservative with API calls — avoid rapid-fire debugging

## Token types

- User tokens: prefix `dnsimple_u_`, whoami returns `"account": null`, can access all accounts the user owns
- Account tokens: prefix `dnsimple_a_`, scoped to one account, needed for `/v2/{account_id}/...` endpoints
- Use account token for all domain/zone operations

## Updating this memory
If new endpoints are used, add them. If rate limit behavior becomes clearer, update that section. If tokens are rotated, note the new env var names. If new domains are added, add their info.
</memory>
