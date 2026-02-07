User's git config location (gitconfig, GIT_CONFIG_GLOBAL, credentials)

# Location
Git config is NOT at the default `~/.gitconfig`. It's at:
```
~/.config/git/.gitconfig
```

Set via environment variable:
```bash
export GIT_CONFIG_GLOBAL="$HOME/.config/git/.gitconfig"
```

# Credentials
Stored at: `~/.config/git/.git-credentials`

# Current Aliases
| Alias | Command |
|-------|---------|
| `s` | `status` |
| `sync` | `!git pull --rebase && git push` |

**FOR AI AGENTS**: You've just read a memory file containing valuable, semi-static information about the following topic: User's git configuration file location. If the information contained here becomes (or already is) outdated due to your actions, the user's actions, a third party's actions, or happenings of the world. You must use your write tool to update it.

Sections prone to be outdated: Current Aliases table
How to verify if any of the sections prone to be outdated is outdated: Run `git config --global --list` and compare aliases
