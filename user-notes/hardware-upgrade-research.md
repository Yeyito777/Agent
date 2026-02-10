# Hardware Upgrade Research

## Current Build
- **Motherboard:** ASUS ROG STRIX B550-F GAMING WIFI II (AM4 socket)
- **CPU:** AMD Ryzen 5 3600XT (6-core/12-thread, Zen 2, 4.5 GHz boost)
- **RAM:** DDR4 (B550 only supports DDR4)

## Upgrade Target: AMD Ryzen 9 5950X
- **Price:** ~$310-360 (as of Feb 2026)
- **Drop-in compatible** with B550 board (BIOS update required)
- No new motherboard or RAM needed

## Ryzen 5 3600XT vs Ryzen 9 5950X — Specs

|                  | 3600XT (current)   | 5950X (upgrade)    | Difference      |
|------------------|--------------------|--------------------|-----------------|
| Architecture     | Zen 2 (Matisse)    | Zen 3 (Vermeer)    | +19% IPC        |
| Cores / Threads  | 6 / 12             | 16 / 32            | 2.67x cores     |
| Base Clock       | 3.8 GHz            | 3.4 GHz            | -10%            |
| Boost Clock      | 4.5 GHz            | 4.9 GHz            | +9%             |
| L3 Cache         | 32 MB              | 64 MB              | 2x              |
| Total Cache      | 35 MB              | 72 MB              | 2x              |
| TDP              | 95W                | 105W               | +10W            |
| PCIe             | 4.0                | 4.0                | Same            |

## Benchmarks

| Benchmark              | 3600XT  | 5950X   | Gain    |
|------------------------|---------|---------|---------|
| Geekbench 6 Single     | 1,728   | 2,208   | +28%    |
| Geekbench 6 Multi      | 7,256   | 12,016  | +66%    |
| Passmark Overall        | 18,546  | 45,329  | +144%   |
| Passmark Single         | 2,751   | 3,475   | +26%    |
| Cinebench R23 Single   | ~1,260  | ~1,570  | ~25%    |
| Cinebench R23 Multi    | ~8,600  | ~27,000 | ~214%   |

## Where the Gains Are

### Single-threaded (+25-28%)
Zen 3 IPC uplift: better branch prediction, unified 8-core CCX (vs 2x 4-core in Zen 2 reducing inter-core latency), and larger L3 per core.
- Gaming (higher minimum FPS, less stuttering)
- Application responsiveness
- Single-threaded compile jobs
- Browser/desktop snappiness

### Multi-threaded (+66-214%)
2.67x core count plus IPC gains compound massively:
- `make -j16` instead of `make -j6` — compilation times roughly 2.5-3x faster
- Video encoding (x264/x265) — nearly 3x throughput
- Blender rendering — ~2.5x faster
- VMs / containers — run significantly more concurrent workloads
- Compression (7zip, zstd) — ~2.5x faster

### Cache
Doubling L3 from 32MB to 64MB means fewer cache misses — helps gaming, database workloads, and compilation.

## DDR5 / DDR6 Notes
- B550 is DDR4 only — switching to DDR5 requires a full platform change (new mobo + CPU)
- DDR5 is ~4% faster avg FPS in gaming at 1080p, up to 35% better 1% lows in some titles
- DDR5 costs 50-60% more than DDR4 (as of Feb 2026)
- DDR6 specs finalizing late 2025, consumer availability expected 2027-2028

## Threadripper Comparison (not compatible with B550)

| CPU                        | Cores/Threads | Socket | Price    |
|----------------------------|---------------|--------|----------|
| Ryzen 9 5950X              | 16/32         | AM4    | ~$310-360|
| Threadripper 7960X         | 24/48         | sTR5   | $1,499   |
| Threadripper 7970X         | 32/64         | sTR5   | $2,499   |
| Threadripper 7980X         | 64/128        | sTR5   | $4,999   |
| Threadripper Pro 7985WX    | 64/128        | sWRX8  | $7,350   |
| Threadripper Pro 7995WX    | 96/192        | sWRX8  | $10,000  |

Threadripper requires a completely different motherboard (TRX50/WRX80) and DDR5. Minimum platform cost ~$2,500+ vs ~$350 for the 5950X drop-in.

## Dream Build: Threadripper 7000

### TRX50 Motherboards

| Board                          | Price  |
|--------------------------------|--------|
| Gigabyte TRX50 AERO D         | ~$600  |
| ASRock TRX50 WS               | ~$800  |
| ASUS Pro WS TRX50-SAGE WIFI   | ~$900  |

All E-ATX workstation boards with DDR5, PCIe 5.0, Wi-Fi 7, and 10GbE networking. $600 is the floor — no budget options exist.

### Cheapest Threadripper 7000 Build

| Component                      | Cost         |
|--------------------------------|--------------|
| Threadripper 7960X (24-core)   | $1,499       |
| Gigabyte TRX50 AERO D         | ~$600        |
| DDR5 RAM (64GB kit)            | ~$150-200    |
| **Total (CPU + mobo + RAM)**   | **~$2,250-2,300** |

That's ~6.5x the cost of the 5950X drop-in upgrade ($350).

## Conclusion
The 5950X is the best value upgrade for this build: ~$310-360 for +25% single-core and 2.5-3x multi-core, with zero other hardware changes.
