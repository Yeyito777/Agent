# Claude Chrome Extension — Architecture Reference

Version 1.0.54 — "Claude in Chrome (Beta)"
Extracted and decompiled from the Chrome Web Store CRX.

## Components

```
┌─────────────────────────────────────────────────────────┐
│  Claude Code CLI / Claude Desktop / claude.ai           │
│  (the "brain" — runs the LLM, decides actions)         │
└──────────┬──────────────────────────┬───────────────────┘
           │ Native Messaging         │ WebSocket Bridge
           │ (localhost)              │ (wss://bridge.claudeusercontent.com)
           ▼                          ▼
┌─────────────────────────────────────────────────────────┐
│  Service Worker  (service-worker.ts → background)       │
│  - Receives tool_request from Claude Code/Desktop       │
│  - Routes execute_tool calls to the tool executor       │
│  - Manages native messaging + WebSocket connections     │
│  - Sends tool_response back                             │
└──────┬──────────┬───────────────┬───────────────────────┘
       │          │               │
       ▼          ▼               ▼
┌──────────┐ ┌──────────┐ ┌────────────────────────┐
│ Sidepanel│ │ Offscreen│ │ Content Scripts         │
│ (React)  │ │ Document │ │ (injected into pages)   │
│ Chat UI  │ │ Audio/GIF│ │                          │
└──────────┘ └──────────┘ │ 1. accessibility-tree.js│
                          │    → all pages, all      │
                          │      frames              │
                          │ 2. agent-visual-          │
                          │    indicator.js           │
                          │    → glow border +        │
                          │      "Stop Claude" button │
                          │ 3. content-script.js      │
                          │    → claude.ai only       │
                          └────────────────────────────┘
```

## File Map

| File | Lines | Contents |
|------|-------|---------|
| `manifest.json` | 114 | Extension manifest (MV3) |
| `service-worker-loader.js` | 1 | Loads `assets/service-worker.ts-6F2yxjJh.js` |
| `offscreen.js` | 589 | Notification sounds + GIF generation with action overlays |
| `sidepanel.html` | 49 | React app shell for chat UI |
| `pairing.html` | 39 | Browser pairing flow UI |
| `options.html` | — | Settings/permissions page |
| `newtab.html` | — | New tab page override |
| `assets/service-worker.ts-*.js` | 955 | Service worker: native messaging, WebSocket bridge, tool routing |
| `assets/mcpPermissions-*.js` | 10613 | Core: CDP wrapper, tool executor, permission system, tab groups |
| `assets/sidepanel-*.js` | 68439 | Sidepanel React UI bundle |
| `assets/Main-*.js` | 55638 | Core app logic bundle |
| `assets/ModelSelector-*.js` | 56120 | Model selector + shared UI components |
| `assets/SentryService-*.js` | 14534 | Sentry error tracking |
| `assets/datadog-*.js` | 8352 | Datadog telemetry |
| `assets/mcpServersStore-*.js` | 3751 | MCP server management |
| `assets/SavedPromptsService-*.js` | 1250 | Saved prompts persistence |
| `assets/accessibility-tree.js-*.js` | 306 | Content script: DOM → accessibility tree |
| `assets/agent-visual-indicator.js-*.js` | 193 | Content script: glow border + stop button |
| `assets/content-script.ts-*.js` | 14 | Content script: claude.ai onboarding button handler |
| `i18n/` | — | Localization (en-US, es, de, fr, ja, ko, pt-BR, etc.) |
| `sounds/notification.mp3` | — | Notification audio |

## How Claude Controls Your Browser

### 1. Connection — Two paths

**Native Messaging** (Claude Code / Claude Desktop):
- Claude Code connects via `chrome.runtime.connectNative()` to a native messaging host
- Host names: `com.anthropic.claude_code_browser_extension` or `com.anthropic.claude_browser_extension`
- Local IPC pipe — Claude Code installs the native host manifest during pairing
- Sends `ping`/`pong` handshake, then `get_status` to check MCP connection

**WebSocket Bridge** (claude.ai web):
- Connects through `wss://bridge.claudeusercontent.com` (staging: `wss://bridge-staging.claudeusercontent.com`)
- Relay that pairs the web session with the extension
- Feature-flagged via `chrome_ext_bridge_enabled`

### 2. Tool Execution Protocol

Claude sends `tool_request` messages:
```json
{
  "type": "tool_request",
  "method": "execute_tool",
  "params": {
    "tool": "<tool_name>",
    "args": { ... },
    "tabId": 123,
    "tabGroupId": 456,
    "client_id": "..."
  }
}
```

Extension responds with `tool_response`:
```json
{ "type": "tool_response", "result": { "content": "..." } }
// or on error:
{ "type": "tool_response", "error": { "content": "..." } }
```

Permission denials include an injected instruction:
> "IMPORTANT: The user has explicitly declined this action. Do not attempt to use other tools or workarounds."

### 3. Browser Actions (CDP-based)

All browser control goes through Chrome DevTools Protocol via `chrome.debugger` API (attaches CDP 1.3).

