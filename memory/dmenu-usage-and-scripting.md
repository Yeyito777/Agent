dmenu scripting and usage guide — stdin|dmenu|action pattern, writing new dmenu scripts in ~/.local/bin/, dwm keybindings, flags (-c center, -l lines, -p prompt, -t truncate), appearance config, clipmenu integration, adding dmenu commands to dwm config.h

# What dmenu is
dmenu is a generic menu/picker. It reads a list of lines on stdin, lets the user fuzzy-search, and outputs the selected line on stdout. It is not an app launcher or clipboard manager by itself — it's a building block other scripts use as their UI.

# The pattern
```
[something generates a list] | dmenu | [something acts on the choice]
```

The caller decides what the list is, what flags to pass (e.g. `-l 8` for vertical list, `-p "prompt:"` for a prompt string), and what to do with the output.

# Where things live

| What                          | Where                            |
|-------------------------------|----------------------------------|
| dmenu scripts                 | `~/.local/bin/`                  |
| dmenu C source / appearance   | `~/Config/dmenu/config.h`        |
| keybindings to invoke scripts | `~/Config/dwm/config.h`          |

# Existing bindings
- `Alt+p` — `dmenu_run -c` (app launcher, centered)
- `Super+v` — `clipmenu -vi -c -t 80` (clipboard history, centered vertical list with `-l 8`, truncated at 80 chars)

# Adding a new dmenu script
1. Write a shell script in `~/.local/bin/` (make it executable)
2. Add a command array and keybinding in `~/Config/dwm/config.h`:
   ```c
   static const char *powercmd[] = { "powermenu", NULL };
   // ...
   { MODKEY,  XK_x,  spawn,  {.v = powercmd } },
   ```
3. Build dwm: `cd ~/Config/dwm && make && sudo make install`
4. Restart dwm

# Global appearance (baked into dmenu config.h)
- Centered mode is OFF by default — appears as top bar unless `-c` is passed
- Minimum width (when centered): 500px
- Border: 1px, #1d9bf0
- Vi mode enabled, starts in normal mode

# UI differences between scripts
Callers pass flags to change dmenu's layout per invocation:
- `-c` — centered on screen (without it, dmenu is a top bar)
- `-l N` — vertical list with N lines (without it, dmenu is a horizontal bar)
- `-t N` — truncate displayed items to N characters with "..." (full text still output on stdout)
- `-p "text"` — display a prompt string
- `-nb`, `-nf`, `-sb`, `-sf` — colors for normal/selected background/foreground

---
Update this memory when new dmenu scripts are added or the workflow changes.
