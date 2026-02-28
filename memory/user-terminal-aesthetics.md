<memory-metadata>
{
  "frequency": 27,
  "last_accessed_session": 1017,
  "created_session": 0,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions ASCII art, banners, splash screens, CLI branding, terminal visuals, or making terminal output look nice.
</conditional>

<fuzzy-match>
ASCII art, block letters, splash screen, CLI banner, terminal branding, startup banner
</fuzzy-match>

<memory>
The user cares about how terminal output looks. When a script, CLI tool, or startup sequence prints to the terminal, it should have visual presence — not just be functional text.

The style leans bold, not minimal. Big ASCII art banners are preferred over small one-liners. Branding elements should take up space and feel intentional, like a title screen. Color comes from vertical gradients using the ocean palette (see `user-terminal-color-scheme.md` for the specific colors).

Every tool or script that has a name should have a visual identity — a banner, a header, something that gives it character.

## Reference: AGENT startup banner
This is the approved banner style. Six-line block letters with a vertical gradient from lagoon aqua through aqua splash to seafoam teal:
```
 █████╗  ██████╗ ███████╗███╗   ██╗████████╗
██╔══██╗██╔════╝ ██╔════╝████╗  ██║╚══██╔══╝
███████║██║  ███╗█████╗  ██╔██╗ ██║   ██║
██╔══██║██║   ██║██╔══╝  ██║╚██╗██║   ██║
██║  ██║╚██████╔╝███████╗██║ ╚████║   ██║
╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝
```

This applies whenever building script banners, splash screens, CLI branding, startup messages, or anything where the user asks to "make it look nice."
</memory>