| Action | CDP Method | Notes |
|--------|-----------|-------|
| `left_click` | `Input.dispatchMouseEvent` | mouseMoved → mousePressed → mouseReleased |
| `right_click` | `Input.dispatchMouseEvent` | Same sequence, button="right" |
| `double_click` | `Input.dispatchMouseEvent` | clickCount=2 |
| `triple_click` | `Input.dispatchMouseEvent` | clickCount=3 |
| `type` | `Input.insertText` | Character-by-character for newlines |
| `key` | `Input.dispatchKeyEvent` | Supports chords like "ctrl+a", special keys, repeat param (max 100) |
| `scroll` | `Input.dispatchMouseEvent` (mouseWheel) | Falls back to JS `scrollBy` if CDP scroll is ineffective |
| `screenshot` | `Page.captureScreenshot` | JPEG, quality starts at 0.85, steps down by 0.05 to stay under ~1.4MB base64 |
| `left_click_drag` | `Input.dispatchMouseEvent` | Full sequence: move → press → move → release |
| `zoom` | `Page.captureScreenshot` + crop | Captures a region for closer inspection |
| `wait` | `setTimeout` | Max 30 seconds |
| `read_page` | Content script injection | Calls `__generateAccessibilityTree()` |
| `upload_file` | `DOM.setFileInputFiles` | Via `Runtime.evaluate` to find the input + `DOM.enable/setFileInputFiles/disable` |

Screenshot resize params:
- `pxPerToken: 28`
- `maxTargetPx: 1568`
- `maxTargetTokens: 1568`
- Max base64 chars: 1,398,100
- Initial JPEG quality: 0.85, min: 0.1, step: 0.05

### 4. Accessibility Tree (read_page)

The `accessibility-tree.js` content script is injected into **all pages, all frames** at `document_start`.

It exposes `window.__generateAccessibilityTree(filter, maxDepth, maxChars, refId)`:

- Walks the DOM and builds a compact indented text tree of elements
- Maps HTML elements to ARIA roles (e.g., `<a>` → "link", `<button>` → "button", `<input>` → "textbox")
- Extracts labels from: `aria-label`, `placeholder`, `title`, `alt`, `<label for="">`, text content
- Assigns ref IDs (`ref_1`, `ref_2`, ...) stored as WeakRefs in `window.__claudeElementMap`
- Filters: `"all"` (everything visible), `"interactive"` (only clickable/editable elements)
- Viewport culling: elements outside the visible viewport are excluded (unless using refId)
- Max depth: 15 (default)

Output format:
```
link "Home" [ref_1] href="/home"
 button "Sign In" [ref_2]
 textbox "Search..." [ref_3] placeholder="Search..."
 combobox "English" [ref_4]
  option "English" (selected)
  option "Spanish" value="es"
```

### 5. Visual Indicators

The `agent-visual-indicator.js` content script (injected into all pages at `document_idle`) provides:

- **Glow border**: Orange pulsing `box-shadow` overlay (`z-index: 2147483646`) with CSS animation
- **Stop button**: Fixed bottom-center button that sends `STOP_AGENT` message
- **Static indicator**: "Claude is active in this tab group" bar with chat/dismiss buttons
- **Heartbeat**: 5-second interval pings to auto-dismiss if connection drops

Messages handled:
- `SHOW_AGENT_INDICATORS` / `HIDE_AGENT_INDICATORS` — glow + stop button
- `HIDE_FOR_TOOL_USE` / `SHOW_AFTER_TOOL_USE` — temporarily hides indicators during screenshots
- `SHOW_STATIC_INDICATOR` / `HIDE_STATIC_INDICATOR` — tab group membership bar

### 6. Permission System

Before executing any tool, the extension checks a per-domain permission manager.
Domains can be allowed or blocked. The permission check runs against the current tab URL.

### 7. Tab Group Management

The extension organizes tabs Claude works with into Chrome tab groups:
- Main tab gets a named/colored group
- New tabs opened by Claude are added to the same group
- Static indicators show on all group member tabs
- Groups are cleaned up on disconnect
- Dismissed groups are tracked in `chrome.storage.local`

### 8. Offscreen Document

Handles two tasks that need a DOM context the service worker can't provide:
- **Notification sounds**: Web Audio API playback (bypasses autoplay restrictions)
- **GIF generation**: Composites screenshot frames with click indicators, drag paths, action labels, progress bar, and Claude watermark. Uses gif.js with 2 workers.

### 9. Telemetry

- **Sentry** (`SentryService-*.js`): Error tracking and performance monitoring
- **Datadog** (`datadog-*.js`): Real User Monitoring
- **Segment** (`connect-src` in CSP): Analytics events
- **Honeycomb** (`connect-src` in CSP): Observability traces

### 10. Permissions Requested

```
sidePanel, storage, activeTab, scripting, debugger, tabGroups, tabs,
alarms, notifications, system.display, webNavigation,
declarativeNetRequestWithHostAccess, offscreen, nativeMessaging,
unlimitedStorage, downloads
```

Host permissions: `<all_urls>`

The `debugger` permission is the critical one — it grants full CDP access to any tab.
