<memory-metadata>
{
  "frequency": 9,
  "last_accessed_session": 1177,
  "created_session": 1034,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

```
<conditional>
Recall if the user prompt mentions qutebrowser screenshot implementation, QtWebEngine browser tab captures, C++ WebContentsAdapter, CopyFromSurface compositor API, or background tab rendering in qutebrowser.
</conditional>

<fuzzy-match>
qutebrowser, screenshot, QtWebEngine, WebContentsAdapter, captureScreenshot, CopyFromSurface, compositor, RWHV, Chromium, C++, tab capture, background tabs, pyqt6-webengine
</fuzzy-match>

<memory>
CaptureScreenshot implementation for qutebrowser's custom QtWebEngine build.

## Architecture

1. **C++ WebContentsAdapter** — captureScreenshot(), finishScreenshotRequest()
2. **Qt QWebEnginePage** — public API + focus suppression static methods
3. **SIP bindings** — pyqt6-webengine qwebenginepage.sip
4. **Python tabruntime.py** — screenshot_tab() orchestrates tab switching + capture

## C++ capture pipeline (web_contents_adapter.cpp)

- `m_captureSizeOverride` in RWHV overrides `GetViewBounds()` → renderer lays out at screen size (1920x1080)
- `synchronizeVisualProperties()` propagates to renderer
- `IncrementCapturerCount(stay_hidden=true)` prevents tab discard, ScopedClosureRunner auto-decrements
- `ForceRedrawForTesting()` + `InsertVisualStateCallback()` waits for frame at new size
- 80ms delay for compositor, then `CopyFromSurface` → PNG encode → callback
- `finishScreenshotRequest()` clears override, restores widget size
- 15-second safety timeout

## C++ focus suppression (3 layers)

`s_suppressFocusCount` static in `RenderWidgetHostViewQtDelegateClient`:
1. **Delegate client** (`handleFocusEvent`): silently accepts focus events without calling GotFocus/LostFocus on Chromium host
2. **Delegate item** (`focusInEvent/focusOutEvent`): ignores focus events so QQuickItem scene graph doesn't transfer focus
3. **Delegate item** (`keyPressEvent/keyReleaseEvent/ShortcutOverride`): eats keyboard events so they never reach the wrong renderer

Exposed via `QWebEnginePage::suppressFocusNotifications()` / `restoreFocusNotifications()`.

## Python tab switch (background tabs)

Background tabs must become current in QStackedLayout because the viz Display pipeline requires BeginFrame signals from Qt's render loop — only the current widget gets them.

screenshot_tab() flow:
1. `suppressFocusNotifications()` — C++ blocks focus/keyboard forwarding
2. Save `focusWidget()`, `blockSignals(True)` on tab widget
3. `setCurrentIndex(target)` — target gets BeginFrame
4. `original_view.show()` + `raise_()` — re-show original on top (both tabs visible, both render)
5. `focused_widget.setFocus()` — works because original is visible again
6. `captureScreenshot()` triggers async C++ pipeline
7. Callback: `setCurrentIndex(original)`, `blockSignals(False)`, `restoreFocusNotifications()`

Active tabs: same `captureScreenshot()` call, no tab switching.

## Result
- 1920x1080 full resolution (true re-layout, not upscaling)
- Zero input disruption (keystrokes continue flowing to active tab)
- Minimal visual flicker (small FPS drop, no content change)
- Window mode: QWidget::grab()

## Modified files (10 C++ + 3 Python + SIP)
- render_widget_host_view_qt.h/.cpp — m_captureSizeOverride, friend WebContentsAdapter
- render_widget_host_view_qt_delegate_client.h/.cpp — s_suppressFocusCount, handleFocusEvent guard
- render_widget_host_view_qt_delegate_item.cpp — focus/key/shortcut suppression
- web_contents_adapter.h/.cpp — captureScreenshot, finishScreenshotRequest, ScreenshotRequest
- qwebenginepage.h/.cpp/p.h — public API + focus suppression methods
- qwebenginepage.sip — SIP bindings
- tabruntime.py — screenshot_tab() + screenshot.sh script
- commands.py — :tab-screenshot command
- sessions.py — requestedUrl() fallback (separate bugfix)
</memory>
```