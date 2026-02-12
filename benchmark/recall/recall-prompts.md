# Recall Agent Prompt Log

## v1 (original)
```
Given the following user prompt, which memories are relevant? Output ONLY the filenames (one per line, e.g. memory/foo-bar.md). No explanations, no markdown, no numbering. If none are relevant, output nothing.
```

## v2 (2025-02-11)
```
Given the following user prompt, which memories should be recalled? Select memories the user is explicitly asking about or that contain context likely to meaningfully affect how the task should be handled. Prefer fewer, higher-value recalls over broad coverage — when a memory is only loosely related, omit it. Output ONLY the filenames (one per line, e.g. memory/foo-bar.md). No explanations, no markdown, no numbering. If none apply, output nothing.
```

## v3 (Wed Feb 11 12:29:48 PM EST 2026)
```
Given the following user prompt, which memories should be recalled? Select memories the user is explicitly asking about or that contain context likely to meaningfully affect how the task should be handled. Output ONLY the filenames (one per line, e.g. memory/foo-bar.md). No explanations, no markdown, no numbering. If none apply, output nothing.
```
Benchmark (20 tests): 45% perfect, 0% underrecall, 55% overrecall (21 extra memories). Main issue: agent-related memories recalled as a cluster (17/21 extras).

## v4 (Wed Feb 12 2026)
```
Which memories are relevant to this user prompt? Be selective — only recall memories whose specific content would be needed to handle the task well. When multiple memories cover similar topics, pick only the ones that directly apply rather than everything in the same area. Output ONLY the filenames (one per line, e.g. memory/foo-bar.md). No explanations, no markdown, no numbering. If none apply, output nothing.
```
