<memory-metadata>
{
  "frequency": 40,
  "last_accessed_session": 1146,
  "created_session": 0,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions inspecting the Claude Code binary, ELF binary, bun compile, strings command on the binary, BASH_DEFAULT_TIMEOUT_MS, BASH_MAX_TIMEOUT_MS, or event loop crash from stdout flooding.
</conditional>

<fuzzy-match>
claude binary, ELF, bun compile, strings, /tmp/claude_strings.txt, BASH_DEFAULT_TIMEOUT_MS, BASH_MAX_TIMEOUT_MS, timeout env var, minified JS, node event loop, stdout flood, readlink, ~/.local/share/claude, claude versions
</fuzzy-match>

<memory>
The Claude Code CLI is an ELF binary — a Node.js app bundled via `bun compile` (confirmed by `__bun` symbols). The JS source inside is minified but not encrypted, so you can extract and read it with `strings`. This is useful for discovering undocumented env vars, understanding internal behavior, and verifying how features actually work.

## Where the binary lives

- Symlink: `~/.local/bin/claude`
- Actual binary: `~/.local/share/claude/versions/<version>` (e.g. `2.1.33`)
- Resolve the real path with: `readlink -f $(which claude)`

## How to safely inspect it

The binary is ~200+ MB of mostly printable content (minified JS). You must dump `strings` output to a temp file first, then search the file. Never pipe `strings` directly through `grep` in a Bash tool call — the massive stdout stream starves Claude Code's single-threaded Node.js event loop, the Ink/React TUI freezes, CPU pegs one core (~11%), and the app crashes.

```bash
## SAFE: dump to file first, then search
strings "$(readlink -f "$(which claude)")" > /tmp/claude_strings.txt
grep "SEARCH_TERM" /tmp/claude_strings.txt

## SAFE: get surrounding context for a match
grep -oP '.{0,200}SEARCH_TERM.{0,200}' /tmp/claude_strings.txt
```

```bash
## UNSAFE — will crash Claude Code:
strings "$(readlink -f "$(which claude)")" | grep "SEARCH_TERM"
```

The minified JS uses short variable names (`H`, `$`, `A`, `L`) but function logic, string literals, env var names, and constants are all plaintext and readable.

## Example discovery: Bash timeout env vars

By searching for `BASH_MAX_TIMEOUT_MS` in the dumped strings, the following deobfuscated logic was recovered:

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

Key findings from this:
- Neither env var has an upper bound enforced in code — you can set them arbitrarily high.
- `600000` (10 min) is only the fallback max when the env var is unset, not a hard cap.
- The max is floored to never be lower than the default; that's the only constraint.
- Values like `3600000` (1 hour) work fine.

---
Update this memory when the information above becomes outdated.
</memory>
