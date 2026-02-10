# Helm

A CLI harness that lets Agent drive live qutebrowser instances through the terminal.

## Core idea
The same way coreutils give Agent the filesystem (`ls`, `cat`, `grep`), Helm gives Agent the browser (`helm tabs`, `helm dom`, `helm click`). Built on top of qutebrowser's IPC socket and Python internals — possible because the user builds qutebrowser from source.

## Capability layers

### Read (passive, no side effects)
- `helm tabs` — list open tabs (url + title + index)
- `helm dom [selector]` — get DOM / outerHTML of current tab or a specific element
- `helm attrs <selector>` — element attributes, text, computed styles
- `helm screenshot [selector]` — screenshot tab or element (Agent can read images)
- `helm meta` — page metadata (title, url, scroll position)

### Act (mutations, reversible)
- `helm click <selector>` — click an element
- `helm rclick <selector>` — right-click an element
- `helm type <selector> <text>` — type into an input
- `helm scroll <selector>` — scroll to element
- `helm tab <index>` — switch active tab
- `helm js <code>` — run arbitrary JS on the page

### Navigate (creates new state)
- `helm open <url> [--new-tab]` — open a URL
- `helm close [index]` — close a tab
- `helm back` / `helm forward` — history navigation

## Architecture
A single Python CLI tool that talks to qutebrowser's IPC socket, sends commands, and returns structured output to stdout. Agent calls it via Bash like any other command.

```
Agent (claude code) --bash--> helm (python cli) --ipc--> qutebrowser
                  <-stdout--                  <-ipc---
```

## Permission model
Read commands are free. Act/Navigate commands could be gated behind confirmation (same pattern Agent already uses for destructive shell commands), but since the user is giving full control this is optional.

## Name rationale
"Helm" — the station from which you steer a ship. Short (4 chars), verb-able, implies both observation and control. Fits the user's ocean-themed terminal aesthetic.
