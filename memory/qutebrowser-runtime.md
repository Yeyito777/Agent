<memory-metadata>
{
  "frequency": 119,
  "last_accessed_session": 1189,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions qutebrowser, --basedir, browser containerization, greasemonkey, userscripts, the whale theme, tab runtime, console.sh, snapshot-dom, dom snapshot, network.sh, network inspection, command.sh, command-eval, extensions, qutebrowser profiles, the mnemo profile, click.sh, wait.sh, or open-tab.sh.
</conditional>

<fuzzy-match>
qutebrowser, --basedir, basedir, greasemonkey, whale theme, cssoverrides, IPC socket, qb, tab runtime, console.sh, snapshot-dom, dom snapshot, network.sh, network inspection, tab tooling, command.sh, command-eval, extensions, chrome extension, crx, qutebrowser profile, mnemo profile, screenshot.sh, click.sh, wait.sh, open-tab.sh, click element, wait for load, open tab
</fuzzy-match>

<memory>
Qutebrowser runs fully containerized via --basedir so all runtime state lives in one directory instead of scattering across XDG defaults.

## Profiles

Two profiles exist at `~/.runtime/`:

| Profile | Path | Purpose |
|---|---|---|
| **yeyito** | `~/.runtime/qutebrowser-yeyito/` | Main personal browser (default — use this unless told otherwise) |
| **mnemo** | `~/.runtime/qutebrowser-mnemo/` | Agent/AI profile — lighter config, no extensions |

Launch:
```bash
qutebrowser --basedir ~/.runtime/qutebrowser-yeyito
qutebrowser --basedir ~/.runtime/qutebrowser-mnemo
```

Both profiles share the same git repo (origin: `https://github.com/Yeyito777/qutebrowser-configs.git`, branch `main`). Both `config/` dirs are git-tracked at the same commit.

### Config differences (mnemo vs yeyito)

- No `<Ctrl-E>` / `<Ctrl-Y>` scroll bindings (yeyito has them for fine 140px scrolling)
- No `disable-features=UseCameraPipeWire` Qt arg
- `yank-dom` bound to `<Ctrl-Y>` (yeyito uses `<Ctrl-Shift-Y>`)
- No Chrome extensions (yeyito has `json-formatter`; loads via `config.load_extensions("extensions/")`)
- No `chrome-webstore-download.user.js` greasemonkey script
- Has `runtime/tabs/` directory with per-tab tooling (same as yeyito)

### Shared config across both profiles

- whale theme, same search engines (google/ddg/yt/gh/aw/ai/gpt/gptt/gem)
- Same vim-style scroll bindings (j/k/Ctrl-U/D/B/F at 280/560/1120px)
- Same tab settings (left position, 175px width, auto-save session)
- Same cookie policy (no-3rdparty, whitelisted recaptcha/hcaptcha/google accounts)
- Same CSS override (`cssoverrides/default.css`), permissions.py sourcing, element shader
- Same greasemonkey scripts (minus chrome-webstore-download on mnemo): chatgpt-auto-send, claude-auto-send, copy-button-visibility, discord-squarify, gemini-auto-send, youtube-resume, youtube-seek-hl

## Container directory structure

```
~/.runtime/qutebrowser-{profile}/
├── config/          # config.py, autoconfig.yml, quickmarks, bookmarks, greasemonkey, userscripts, whale theme, extensions
│   ├── whale/       # Deep Ocean Blue color theme (custom module)
│   ├── extensions/  # Chrome extensions (unpacked dirs with manifest.json) — yeyito only
│   ├── greasemonkey/
│   ├── userscripts/
│   ├── cssoverrides/
│   ├── js/
│   ├── bookmarks/
│   ├── qsettings/
│   └── permissions.py  # Auto-generated site permissions
├── data/            # history.sqlite, sessions, state, cmd-history
│   └── webengine/   # Cookies, Local Storage, IndexedDB, Service Workers — ALL Chromium state
├── cache/           # HTTP cache, GPU cache, shader cache (expendable, regenerates)
│   └── webengine/
├── download/        # default download target
└── runtime/         # IPC socket, per-tab tooling
    ├── ipc-<hash>   # IPC socket (MD5 of basedir)
    ├── runtime-log.log    # qutebrowser debug log
    ├── startup-timing.log # startup performance breakdown
    └── tabs/         # per-tab runtime directories (both profiles)
        ├── order              # tab IDs in visual order (one per line)
        ├── open-tab.sh        # open URL in new tab → prints new tab ID
        └── {id}/              # one directory per tab (auto-incremented, not reused)
            ├── tab-data.info  # key: value metadata (url, title, index, etc.)
            ├── console.sh     # JS eval script
            ├── console.log    # persistent JS console output
            ├── console-result # JS eval result (appears after console.sh)
            ├── click.sh       # click elements by CSS selector or coordinates
            ├── wait.sh        # wait for page load or element to appear
            ├── snapshot-dom.sh
            ├── dom.html       # full DOM (appears after snapshot-dom.sh)
            ├── screenshot.sh
            ├── screenshot.png # full-res capture (appears after screenshot.sh)
            ├── command.sh
            ├── command-result # JSON result (appears after command.sh)
            ├── network.sh
            ├── network.json   # request list (appears after network.sh list)
            └── request-{id}.json  # detail+body+headers (after network.sh detail)
```

## Config paths must be relative

In `config.py`, file paths (e.g. `content.user_stylesheets`) must use **relative paths** like `cssoverrides/default.css`, not absolute paths like `~/.config/qutebrowser/...`. Qutebrowser's `File` config type resolves relative paths against `standarddir.config()`, which `--basedir` redirects to the container's `config/` dir.

## Per-tab runtime tooling

Each tab gets a directory at `runtime/tabs/{id}/` with CLI tools that talk to qutebrowser via IPC.

### Tab-level tools (at `runtime/tabs/`)

| File | Purpose |
|---|---|
| `open-tab.sh` | Open a URL in a new tab and print the new tab ID to stdout. Usage: `open-tab.sh [--timeout <s>] <url>`. Snapshots the `order` file, sends `:open -t` via IPC, polls for the new tab ID. Default timeout 10s. The returned ID can be used to access the new tab's directory at `tabs/<id>/`. |

### Per-tab tools (at `runtime/tabs/{id}/`)

| File | Purpose |
|---|---|
| `console.sh` | Execute JS in the tab. Usage: `console.sh [--timeout <s>] '<js-expression>'`. Sends `:js-eval-tab` via IPC socket using `socat`, polls for `console-result` file. Stdout truncated at 3000 chars (full output in `console.log`). Default timeout 5s. |
| `click.sh` | Click DOM elements. Usage: `click.sh <css-selector>` (click first match, scrolls into view), `click.sh --all <selector>` (click all matches), `click.sh --coords <x> <y>` (click element at page coordinates via `elementFromPoint`). Returns description of clicked element. Reports error if no match found. Uses `console.sh` internally. Default timeout 5s. |
| `wait.sh` | Block until a condition is met. Usage: `wait.sh --load` (polls `tab-data.info` for `load_status: success`), `wait.sh --selector <css-selector>` (polls DOM via `console.sh` for element existence). Default timeout 15s, customizable with `--timeout <s>`. Exit 0 on success, exit 1 on timeout/error. |
| `snapshot-dom.sh` | Capture the tab's full DOM. Sends `:dom-snapshot` via IPC, writes `dom.html` to the tab dir. Reports file size; warns if >50k chars. |
| `command.sh` | Run any qutebrowser command and capture output. Usage: `command.sh [--timeout <s>] [--wait <ms>] <command> [args...]`. Sends `:command-eval` via IPC, hooks `message.global_bridge.show_message` to capture info/warning/error messages. Writes JSON result to `command-result`. Exit code 0 on success, 1 on error. Default timeout 10s. `--wait` delays result writing to capture async messages. |
| `network.sh` | Query network request data buffered from Chromium's `ResourceLoadComplete` (max 1000 entries per tab, FIFO eviction, clears on navigation). Subcommands: `list` (all requests → `network.json`, shows count/type breakdown/errors), `detail <id>` (single request → `request-{id}.json` — C++ metadata + timing + request headers + remoteEndpoint + response body + response headers via HTTP cache re-fetch; cross-origin without CORS gets `bodyError`), `body <id>` (not yet implemented), `ws <id>` (not yet implemented). Filters: `--errors`, `--type <type>`, `--url <pattern>`. Default timeout 5s. Detail timing includes dns/tcp/tls/ttfb breakdowns in ms. Request headers available for both sub-resources (Mojo IPC) and documents (`NavigationHandle`); excludes network-service-added headers (Accept-Encoding, Host, Cookie). |
| `screenshot.sh` | Capture tab at full screen resolution (e.g. 1920x1080) → `screenshot.png`. Usage: `screenshot.sh [--timeout <s>] [--window]`. Sends `:tab-screenshot` via IPC. `--window` captures the whole qutebrowser window instead. Background tabs captured via C++ focus suppression — temporarily switches QStackedLayout to target tab for BeginFrame, but suppresses focus events at the C++ delegate level and immediately re-shows + raises original tab so keyboard input is never disrupted. Uses custom C++ pipeline: viewport override → `IncrementCapturerCount` → `ForceRedrawForTesting` → `InsertVisualStateCallback` → `CopyFromSurface` → PNG encode. 15s safety timeout. |
| `console.log` | Persistent JS console output (warnings, errors) captured from the page — like devtools console. |
| `tab-data.info` | Tab metadata: url, title, index, pinned, load_status, private, audio, window, created_at. |

The `order` file at `runtime/tabs/order` lists tab IDs in visual tab-bar order.

Typical workflow: `open-tab.sh <url>` → `wait.sh --load` → `click.sh`/`console.sh` to interact.

All scripts communicate through the IPC socket at `runtime/ipc-<hash>` using `socat` with `--target tab-silent` (suppresses window raise/urgency hints). They check that the socket exists before attempting communication and fail with clear errors if qutebrowser isn't running.

## How --basedir works internally

`qutebrowser/utils/standarddir.py` — `_from_args()` maps `QStandardPaths` location types to basedir subdirectories:
- ConfigLocation → `config/`
- AppDataLocation → `data/`
- CacheLocation → `cache/`
- DownloadLocation → `download/`
- RuntimeLocation → `runtime/`

IPC socket name is MD5-hashed by basedir, so multiple container instances are fully isolated.

## Qt ghost directories

Qt itself creates empty skeleton dirs at the default XDG locations on every launch:
- `~/.local/share/qutebrowser/qutebrowser/QtWebEngine/Default` (empty, from QWebEngineProfile constructor)
- `~/.cache/qutebrowser/qutebrowser/qtpipelinecache-*` (Qt RHI shader cache)

These contain no actual data — all real data goes to the basedir. This is a Qt-level behavior that happens before qutebrowser redirects paths. Cosmetic only.

## Backup

Original pre-containerization files backed up at: `~/Workspace/Playground/QutebrowserBackup/{config,data,cache}`

---
Update this memory when the container path changes, new containers are created, or config.py structure changes significantly.
</memory>
