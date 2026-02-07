Ocean-themed st terminal palette (hex values, ANSI escapes, color names)

# Location
Defined in: `/home/yeyito/Config/st/config.h` (lines 99-129)

# Palette
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

# Defaults
- Foreground (256): `#f1faee` (foamy white)
- Background (257): `#00050f` (abyss black)
- Cursor (258): `#48cae4` (lagoon aqua)

# ANSI escape usage
```
\e[32m  → seafoam teal
\e[33m  → sunlight sand
\e[36m  → aqua splash
\e[96m  → lagoon aqua (bright cyan)
\e[0m   → reset
```

**FOR AI AGENTS**: You've just read a memory file containing valuable, semi-static information about the following topic: User's terminal color scheme. If the information contained here becomes (or already is) outdated due to your actions, the user's actions, a third party's actions, or happenings of the world. You must use your write tool to update it.

Sections prone to be outdated: Palette table, Defaults
How to verify if any of the sections prone to be outdated is outdated: Run `grep -A 30 'colorname\[\]' /home/yeyito/Config/st/config.h` and compare against the table
