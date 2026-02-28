<memory-metadata>
{
  "frequency": 20,
  "last_accessed_session": 834,
  "created_session": 0,
  "appreciation": 1,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions dmenu, dmenu scripts, adding a keybinding, clipmenu, or writing a new launcher script.
</conditional>

<fuzzy-match>
dmenu, clipmenu, dmenu_run, dmenu script, ~/.local/bin, dwm keybinding
</fuzzy-match>

<memory>
dmenu is a generic menu and picker tool used as the UI building block for various scripts. It is not an app launcher or clipboard manager on its own — it just reads lines from stdin, lets the user fuzzy-search through them, and prints the selected line to stdout. Everything else (what the list contains, what happens with the selection) is up to the calling script.

## The core pattern

Every dmenu-based script follows the same shape:

```
[generate a list] | dmenu [flags] | [act on the choice]
```

The caller decides what the list is, which flags to pass (e.g. `-l 8` for a vertical list, `-p "prompt:"` for a prompt string), and what to do with the picked result.

## Where things live

| What                          | Where                            |
|-------------------------------|----------------------------------|
| dmenu scripts                 | `~/.local/bin/`                  |
| dmenu C source / appearance   | `~/Config/dmenu/config.h`        |
| keybindings to invoke scripts | `~/Config/dwm/config.h`          |

## Existing keybindings

- `Alt+p` — `dmenu_run -c` (app launcher, centered)
- `Super+v` — `clipmenu -vi -c -t 80` (clipboard history, centered vertical list with `-l 8`, truncated at 80 chars)

## How to add a new dmenu script

1. Write a shell script in `~/.local/bin/` and make it executable.
2. Add a command array and keybinding in `~/Config/dwm/config.h`:
   ```c
   static const char *powercmd[] = { "powermenu", NULL };
   // ...
   { MODKEY,  XK_x,  spawn,  {.v = powercmd } },
   ```
3. Build dwm: `cd ~/Config/dwm && make && sudo make install`
4. Restart dwm.

## Global appearance (compiled into dmenu via config.h)

Centered mode is OFF by default — dmenu renders as a top bar unless `-c` is passed. When centered, the minimum width is 500px. The border is 1px with color #1d9bf0. Vi mode is enabled and starts in normal mode.

## Per-invocation flags

Each script can change dmenu's look and behavior by passing different flags:

- `-c` — center the menu on screen (otherwise it appears as a top bar)
- `-l N` — show a vertical list of N lines (otherwise it is a single horizontal bar)
- `-t N` — truncate displayed items to N characters with "..." (the full text is still output on stdout when selected)
- `-p "text"` — display a prompt string to the left of the input
- `-nb`, `-nf`, `-sb`, `-sf` — override colors for normal/selected background/foreground

---
Update this memory when new dmenu scripts are added or the workflow changes.
</memory>
