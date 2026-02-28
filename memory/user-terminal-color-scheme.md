<memory-metadata>
{
  "frequency": 25,
  "last_accessed_session": 1156,
  "created_session": 0,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions terminal colors, color scheme, ANSI colors, st config, hex color values, or theming scripts.
</conditional>

<fuzzy-match>
ocean palette, st config.h, ANSI escape, hex colors, seafoam, abyss black, lagoon aqua
</fuzzy-match>

<memory>
The terminal uses a custom ocean-themed color scheme defined in the st config. Every color is named after something underwater or coastal, ranging from deep abyss black to foamy white. The palette, defaults, and hex values are all set in `/home/yeyito/Config/st/config.h` (lines 99-131).

## Palette

| Index | Name | Hex | Semantic |
|-------|------|-----|----------|
| 0 | black | `#00050f` | abyssal trench |
| 1 | red | `#ff6b6b` | coral reef |
| 2 | green | `#2ec4b6` | seafoam teal |
| 3 | yellow | `#ffd166` | sunlight sand |
| 4 | blue | `#005f87` | teal-blue |
| 5 | magenta | `#9d4edd` | purple kelp |
| 6 | cyan | `#00b4d8` | aqua splash |
| 7 | white | `#a8dadc` | pale aqua mist |
| 8 | bright black | `#1d3557` | slatey deep blue |
| 9 | bright red | `#ff8787` | soft coral |
| 10 | bright green | `#4ddbb7` | tropical teal |
| 11 | bright yellow | `#ffe066` | golden reflection |
| 12 | bright blue | `#5fa8d3` | shallow wave |
| 13 | bright magenta | `#c77dff` | lavender tide |
| 14 | bright cyan | `#48cae4` | lagoon aqua |
| 15 | bright white | `#f1faee` | foamy white |

## Default Colors

- Foreground (index 256): `#f1faee` — foamy white
- Background (index 257): `#00050f` — abyss black
- Cursor (index 258): `#48cae4` — lagoon aqua

## ANSI Escape Codes

When scripting or theming, these are the most commonly used escape sequences and what they map to:

```
\e[32m  → seafoam teal
\e[33m  → sunlight sand
\e[36m  → aqua splash
\e[96m  → lagoon aqua (bright cyan)
\e[0m   → reset
```

---
Update this memory when the information above becomes outdated.
</memory>
