Qutebrowser fork with custom QtWebEngine/Chromium build — source at ~/Workspace/Qutebrowser/, submodule chain (qtwebengine, chromium, pyqt6-webengine SIP bindings), install.sh build workflow, ladder-commit, reference docs (element shader, web settings, hinting, native elements), pytest testing. For runtime config see qutebrowser-runtime.md

# Location
- Source: `/home/yeyito/Workspace/Qutebrowser/`
- Project-level instructions: `/home/yeyito/Workspace/Qutebrowser/CLAUDE.md` (read this when working in qutebrowser)

# What It Is
A fork of qutebrowser that includes a **custom build of QtWebEngine** (Chromium/Blink), allowing deep browser engine modifications. This is not a vanilla qutebrowser — it has a full submodule chain down to Chromium source.

# Submodule Structure
```
Qutebrowser/                     ← main repo (Yeyito777/yeyito-browser)
├── qtwebengine/                 ← submodule (Yeyito777/yeyitowebengine)
│   └── src/3rdparty/            ← nested submodule (Yeyito777/qtwebengine-chromium)
│       └── chromium/...         ← Blink source lives here
└── pyqt6-webengine/             ← submodule (Yeyito777/pyqt6-webengine)
    └── sip/QtWebEngineCore/     ← SIP bindings (includes custom enum values)
```

# Code Organization (Python/qutebrowser side)
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

# Reference Docs
Located in `reference/` directory — read these before touching related features:
- `element-shader.md` — element shader, colors, CSS transforms
- `build.md` — build process, directory structure, SIP bindings (Phase 4)
- `submodules.md` — git submodule workflow
- `adding-a-web-setting.md` — new settings, WebAttribute, mojom, IPC, preferences (10 touch points across 9 files)
- `dependencies.md` — system packages, what is built vs from system
- `pdfjs-polyfills.md` — PDF.js patching, polyfills
- `directories.md` — all directories qutebrowser uses on disk
- `hinting.md` — hinting system internals (user input → element selection → action)
- `javascript-hinting.md` — JavaScript hint target system
- `native-elements.md` — NativeTheme, Chromium native form controls (checkboxes, radios, etc.), Skia rendering

# Building
| Command | Purpose |
|---------|---------|
| `./install.sh` | Build (skips if commit unchanged) |
| `./install.sh --dirty` | Force rebuild with uncommitted changes |
| `~/.local/bin/qutebrowser` | Launch with custom QtWebEngine |
| `./scripts/ladder-commit "msg"` | Commit through all 3 submodule levels |
| `./scripts/ladder-commit "msg" --push` | Commit and push through all 3 levels |

### Build Times
- No changes: instant (skipped)
- Single .cc file: 1-5 minutes
- Full rebuild: ~2 hours
- SIP bindings rebuild: ~30-60 seconds

# Testing
```bash
source .venv/bin/activate
QT_QPA_PLATFORM=offscreen PYTHONPATH=. pytest tests/unit/path/to/test.py -v
```

# Critical Workflow Notes
- **Do NOT run git commands** (commit, push, checkout, etc.) unless explicitly instructed. User manages git manually.
- **After editing Blink/QtWebEngine C++ files**, always run `./install.sh --dirty` to build and install immediately.

---
Update this memory when qutebrowser's submodule structure, build process, reference docs, or workflow changes.
