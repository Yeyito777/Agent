<memory-metadata>
{
  "frequency": 61,
  "last_accessed_session": 527,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<memory>
Git configuration — non-default gitconfig path at ~/.config/git/.gitconfig, GIT_CONFIG_GLOBAL env var, git-credentials location, aliases (s=status, sync=pull+push)

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

---
Update this memory when the information above becomes outdated.
</memory>
