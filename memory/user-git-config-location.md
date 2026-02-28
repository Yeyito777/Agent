<memory-metadata>
{
  "frequency": 71,
  "last_accessed_session": 0,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions git config, gitconfig, git credentials, git aliases, or GIT_CONFIG_GLOBAL.
</conditional>

<fuzzy-match>
gitconfig, .gitconfig, GIT_CONFIG_GLOBAL, git-credentials, git alias
</fuzzy-match>

<memory>
The user's git configuration lives in a non-default location: `~/.config/git/.gitconfig` instead of the usual `~/.gitconfig`. This is wired up through the `GIT_CONFIG_GLOBAL` environment variable.

## Config location

The gitconfig path is set via an exported env var:
```bash
export GIT_CONFIG_GLOBAL="$HOME/.config/git/.gitconfig"
```

## Credentials

Git credentials are stored alongside the config at `~/.config/git/.git-credentials`.

## Aliases

| Alias | Command |
|-------|---------|
| `s` | `status` |
| `sync` | `!git pull --rebase && git push` |

---
Update this memory when the information above becomes outdated.
</memory>
