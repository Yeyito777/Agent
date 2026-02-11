Claude Code binary inspection — ELF binary location (~/.local/share/claude/versions/), extracting minified JS via strings, safe search method (dump to /tmp first, never pipe directly), BASH_DEFAULT_TIMEOUT_MS/BASH_MAX_TIMEOUT_MS env vars, avoiding event loop crash from stdout flooding

# Binary Location
- Symlink: `~/.local/bin/claude`
- Actual binary: `~/.local/share/claude/versions/<version>` (e.g. `2.1.33`)
- Resolve with: `readlink -f $(which claude)`

# What It Is
An ELF executable — a Node.js app bundled into a single binary (likely via `pkg` or `bun compile`). The JavaScript source is **minified but not encrypted**, so it's fully readable via `strings`.

# How to Inspect

**WARNING: Never pipe `strings` on the binary directly in a Bash tool call.** The binary is 80-150+ MB of mostly printable content (minified JS). Piping `strings` through `grep` produces a massive stdout stream that starves Claude Code's single-threaded Node.js event loop — the Ink/React TUI freezes, CPU pegs one core (~11%), and the app crashes. Always dump to a temp file first and search that:

```bash
# SAFE: dump to file first, then search
strings "$(readlink -f "$(which claude)")" > /tmp/claude_strings.txt
grep "SEARCH_TERM" /tmp/claude_strings.txt

# SAFE: surrounding context
grep -oP '.{0,200}SEARCH_TERM.{0,200}' /tmp/claude_strings.txt
```

**Never do this** (will crash Claude Code):
```bash
# UNSAFE: massive pipe floods the event loop
strings "$(readlink -f "$(which claude)")" | grep "SEARCH_TERM"
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

---
Update this memory when the information above becomes outdated.
