Inspecting Claude Code's bundled binary for source code and config validation (strings, ELF, minified JS)

# Binary Location
- Symlink: `~/.local/bin/claude`
- Actual binary: `~/.local/share/claude/versions/<version>` (e.g. `2.1.33`)
- Resolve with: `readlink -f $(which claude)`

# What It Is
An ELF executable — a Node.js app bundled into a single binary (likely via `pkg` or `bun compile`). The JavaScript source is **minified but not encrypted**, so it's fully readable via `strings`.

# How to Inspect
```bash
# Extract all readable strings
strings "$(readlink -f "$(which claude)")" | grep "SEARCH_TERM"

# Get surrounding context (200 chars each side)
strings "$(readlink -f "$(which claude)")" | grep -oP '.{0,200}SEARCH_TERM.{0,200}'
```

The minified JS uses short variable names (`H`, `$`, `A`, `L`) but function logic, string literals, env var names, and constants are all plaintext and readable.

# Example: Bash Timeout Env Vars
Found by searching for `BASH_MAX_TIMEOUT_MS`:

```js
// BASH_DEFAULT_TIMEOUT_MS — deobfuscated
function getDefaultTimeout(env) {
  let val = env.BASH_DEFAULT_TIMEOUT_MS;
  if (val) {
    let parsed = parseInt(val, 10);
    if (!isNaN(parsed) && parsed > 0) return parsed;
  }
  return 120000;
}

// BASH_MAX_TIMEOUT_MS — deobfuscated
function getMaxTimeout(env) {
  let val = env.BASH_MAX_TIMEOUT_MS;
  if (val) {
    let parsed = parseInt(val, 10);
    if (!isNaN(parsed) && parsed > 0)
      return Math.max(parsed, getDefaultTimeout(env));
  }
  return Math.max(600000, getDefaultTimeout(env));
}
```

Key findings:
- Neither env var has an upper bound enforced in code
- `600000` (10 min) is only the fallback max when env var is unset, not a cap
- Max is floored to never be lower than default, that's the only constraint
- Values like `3600000` (1h) would work fine

**FOR AI AGENTS**: You've just read a memory file containing valuable, semi-static information about the following topic: Inspecting the Claude Code binary for source code, config validation, and env var behavior. If the information contained here becomes (or already is) outdated due to your actions, the user's actions, a third party's actions, or happenings of the world. You must use your write tool to update it.

Sections prone to be outdated: Binary Location (version path), Example timeout logic (could change in future releases)
How to verify if any of the sections prone to be outdated is outdated: Run `readlink -f $(which claude)` for path; re-run the strings grep for timeout logic and compare
