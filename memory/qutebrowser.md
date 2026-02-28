<memory-metadata>
{
  "frequency": 156,
  "last_accessed_session": 1194,
  "created_session": 0,
  "appreciation": 0,
  "pinned": true
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions qutebrowser, the custom QtWebEngine or Chromium build, submodule workflow, tab runtime, element shaders, hinting, ladder-commit, or chrome extensions.
</conditional>

<fuzzy-match>
qutebrowser, qute, browser, qtwebengine, webengine, chromium, blink, pyqt6, sip bindings, submodule, ladder-commit, tab runtime, tabruntime, element shader, hinting, native elements, mojom, yeyito-browser, yeyitowebengine, chrome extension, crx, extension manager
</fuzzy-match>

<memory>
The user's qutebrowser is a deep fork — not vanilla. It includes a custom build of QtWebEngine all the way down to Chromium/Blink source, so changes can happen at any level from Python UI code to the browser engine itself.

The source lives at `~/Workspace/Qutebrowser/`. Before doing any work there, read the project-level instructions at `Qutebrowser/CLAUDE.md`. For runtime configuration (basedir, profiles, greasemonkey), see `memory/qutebrowser-runtime.md`.

## Project structure

Three nested repos form a submodule chain:

```
Qutebrowser/                     ← main repo (Yeyito777/yeyito-browser)
├── qtwebengine/                 ← submodule (Yeyito777/yeyitowebengine)
│   └── src/3rdparty/            ← nested submodule (Yeyito777/qtwebengine-chromium)
│       └── chromium/...         ← Blink source lives here
└── pyqt6-webengine/             ← submodule (Yeyito777/pyqt6-webengine)
    └── sip/QtWebEngineCore/     ← SIP bindings (includes custom enum values)
```

On the Python side, the main directories are:

| Directory | Purpose |
|-----------|---------|
| `qutebrowser/browser/` | Browser core (tabs, webengine integration) |
| `qutebrowser/config/` | Configuration system |
| `qutebrowser/keyinput/` | Key input handling |
| `qutebrowser/mainwindow/` | Main window, statusbar, tabs |
| `qutebrowser/commands/` | Command system |
| `qutebrowser/javascript/` | JS injected into pages |
| `qutebrowser/utils/` | Utilities |
| `tests/` | Test suite |

## Reference docs

The `reference/` directory has detailed docs for specific subsystems. Read the relevant one before touching a feature:

- `element-shader.md` — element shader, colors, CSS transforms
- `build.md` — build process, directory structure, SIP bindings (Phase 4)
- `submodules.md` — git submodule workflow
- `adding-a-web-setting.md` — adding a new setting touches 10 points across 9 files (WebAttribute, mojom, IPC, preferences)
- `dependencies.md` — system packages, what is built vs from system
- `pdfjs-polyfills.md` — PDF.js patching, polyfills
- `directories.md` — all directories qutebrowser uses on disk
- `hinting.md` — hinting system internals (user input → element selection → action)
- `javascript-hinting.md` — JavaScript hint target system
- `native-elements.md` — NativeTheme, Chromium native form controls (checkboxes, radios, etc.), Skia rendering
- `dwm-persist.md` — dwm persist integration, `_DWM_SAVE_ARGV` X11 property set from `showEvent()`
- `tab-runtime.md` — tab runtime manager, filesystem IPC for live tab state, signal wiring
- `network-inspection.md` — network.sh usage guide, subcommands, filters, examples, JSON formats
- `network-tab-tool.md` — network inspection technical reference (C++ buffer, Chromium data source, every file/function/line)
- `command-eval.md` — command.sh / `:command-eval` technical reference (message hooking, JSON format, architecture)
- `extensions.md` — Chrome extension system (loading, CRX extraction, `:extensions` list, `:uninstall-extension`, config API, reload)
- `screenshot.md` — tab screenshot technical reference (C++ capture pipeline, focus suppression, every file/function)

## Building and installing

After making code changes, always install so the user can test right away:

| Command | When to use |
|---------|-------------|
| `./install.sh` | Python-only changes (skips build if commit unchanged) |
| `./install.sh --dirty` | C++/Blink/QtWebEngine changes (forces rebuild even with uncommitted changes) |

Launch the custom build with `~/.local/bin/qutebrowser`.

To commit across the submodule chain, use `ladder-commit` — it walks all three repo levels:

```bash
./scripts/ladder-commit "msg"          # commit only
./scripts/ladder-commit "msg" --push   # commit and push all levels
```

Build times vary widely: instant if nothing changed, 1–5 min for a single .cc file, ~30–60s for SIP bindings, ~2 hours for a full rebuild.

## Testing

```bash
source .venv/bin/activate
QT_QPA_PLATFORM=offscreen PYTHONPATH=. pytest tests/unit/path/to/test.py -v
```

## Tab runtime manager

`TabRuntimeManager` (in `qutebrowser/browser/tabruntime.py`) exposes live tab state as plain-text files under `{basedir}/runtime/tabs/`. Each tab gets a directory with a `tab-data.info` file containing key-value pairs (url, title, index, pinned, load_status, private, audio, window, created_at), and an `order` file lists tabs in bar order. It's instantiated once per `TabbedBrowser` (line 247 of `tabbedbrowser.py`). See `reference/tab-runtime.md` for the full picture.

## Workflow rules

- **Do NOT run git commands** (commit, push, checkout, etc.) unless explicitly told to. The user manages git manually.
- **Always install after code changes** — run `./install.sh` for Python-only or `./install.sh --dirty` for C++ changes. Do this automatically without asking; the user expects the install to happen as part of the task.

---
Update this memory when the submodule structure, build process, reference docs, or workflow rules change.
</memory>
