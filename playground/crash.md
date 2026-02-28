==== Exception ====
Traceback (most recent call last):
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/eventfilter.py", line 117, in eventFilter
    return handler(cast(QKeyEvent, event))
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/eventfilter.py", line 64, in _handle_key_event
    return man.handle_event(event)
           ~~~~~~~~~~~~~~~~^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/modeman.py", line 466, in handle_event
    return handler(cast(QKeyEvent, event))
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/modeman.py", line 279, in _handle_keypress
    match = parser.handle(event, dry_run=dry_run)
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/basekeyparser.py", line 311, in handle
    self._handle_result(info, result)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/basekeyparser.py", line 330, in _handle_result
    self.execute(result.command, count)
    ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/modeparsers.py", line 62, in execute
    self._commandrunner.run(cmdstr, count)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/commands/runners.py", line 176, in run
    result.cmd.run(self._win_id, args, count=count)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/commands/command.py", line 529, in run
    self.handler(*posargs, **kwargs)
    ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/mainwindow/prompt.py", line 443, in prompt_accept
    question.done()
    ~~~~~~~~~~~~~^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/utils/usertypes.py", line 414, in done
    self.answered.emit(self.answer)
    ^^^^^^^^^^^^^
RuntimeError: wrapped C/C++ object of type Question has been deleted


==== Timestamps ====
Launch: Sat Feb 28 05:24:46 2026
Crash: Sat Feb 28 05:52:41 2026

==== Version info ====
         ______     ,,
    ,.-"`      | ,-` |
  .^           ||    |
 /    ,-*^|    ||    |
;    /    |    ||    ;-*```^*.
;   ;     |    |;,-*`         \
|   |     |  ,-*`    ,-"""\    \
|    \   ,-"`    ,-^`|     \    |
 \    `^^    ,-;|    |     ;    |
  *;     ,-*`  ||    |     /   ;;
    `^^`` |    ||    |   ,^    /
          |    ||    `^^`    ,^
          |  _,"|        _,-"
          -*`   ****"""``

qutebrowser v3.5.1
Git commit: dbd2c827d-dirty on main (2026-02-23 18:43:25 -0500)
Backend: QtWebEngine 6.10
  based on Chromium 134.0.6998.208
  with security patches up to 140.0.7339.207 (plus any distribution patches)
  (source: api)
Qt: 6.10.2

CPython: 3.14.3
PyQt: 6.10.2

Qt wrapper info:
  PyQt6: success
  PyQt5: not imported
  -> selected: PyQt6 (via autoselect)

colorama: no
jinja2: 3.1.6
pygments: 2.19.2
yaml: 6.0.3
adblock: no
objc: no
PyQt6.QtWebEngineCore: 6.10.0
PyQt6.sip: 6.15.1
pdf.js: 5.4.624 (/usr/share/pdf.js/build/pdf.mjs)
sqlite: 3.51.2
QtNetwork SSL: OpenSSL 3.6.1 27 Jan 2026

Style: QFusionStyle
Qt Platform: xcb (dwm)
OpenGL: AMD, 4.6 (Compatibility Profile) Mesa 25.3.5-arch1.1
Platform: Linux-6.18.9-arch1-2-x86_64-with-glibc2.43, 64bit
Linux distribution: Arch Linux (arch)
Frozen: False
Imported from /home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser
Using Python from /home/yeyito/.local/share/qutebrowser-venv/bin/python
Qt library executable path: /usr/lib/qt6, data path: /usr/share/qt6

Paths:
cache: /home/yeyito/.runtime/qutebrowser-yeyito/cache
config: /home/yeyito/.runtime/qutebrowser-yeyito/config
data: /home/yeyito/.runtime/qutebrowser-yeyito/data
runtime: /home/yeyito/.runtime/qutebrowser-yeyito/runtime

Autoconfig loaded: no
Config.py: /home/yeyito/.runtime/qutebrowser-yeyito/config/config.py has been loaded
Uptime: 0:27:55

==== Config ====
aliases = {"noh": "search", "q": "close", "qa": "quit", "w": "session-save", "wq": "quit --save", "wqa": "quit --save"}
auto_save.session = true
bindings.commands = {"normal": {"<Alt+1>": null, "<Alt+2>": null, "<Alt+3>": null, "<Alt+4>": null, "<Alt+5>": null, "<Alt+6>": null, "<Alt+7>": null, "<Alt+8>": null, "<Alt+9>": null, "<Ctrl+1>": "tab-focus 1", "<Ctrl+2>": "tab-focus 2", "<Ctrl+3>": "tab-focus 3", "<Ctrl+4>": "tab-focus 4", "<Ctrl+5>": "tab-focus 5", "<Ctrl+6>": "tab-focus 6", "<Ctrl+7>": "tab-focus 7", "<Ctrl+8>": "tab-focus 8", "<Ctrl+9>": "tab-focus 9", "<Ctrl+Shift+y>": "yank-dom", "<Ctrl+Space>": "hint scrollables focus", "<Ctrl+b>": "scroll-px 0 -1120", "<Ctrl+d>": "scroll-px 0 560", "<Ctrl+e>": "scroll-px 0 140", "<Ctrl+f>": "scroll-px 0 1120", "<Ctrl+j>": "hint rightclickables right-click", "<Ctrl+k>": "hint hoverables hover", "<Ctrl+m>": "devtools", "<Ctrl+n>": "devtools-focus", "<Ctrl+s>": "shader-toggle", "<Ctrl+u>": "scroll-px 0 -560", "<Ctrl+y>": "scroll-px 0 -140", "<Escape>": "fake-key <Escape>", "=": "zoom-in", "E": "tab-move +", "P": "open -t -- {clipboard}", "ac": "download-clear", "c": "tab-clone", "e": "tab-move -", "j": "scroll-px 0 280", "k": "scroll-px 0 -280", "p": "open -- {clipboard}", "t": "cmd-set-text -s :tab-focus"}}
bindings.key_mappings = {"<Ctrl+6>": "<Ctrl+^>", "<Ctrl+Enter>": "<Ctrl+Return>", "<Ctrl+i>": "<Tab>", "<Ctrl+j>": "<Return>", "<Ctrl+m>": "<Return>", "<Enter>": "<Return>", "<Shift+Enter>": "<Return>", "<Shift+Return>": "<Return>"}
colors.completion.category.bg = #001020
colors.completion.category.border.bottom = #002040
colors.completion.category.border.top = #002040
colors.completion.category.fg = #eaf7ff
colors.completion.even.bg = #000a1a
colors.completion.fg = #cce7ff
colors.completion.item.selected.bg = #1d9bf0
colors.completion.item.selected.border.bottom = #0b72c2
colors.completion.item.selected.border.top = #4fd0ff
colors.completion.item.selected.fg = #00050f
colors.completion.item.selected.match.fg = #eaf7ff
colors.completion.match.fg = #eaf7ff
colors.completion.odd.bg = #001020
colors.completion.scrollbar.bg = #00050f
colors.completion.scrollbar.fg = #002040
colors.contextmenu.disabled.bg = #000a1a
colors.contextmenu.disabled.fg = #cce7ff
colors.contextmenu.menu.bg = #00050f
colors.contextmenu.menu.border = #1d9bf0
colors.contextmenu.menu.fg = #ffffff
colors.contextmenu.selected.bg = #1d9bf0
colors.contextmenu.selected.fg = #00050f
colors.downloads.bar.bg = #00050f
colors.downloads.error.bg = #00050f
colors.downloads.error.fg = #0070b8
colors.downloads.start.bg = #00050f
colors.downloads.start.fg = #1d9bf0
colors.downloads.stop.bg = #00050f
colors.downloads.stop.fg = #00bcd4
colors.downloads.system.bg = none
colors.downloads.system.fg = none
colors.hints.bg = #1d9bf0
colors.hints.fg = #00050f
colors.hints.match.fg = #eaf7ff
colors.keyhint.bg = #000a1a
colors.keyhint.fg = #cce7ff
colors.keyhint.suffix.fg = #eaf7ff
colors.messages.error.bg = #001020
colors.messages.error.border = #002040
colors.messages.error.fg = #0070b8
colors.messages.info.bg = #001020
colors.messages.info.border = #002040
colors.messages.info.fg = #ffffff
colors.messages.warning.bg = #001020
colors.messages.warning.border = #002040
colors.messages.warning.fg = #00bcd4
colors.prompts.bg = #001020
colors.prompts.border = 1px solid #1d9bf0
colors.prompts.fg = #ffffff
colors.prompts.selected.bg = #4fd0ff
colors.prompts.selected.fg = #eaf7ff
colors.statusbar.caret.bg = #000a1a
colors.statusbar.caret.fg = #eaf7ff
colors.statusbar.caret.selection.bg = #000a1a
colors.statusbar.caret.selection.fg = #eaf7ff
colors.statusbar.command.bg = #000a1a
colors.statusbar.command.fg = #ffffff
colors.statusbar.command.private.bg = #000a1a
colors.statusbar.command.private.fg = #cce7ff
colors.statusbar.insert.bg = #1d9bf0
colors.statusbar.insert.fg = #00050f
colors.statusbar.normal.bg = #00050f
colors.statusbar.normal.fg = #ffffff
colors.statusbar.passthrough.bg = #0070b8
colors.statusbar.passthrough.fg = #eaf7ff
colors.statusbar.private.bg = #001020
colors.statusbar.private.fg = #cce7ff
colors.statusbar.progress.bg = #4fd0ff
colors.statusbar.url.error.fg = #0070b8
colors.statusbar.url.fg = #cce7ff
colors.statusbar.url.hover.fg = #008fe0
colors.statusbar.url.success.http.fg = #00bcd4
colors.statusbar.url.success.https.fg = #1d9bf0
colors.statusbar.url.warn.fg = #0b72c2
colors.tabs.bar.bg = #000a1a
colors.tabs.even.bg = #001020
colors.tabs.even.fg = #cce7ff
colors.tabs.indicator.error = #0070b8
colors.tabs.indicator.system = none
colors.tabs.odd.bg = #001020
colors.tabs.odd.fg = #cce7ff
colors.tabs.selected.even.bg = #1d9bf0
colors.tabs.selected.even.fg = #ffffff
colors.tabs.selected.odd.bg = #1d9bf0
colors.tabs.selected.odd.fg = #ffffff
colors.webpage.bg = #00050f
completion.open_categories = ["quickmarks", "bookmarks", "history", "filesystem"]
content.autoplay = true
https://www.youtube.com/*: content.autoplay = false
https://music.youtube.com/*: content.autoplay = false
https://discord.com/*: content.autoplay = true
content.cookies.accept = no-3rdparty
content.cookies.thirdparty_whitelist = ["*://*.recaptcha.net/*", "*://*.hcaptcha.com/*", "*://accounts.google.com/*"]
https://discord.com: content.desktop_capture = true
content.element_shader = true
content.javascript.clipboard = access
https://discord.com/*: content.media.audio_capture = true
https://discord.com: content.media.video_capture = true
content.pdfjs = true
https://mail.google.com?extsrc=mailto&url=%25s: content.register_protocol_handler = true
content.user_stylesheets = cssoverrides/default.css
devtools.auto_focus = true
hints.border = 1px solid #1d9bf0
hints.radius = 0
qt.args = ["autoplay-policy=no-user-gesture-required", "disable-features=UseCameraPipeWire"]
scrolling.smooth_factor = 0.3
tabs.new_position.related = next
tabs.new_position.unrelated = next
tabs.position = left
tabs.width = 175
url.searchengines = {"DEFAULT": "https://www.google.com/search?hl=en&q={}", "ai": "https://claude.ai/new?q={}", "aw": "https://wiki.archlinux.org/index.php?search={}", "ddg": "https://duckduckgo.com/?q={}", "gem": "https://aistudio.google.com/prompts/new_chat?model=gemini-3-pro-preview&prompt={}&autosend=1", "gh": "https://github.com/search?q={}", "gpt": "https://chatgpt.com/?autosend=1&model=gpt-5&q={}", "gptt": "https://chatgpt.com/?autosend=1&model=gpt-5-thinking&q={}", "yt": "https://www.youtube.com/results?search_query={}"}

==== Environment ====
LANG = en_US.UTF-8
PATH = /home/yeyito/Workspace/Mnemo/node_modules/.bin:/home/yeyito/Workspace/Mnemo/node_modules/.bin:/home/yeyito/Workspace/node_modules/.bin:/home/yeyito/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/home/yeyito/Workspace/Mnemo/node_modules/.bin:/home/yeyito/Workspace/Mnemo/node_modules/.bin:/home/yeyito/Workspace/node_modules/.bin:/home/yeyito/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/home/yeyito/.local/rust/cargo/bin:/home/yeyito/.local/bun/bin:/home/yeyito/.local/rust/cargo/bin:/home/yeyito/.local/bun/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin:/home/yeyito/.local/bin:/home/yeyito/.local/bin
PYTHONHISTFILE = /home/yeyito/.cache/python_history
QTWEBENGINE_DICTIONARIES_PATH = /home/yeyito/.runtime/qutebrowser-yeyito/data/qtwebengine_dictionaries
QTWEBENGINE_LOCALES_PATH = /home/yeyito/Workspace/Qutebrowser/build/install/share/qt6/translations/qtwebengine_locales
QTWEBENGINE_RESOURCES_PATH = /home/yeyito/Workspace/Qutebrowser/build/install/share/qt6/resources
QT_PLUGIN_PATH = /home/yeyito/Workspace/Qutebrowser/build/install/plugins
XDG_RUNTIME_DIR = /run/user/1000
XDG_SEAT = seat0
XDG_SESSION_CLASS = user
XDG_SESSION_ID = 1
XDG_SESSION_TYPE = tty
XDG_VTNR = 1

==== Commandline args ====
--basedir /home/yeyito/.runtime/qutebrowser-yeyito -r default

==== Open Pages ====
https://www.youtube.com/watch?v=9dDgUc7CjiE
https://www.youtube.com/watch?v=rJt-x-0Jci4
https://www.youtube.com/watch?v=6Nru5OQq9O4
https://www.youtube.com/watch?v=M2iX6HQOoLg
https://www.youtube.com/watch?v=JrTviqq8-sM
https://www.youtube.com/watch?v=vV4zUFFnhms
https://github.com/Yeyito777#main-content
https://www.google.com/search?hl=en&q=BTC%20to%20usd
https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ
https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox
https://www.youtube.com/watch?v=4YymJMmY4tQ
https://www.youtube.com/watch?v=vV4zUFFnhms
https://claude.ai/new
https://discord.com/channels/1389428023832608861/1389446484105101352
https://dnsimple.com/login?account_id=171315
https://mail.google.com/mail/u/0/#spam/FMfcgzQfBsvSTzLhVzxbxhgLbSvjQsnH
https://mail.google.com/mail/u/0/#inbox
https://mail.google.com/mail/u/0/#inbox
https://www.youtube.com/watch?v=icBDYkfxpMs
https://www.youtube.com/watch?v=tKGhxMi50y8
file:///home/yeyito/Documents/Academic/cv-aurelio-linero-kittenml.pdf
https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)
https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com
https://kittenml.com/
https://www.google.com/search?sca_esv=a36b70f2ee78bb4e&hl=en&sxsrf=ANbL-n4wXe3ULyxMSaeWXnGr1NNiW5iU3w:1772148986707&udm=2&fbs=ADc_l-aN0CWEZBOHjofHoaMMDiKpaEWjvZ2Py1XXV8d8KvlI3vWUtYx0DZdicpfE1faGYenqWn-q4MFiFFtvJjTKeAVxBf9XF8ByrMpEedseJb6C24e7QdJQdIE3TPpl5mEwf0HZUp1chSl04q3NzUG-sivE9fh2upv_LUl1i41J2OLX0ntDV3FbKmN59pJf5BBarEFT9msi8Zx3tjpgPrbRkWHc8AvYww&q=fractal+design+terra+case&sa=X&ved=2ahUKEwjE4d22qfiSAxWhkYkEHVp6Nw0QtKgLegQIChAB&biw=1743&bih=1042&dpr=1#vhid=IjCSOkpwhxF8aM&vssid=mosaic
https://mail.google.com/mail/u/0/#inbox
https://www.google.com/search?hl=en&sca_esv=9be18ee3e64d646c&sxsrf=ANbL-n4fVYy6CkdHc8ky74rkxH-2i-2FbA:1772155674996&udm=2&fbs=ADc_l-aN0CWEZBOHjofHoaMMDiKpaEWjvZ2Py1XXV8d8KvlI3vxYI1tojT_24H7Q4iMwclSqIfnTP5J_a1_YHnhrZjiiTJD_2pug00kYgkdnJCgVeWKMtN3ZYjU-fsD1M3d2Dmz1foaT9_R1LQVgaHp55LH_v32V-HRoy-dUTf3fbguP4iqnOyH0s16yO48k0dBLeKMo1WdNvgJZylz2CnOnN2tgIPl--g&q=golden+goose+for+women&sa=X&sqi=2&ved=2ahUKEwittPqrwviSAxV9QjABHZLFKTIQtKgLegQIExAB&biw=1743&bih=1042&dpr=1#vhid=wIf44cD_SfywZM&vssid=mosaic
https://claude.ai/chat/7f55a028-ef6f-46c7-85ad-d7e348f5be14
https://apply.adm.utoronto.ca/register/questions

==== Command history ====
:open https://kittenml.com/
:open -t yt looping in the room
:open -t yt backrooms movie trailer
:open -t gmail.com
:open -t localhost:3000

==== Objects ====

Qt widgets - 199 objects:
    <PyQt6.QtWidgets.QHeaderView object at 0x7ff3001e8e10>
    <PyQt6.QtWidgets.QLabel object at 0x7ff2e434d310>
    <PyQt6.QtWidgets.QLabel object at 0x7ff2e434d590>
    <PyQt6.QtWidgets.QLabel object at 0x7ff3001731b0>
    <PyQt6.QtWidgets.QLabel object at 0x7ff300173430>
    <PyQt6.QtWidgets.QLabel object at 0x7ff3001734d0>
    <PyQt6.QtWidgets.QLabel object at 0x7ff300173570>
    <PyQt6.QtWidgets.QLabel object at 0x7ff300173c50>
    <PyQt6.QtWidgets.QLabel object at 0x7ff300173e30>
    <PyQt6.QtWidgets.QLabel object at 0x7ff3001e8370>
    <PyQt6.QtWidgets.QLabel object at 0x7ff3001e8690>
    <PyQt6.QtWidgets.QLabel object at 0x7ff3001e8eb0>
    <PyQt6.QtWidgets.QLabel object at 0x7ff3001e91d0>
    <PyQt6.QtWidgets.QLabel object at 0x7ff3001e9310>
    <PyQt6.QtWidgets.QLabel object at 0x7ff3001e93b0>
    <PyQt6.QtWidgets.QScrollBar object at 0x7ff2e5706e90>
    <PyQt6.QtWidgets.QScrollBar object at 0x7ff300171770>
    <PyQt6.QtWidgets.QScrollBar object at 0x7ff3001739d0>
    <PyQt6.QtWidgets.QScrollBar object at 0x7ff300173d90>
    <PyQt6.QtWidgets.QScrollBar object at 0x7ff3001e8550>
    <PyQt6.QtWidgets.QScrollBar object at 0x7ff3001e8cd0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff2e434ccd0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff2e434ceb0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff2e434cf50>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff2e434cff0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff2e434d090>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff2e434d450>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff2e434d4f0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff2e439b890>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001716d0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001719f0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff300173110>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001732f0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff300173390>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff300173610>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff300173750>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff300173890>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff300173b10>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff300173bb0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff300173cf0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e8050>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e82d0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e84b0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e8870>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e8910>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e8a50>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e8ff0>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e9090>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e9590>
    <PyQt6.QtWidgets.QSplitterHandle object at 0x7ff3001e96d0>
    <PyQt6.QtWidgets.QStackedWidget object at 0x7ff300173250>
    <PyQt6.QtWidgets.QToolButton object at 0x7ff2e434cc30>
    <PyQt6.QtWidgets.QToolButton object at 0x7ff3001e8410>
    <PyQt6.QtWidgets.QWidget object at 0x7ff2e434ce10>
    <PyQt6.QtWidgets.QWidget object at 0x7ff2e434d130>
    <PyQt6.QtWidgets.QWidget object at 0x7ff2e434d1d0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff2e434d270>
    <PyQt6.QtWidgets.QWidget object at 0x7ff2e434d3b0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff2e439b930>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300171810>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001718b0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300172df0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300172e90>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300172f30>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300172fd0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300173070>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001736b0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001737f0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300173930>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300173a70>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300173ed0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff300173f70>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e80f0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e8190>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e8230>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e85f0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e8730>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e87d0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e89b0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e8af0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e8b90>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e8c30>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e8d70>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e8f50>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e9130>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e9270>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e9450>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e94f0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e9630>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e9770>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e98b0>
    <PyQt6.QtWidgets.QWidget object at 0x7ff3001e9950>
    <qutebrowser.browser.downloadview.DownloadView count=0>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=0 url='https://www.youtube.com/watch?v=9dDgUc7CjiE'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=1 url='https://www.youtube.com/watch?v=rJt-x-0Jci4'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=10 url='https://www.youtube.com/watch?v=4YymJMmY4tQ'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=11 url='https://www.youtube.com/watch?v=vV4zUFFnhms'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=12 url='https://claude.ai/new'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=13 url='https://discord.com/channels/1389428023832608861/1389446484105101352'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=14 url='https://dnsimple.com/login?account_id=171315'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=15 url='https://www.youtube.com/watch?v=icBDYkfxpMs'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=16 url='https://www.youtube.com/watch?v=tKGhxMi50y8'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=17 url='file:///home/yeyito/Documents/Academic/cv-aurelio-linero-kittenml.pdf'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=2 url='https://www.youtube.com/watch?v=6Nru5OQq9O4'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=23 url='https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Ar…'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=24 url='https://kittenml.com/'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=25 url='https://www.google.com/search?sca_esv=a36b70f2ee78bb4e&hl=en&sxsrf=ANbL-n4wXe3ULyxMSaeWXnGr1NNiW5iU…'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=26 url='https://mail.google.com/mail/u/0/#inbox'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=27 url='https://www.google.com/search?hl=en&sca_esv=9be18ee3e64d646c&sxsrf=ANbL-n4fVYy6CkdHc8ky74rkxH-2i-2F…'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=28 url='https://claude.ai/chat/7f55a028-ef6f-46c7-85ad-d7e348f5be14'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=29 url='https://apply.adm.utoronto.ca/register/questions'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=3 url='https://www.youtube.com/watch?v=M2iX6HQOoLg'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=30 url='https://mail.google.com/mail/u/0/#spam/FMfcgzQfBsvSTzLhVzxbxhgLbSvjQsnH'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=31 url='https://mail.google.com/mail/u/0/#inbox'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=32 url='https://mail.google.com/mail/u/0/#inbox'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=33 url='https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob…'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=4 url='https://www.youtube.com/watch?v=JrTviqq8-sM'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=5 url='https://www.youtube.com/watch?v=vV4zUFFnhms'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=6 url='https://github.com/Yeyito777#main-content'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=7 url='https://www.google.com/search?hl=en&q=BTC to usd'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=8 url='https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ'>
    <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=9 url='https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox'>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff2d67d8a50>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff3001049b0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff300127a70>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff30014e8f0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c310550>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3111d0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c311f90>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c312c10>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c313890>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c344550>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3451d0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c345c70>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c346ad0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c347750>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c37c4b0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c37d1d0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c37de50>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3af390>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3dc050>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3dccd0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3dd950>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3de5d0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3df250>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3dfed0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff36428bc50>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff3642e4f50>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff3642e5bd0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff3642e6df0>
    <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff3642e79d0>
    <qutebrowser.completion.completionwidget.CompletionView>
    <qutebrowser.mainwindow.mainwindow.MainWindow>
    <qutebrowser.mainwindow.messageview.MessageView object at 0x7ff364288b90>
    <qutebrowser.mainwindow.prompt.PromptContainer win_id=0>
    <qutebrowser.mainwindow.statusbar.backforward.Backforward text=''>
    <qutebrowser.mainwindow.statusbar.bar.StatusBar>
    <qutebrowser.mainwindow.statusbar.clock.Clock text=''>
    <qutebrowser.mainwindow.statusbar.command.Command text=''>
    <qutebrowser.mainwindow.statusbar.keystring.KeyString text=''>
    <qutebrowser.mainwindow.statusbar.percentage.Percentage text='[top]'>
    <qutebrowser.mainwindow.statusbar.progress.Progress value=100>
    <qutebrowser.mainwindow.statusbar.searchmatch.SearchMatch text=''>
    <qutebrowser.mainwindow.statusbar.tabindex.TabIndex text='[23/29]'>
    <qutebrowser.mainwindow.statusbar.textbase.TextBase text=''>
    <qutebrowser.mainwindow.statusbar.url.UrlText text='https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com'>
    <qutebrowser.mainwindow.tabbedbrowser.TabbedBrowser count=29>
    <qutebrowser.mainwindow.tabwidget.TabBar count=29>
    <qutebrowser.mainwindow.tabwidget.TabWidget object at 0x7ff364224690>
    <qutebrowser.misc.keyhintwidget.KeyHintView win_id=0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff2d67d8370>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff300105090>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff300128190>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff30014efd0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff3247085f0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3100f0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c310c30>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3119f0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c312670>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3132f0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c313f70>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c344c30>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3458b0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c346350>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3471b0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c347e30>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c37cb90>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c37d8b0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c37e530>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3afa70>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3dc730>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3dd3b0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3de030>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3decb0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff33c3df930>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff3642e44b0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff3642e5630>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff3642e62b0>
    <qutebrowser.misc.miscwidgets.InspectorSplitter object at 0x7ff3642e74d0>

Qt objects - 30 objects:
    <PyQt6.QtCore.QAbstractEventDispatcher object at 0x7ff2e434cf50>
    <PyQt6.QtGui.QSessionManager object at 0x7ff2e434cff0>
    <qutebrowser.misc.quitter.Quitter object at 0x7ff37afd3f70>
    <qutebrowser.misc.crashsignal.CrashHandler object at 0x7ff37ae4c050>
    <qutebrowser.misc.crashsignal.SignalHandler object at 0x7ff37ae4c0f0>
        <PyQt6.QtCore.QSocketNotifier object at 0x7ff37ae4c370>
    <qutebrowser.misc.savemanager.SaveManager saveables=OrderedDict({'yaml-config': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename=None name='yaml-config' save_handler=<bound method YamlConfig._save of <qutebrowser.config.configfiles.YamlConfig object at 0x7ff37af92df0>> save_on_exit=False>, 'state-config': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename=None name='state-config' save_handler=<bound method StateConfig._save of <qutebrowser.config.configfiles.StateConfig object at 0x7ff37b131a90>> save_on_exit=True>, 'command-history': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename=None name='command-history' save_handler=<bound method LimitLineParser.save of qutebrowser.misc.lineparser.LimitLineParser(binary=False, configdir='/home/yeyito/.runtime/qutebrowser-yeyito/data', fname='cmd-history', limit='completion.cmd_history_max_items')> save_on_exit=False>, 'cookies': <qutebrowser.misc.savemanager.Saveable config_opt='content.cookies.store' dirty=False filename=None name='cookies' save_handler=<bound method CookieJar.save of <qutebrowser.browser.webkit.cookies.CookieJar count=0>> save_on_exit=False>, 'quickmark-manager': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename='/home/yeyito/.runtime/qutebrowser-yeyito/config/quickmarks' name='quickmark-manager' save_handler=<bound method UrlMarkManager.save of <qutebrowser.browser.urlmarks.QuickmarkManager object at 0x7ff324709130>> save_on_exit=False>, 'bookmark-manager': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename='/home/yeyito/.runtime/qutebrowser-yeyito/config/bookmarks/urls' name='bookmark-manager' save_handler=<bound method UrlMarkManager.save of <qutebrowser.browser.urlmarks.BookmarkManager object at 0x7ff324709590>> save_on_exit=False>})>
    <qutebrowser.browser.history.WebHistory length=21816>
        <qutebrowser.browser.history.CompletionHistory object at 0x7ff37aeb67b0>
        <qutebrowser.browser.history.CompletionMetaInfo object at 0x7ff37aeb6850>
    <qutebrowser.browser.webengine.webenginequtescheme.QuteSchemeHandler object at 0x7ff37aeb68f0>
    <qutebrowser.browser.webengine.interceptor.RequestInterceptor object at 0x7ff37aeb6e90>
    <qutebrowser.browser.webengine.webenginedownloads.DownloadManager downloads=0>
    <qutebrowser.misc.sessions.SessionManager object at 0x7ff37af2b890>
    <qutebrowser.browser.webkit.cookies.RAMCookieJar count=0>
    <qutebrowser.browser.qtnetworkdownloads.DownloadManager downloads=0>
        <qutebrowser.browser.webkit.network.networkmanager.NetworkManager object at 0x7ff3643740f0>
    <qutebrowser.browser.webkit.cookies.CookieJar count=0>
        qutebrowser.misc.lineparser.LineParser(binary=True, configdir='/home/yeyito/.runtime/qutebrowser-yeyito/data', fname='cookies')
    <qutebrowser.browser.webkit.cache.DiskCache maxsize=52428800 path='/home/yeyito/.runtime/qutebrowser-yeyito/cache/http/' size=0>
    <qutebrowser.keyinput.eventfilter.EventFilter object at 0x7ff364374190>
    <PyQt6.QtCore.QObject object at 0x7ff2e434d450>
        <PyQt6.QtWidgets.QPanGesture object at 0x7ff2e434d4f0>
        <PyQt6.QtWidgets.QPanGesture object at 0x7ff2e434ce10>
        <PyQt6.QtWidgets.QPanGesture object at 0x7ff2e434d130>
    <qutebrowser.browser.urlmarks.QuickmarkManager object at 0x7ff324709130>
        qutebrowser.misc.lineparser.LineParser(binary=False, configdir='/home/yeyito/.runtime/qutebrowser-yeyito/config', fname='quickmarks')
    <qutebrowser.browser.urlmarks.BookmarkManager object at 0x7ff324709590>
        qutebrowser.misc.lineparser.LineParser(binary=False, configdir='/home/yeyito/.runtime/qutebrowser-yeyito/config', fname='bookmarks/urls')
    <qutebrowser.mainwindow.windowundo.WindowUndoManager object at 0x7ff3247096d0>

global object registry - 11 objects:
    config-commands: <qutebrowser.config.configcommands.ConfigCommands object at 0x7ff37b131400> (for commands only)
    crash-handler: <qutebrowser.misc.crashsignal.CrashHandler object at 0x7ff37ae4c050> (for commands only)
    save-manager: <qutebrowser.misc.savemanager.SaveManager saveables=OrderedDict({'yaml-config': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename=None name='yaml-config' save_handler=<bound method YamlConfig._save of <qutebrowser.config.configfiles.YamlConfig object at 0x7ff37af92df0>> save_on_exit=False>, 'state-config': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename=None name='state-config' save_handler=<bound method StateConfig._save of <qutebrowser.config.configfiles.StateConfig object at 0x7ff37b131a90>> save_on_exit=True>, 'command-history': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename=None name='command-history' save_handler=<bound method LimitLineParser.save of qutebrowser.misc.lineparser.LimitLineParser(binary=False, configdir='/home/yeyito/.runtime/qutebrowser-yeyito/data', fname='cmd-history', limit='completion.cmd_history_max_items')> save_on_exit=False>, 'cookies': <qutebrowser.misc.savemanager.Saveable config_opt='content.cookies.store' dirty=False filename=None name='cookies' save_handler=<bound method CookieJar.save of <qutebrowser.browser.webkit.cookies.CookieJar count=0>> save_on_exit=False>, 'quickmark-manager': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename='/home/yeyito/.runtime/qutebrowser-yeyito/config/quickmarks' name='quickmark-manager' save_handler=<bound method UrlMarkManager.save of <qutebrowser.browser.urlmarks.QuickmarkManager object at 0x7ff324709130>> save_on_exit=False>, 'bookmark-manager': <qutebrowser.misc.savemanager.Saveable config_opt=None dirty=False filename='/home/yeyito/.runtime/qutebrowser-yeyito/config/bookmarks/urls' name='bookmark-manager' save_handler=<bound method UrlMarkManager.save of <qutebrowser.browser.urlmarks.BookmarkManager object at 0x7ff324709590>> save_on_exit=False>})>
    webengine-download-manager: <qutebrowser.browser.webengine.webenginedownloads.DownloadManager downloads=0>
    command-history: qutebrowser.misc.lineparser.LimitLineParser(binary=False, configdir='/home/yeyito/.runtime/qutebrowser-yeyito/data', fname='cmd-history', limit='completion.cmd_history_max_items')
    qtnetwork-download-manager: <qutebrowser.browser.qtnetworkdownloads.DownloadManager downloads=0>
    last-visible-main-window: <qutebrowser.mainwindow.mainwindow.MainWindow>
    quickmark-manager: <qutebrowser.browser.urlmarks.QuickmarkManager object at 0x7ff324709130>
    bookmark-manager: <qutebrowser.browser.urlmarks.BookmarkManager object at 0x7ff324709590>
    macro-recorder: <qutebrowser.keyinput.macros.MacroRecorder object at 0x7ff3642e9a90> (for commands only)
    last-focused-main-window: <qutebrowser.mainwindow.mainwindow.MainWindow>

window-0 object registry - 10 objects:
    main-window: <qutebrowser.mainwindow.mainwindow.MainWindow>
    tab-registry: {0: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=0 url='https://www.youtube.com/watch?v=9dDgUc7CjiE'>, 1: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=1 url='https://www.youtube.com/watch?v=rJt-x-0Jci4'>, 2: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=2 url='https://www.youtube.com/watch?v=6Nru5OQq9O4'>, 3: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=3 url='https://www.youtube.com/watch?v=M2iX6HQOoLg'>, 4: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=4 url='https://www.youtube.com/watch?v=JrTviqq8-sM'>, 5: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=5 url='https://www.youtube.com/watch?v=vV4zUFFnhms'>, 6: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=6 url='https://github.com/Yeyito777#main-content'>, 7: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=7 url='https://www.google.com/search?hl=en&q=BTC to usd'>, 8: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=8 url='https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ'>, 9: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=9 url='https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox'>, 10: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=10 url='https://www.youtube.com/watch?v=4YymJMmY4tQ'>, 11: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=11 url='https://www.youtube.com/watch?v=vV4zUFFnhms'>, 12: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=12 url='https://claude.ai/new'>, 13: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=13 url='https://discord.com/channels/1389428023832608861/1389446484105101352'>, 14: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=14 url='https://dnsimple.com/login?account_id=171315'>, 15: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=15 url='https://www.youtube.com/watch?v=icBDYkfxpMs'>, 16: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=16 url='https://www.youtube.com/watch?v=tKGhxMi50y8'>, 17: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=17 url='file:///home/yeyito/Documents/Academic/cv-aurelio-linero-kittenml.pdf'>, 23: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=23 url='https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Ar…'>, 24: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=24 url='https://kittenml.com/'>, 25: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=25 url='https://www.google.com/search?sca_esv=a36b70f2ee78bb4e&hl=en&sxsrf=ANbL-n4wXe3ULyxMSaeWXnGr1NNiW5iU…'>, 26: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=26 url='https://mail.google.com/mail/u/0/#inbox'>, 27: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=27 url='https://www.google.com/search?hl=en&sca_esv=9be18ee3e64d646c&sxsrf=ANbL-n4fVYy6CkdHc8ky74rkxH-2i-2F…'>, 28: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=28 url='https://claude.ai/chat/7f55a028-ef6f-46c7-85ad-d7e348f5be14'>, 29: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=29 url='https://apply.adm.utoronto.ca/register/questions'>, 30: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=30 url='https://mail.google.com/mail/u/0/#spam/FMfcgzQfBsvSTzLhVzxbxhgLbSvjQsnH'>, 31: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=31 url='https://mail.google.com/mail/u/0/#inbox'>, 32: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=32 url='https://mail.google.com/mail/u/0/#inbox'>, 33: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=33 url='https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob…'>}
    download-model: <qutebrowser.browser.downloads.DownloadModel object at 0x7ff364377390> (for commands only)
    tabbed-browser: <qutebrowser.mainwindow.tabbedbrowser.TabbedBrowser count=29>
    command-dispatcher: <qutebrowser.browser.commands.CommandDispatcher> (for commands only)
    status-command: <qutebrowser.mainwindow.statusbar.command.Command text=''>
    completion: <qutebrowser.completion.completionwidget.CompletionView> (for commands only)
    mode-manager: <qutebrowser.keyinput.modeman.ModeManager mode=<KeyMode.normal: 1>>
    hintmanager: <qutebrowser.browser.hints.HintManager object at 0x7ff364226f30> (for commands only)
    prompt-container: <qutebrowser.mainwindow.prompt.PromptContainer win_id=0> (for commands only)

    tab-0 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=0 url='https://www.youtube.com/watch?v=9dDgUc7CjiE'>

    tab-1 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=1 url='https://www.youtube.com/watch?v=rJt-x-0Jci4'>

    tab-2 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=2 url='https://www.youtube.com/watch?v=6Nru5OQq9O4'>

    tab-3 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=3 url='https://www.youtube.com/watch?v=M2iX6HQOoLg'>

    tab-4 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=4 url='https://www.youtube.com/watch?v=JrTviqq8-sM'>

    tab-5 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=5 url='https://www.youtube.com/watch?v=vV4zUFFnhms'>

    tab-6 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=6 url='https://github.com/Yeyito777#main-content'>

    tab-7 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=7 url='https://www.google.com/search?hl=en&q=BTC to usd'>

    tab-8 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=8 url='https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ'>

    tab-9 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=9 url='https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox'>

    tab-10 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=10 url='https://www.youtube.com/watch?v=4YymJMmY4tQ'>

    tab-11 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=11 url='https://www.youtube.com/watch?v=vV4zUFFnhms'>

    tab-12 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=12 url='https://claude.ai/new'>

    tab-13 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=13 url='https://discord.com/channels/1389428023832608861/1389446484105101352'>

    tab-14 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=14 url='https://dnsimple.com/login?account_id=171315'>

    tab-15 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=15 url='https://www.youtube.com/watch?v=icBDYkfxpMs'>

    tab-16 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=16 url='https://www.youtube.com/watch?v=tKGhxMi50y8'>

    tab-17 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=17 url='file:///home/yeyito/Documents/Academic/cv-aurelio-linero-kittenml.pdf'>

    tab-23 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=23 url='https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Ar…'>

    tab-24 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=24 url='https://kittenml.com/'>

    tab-25 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=25 url='https://www.google.com/search?sca_esv=a36b70f2ee78bb4e&hl=en&sxsrf=ANbL-n4wXe3ULyxMSaeWXnGr1NNiW5iU…'>

    tab-26 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=26 url='https://mail.google.com/mail/u/0/#inbox'>

    tab-27 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=27 url='https://www.google.com/search?hl=en&sca_esv=9be18ee3e64d646c&sxsrf=ANbL-n4fVYy6CkdHc8ky74rkxH-2i-2F…'>

    tab-28 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=28 url='https://claude.ai/chat/7f55a028-ef6f-46c7-85ad-d7e348f5be14'>

    tab-29 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=29 url='https://apply.adm.utoronto.ca/register/questions'>

    tab-30 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=30 url='https://mail.google.com/mail/u/0/#spam/FMfcgzQfBsvSTzLhVzxbxhgLbSvjQsnH'>

    tab-31 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=31 url='https://mail.google.com/mail/u/0/#inbox'>

    tab-32 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=32 url='https://mail.google.com/mail/u/0/#inbox'>

    tab-33 object registry - 1 objects:
        tab: <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=33 url='https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob…'>

==== Debug log ====
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:462] [yt-resume] startForVideo: seek settled but restoredPlaying=false, not signaling
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:338] [yt-resume] restorePosition: seek settled at 38.466353
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:462] [yt-resume] startForVideo: seek settled but restoredPlaying=false, not signaling
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 1 to 'Will this replace the internet? - YouTube'
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://rr2---sn-u1hp55-5c.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 5 to 'Underdog - YouTube'
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://i.ytimg.com/vi/M2iX6HQOoLg/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://rr1---sn-hp57knkl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://rr1---sn-j5caxvoq5-2utk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://i.ytimg.com/vi/JrTviqq8-sM/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://rr1---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://rr5---sn-hp57yns6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://rr5---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://i.ytimg.com/vi/6Nru5OQq9O4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://rr4---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://rr1---sn-hp57knkl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://rr1---sn-hp57knkl.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/vi/4YymJMmY4tQ/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr3---sn-j5caxvoq5-2utk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://rr2---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://i.ytimg.com/vi/icBDYkfxpMs/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://rr3---sn-hp57ynse.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://rr3---sn-hp57kndk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:338] [yt-resume] restorePosition: seek settled at 142.657367
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:462] [yt-resume] startForVideo: seek settled but restoredPlaying=false, not signaling
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=9dDgUc7CjiE), type other, is_main_frame False
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=tKGhxMi50y8), type other, is_main_frame False
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=6Nru5OQq9O4), type other, is_main_frame False
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=JrTviqq8-sM), type other, is_main_frame False
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=vV4zUFFnhms), type other, is_main_frame False
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=4YymJMmY4tQ), type other, is_main_frame False
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=icBDYkfxpMs), type other, is_main_frame False
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=rJt-x-0Jci4), type other, is_main_frame False
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=vV4zUFFnhms), type other, is_main_frame False
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.youtube.com/RotateCookiesPage?origin=https://www.youtube.com&yt_pid=1 (current https://www.youtube.com/watch?v=M2iX6HQOoLg), type other, is_main_frame False
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://a.claude.ai/isolated-segment.html?v=1ae18153c8:56] [IsolatedSegment] Sending iframe_ready message
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 26 to 'claude.ai/chat/7f55a028-ef6f-46c7-85ad-d7e348f5be14'
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://assets-proxy.anthropic.com/claude-ai/v1/_next/static/chunks/webpack-ec071dff9946a7f0.js:1] Uncaught ChunkLoadError: Loading chunk 34219 failed.
(timeout: https://assets-proxy.anthropic.com/claude-ai/v1/_next/static/chunks/app/global-error-2ad048249aa1c660.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://assets-proxy.anthropic.com/claude-ai/v1/_next/static/chunks/webpack-ec071dff9946a7f0.js:1] Uncaught (in promise) ChunkLoadError: Loading chunk 34219 failed.
(timeout: https://assets-proxy.anthropic.com/claude-ai/v1/_next/static/chunks/app/global-error-2ad048249aa1c660.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://assets-proxy.anthropic.com/claude-ai/v1/_next/static/chunks/webpack-ec071dff9946a7f0.js:1] Uncaught ChunkLoadError: Loading chunk 34219 failed.
(timeout: https://assets-proxy.anthropic.com/claude-ai/v1/_next/static/chunks/app/global-error-2ad048249aa1c660.js)
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 12 to 'claude.ai/new'
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://assets-proxy.anthropic.com/claude-ai/v1/_next/static/chunks/webpack-ec071dff9946a7f0.js:1] Uncaught (in promise) ChunkLoadError: Loading chunk 34219 failed.
(timeout: https://assets-proxy.anthropic.com/claude-ai/v1/_next/static/chunks/app/global-error-2ad048249aa1c660.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41927 failed.
(timeout: https://discord.com/assets/93346f188d69eb83.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49681 failed.
(timeout: https://discord.com/assets/d017bd86c9c06760.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 38939 failed.
(timeout: https://discord.com/assets/f8e7c687d8b4cc91.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 18299 failed.
(timeout: https://discord.com/assets/4a0e4ec6a7a51f7b.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94678 failed.
(timeout: https://discord.com/assets/61b556d43e497624.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 896 failed.
(timeout: https://discord.com/assets/2c2b089860f71b87.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 43965 failed.
(timeout: https://discord.com/assets/511e3cb6eb4fef8c.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 42658 failed.
(timeout: https://discord.com/assets/0a28a8e5be337c8a.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 60150 failed.
(timeout: https://discord.com/assets/f0af86f7d67372d0.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 87514 failed.
(timeout: https://discord.com/assets/975141ba97ffd8cb.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3795 failed.
(timeout: https://discord.com/assets/b7852bbb7adbe6aa.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8555 failed.
(timeout: https://discord.com/assets/b4e3a7e6260dd6a4.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28936 failed.
(timeout: https://discord.com/assets/2094d72b5bac8530.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 68859 failed.
(timeout: https://discord.com/assets/717075f282fefaf2.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40396 failed.
(timeout: https://discord.com/assets/b92017ade3c4eaa8.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 13088 failed.
(timeout: https://discord.com/assets/f9ffc69145cc55f5.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48330 failed.
(timeout: https://discord.com/assets/a7645574a3c44995.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 92414 failed.
(timeout: https://discord.com/assets/dddee152718afa2e.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94857 failed.
(timeout: https://discord.com/assets/58817492729a0d7a.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48840 failed.
(timeout: https://discord.com/assets/f557d295a75a00d8.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49559 failed.
(timeout: https://discord.com/assets/750af762459e05bd.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 37372 failed.
(timeout: https://discord.com/assets/89065127bfbc1382.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 99970 failed.
(timeout: https://discord.com/assets/0c4ea465fa6a5151.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41353 failed.
(timeout: https://discord.com/assets/4dc454c6fde6b71d.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 95095 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62175 failed.
(timeout: https://discord.com/assets/6d2d7fed4928e788.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 97283 failed.
(timeout: https://discord.com/assets/eefcfb71d2322823.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28136 failed.
(timeout: https://discord.com/assets/239fe8238a898225.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 53890 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 2292 failed.
(timeout: https://discord.com/assets/d5c940f4d8ad8b65.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8018 failed.
(timeout: https://discord.com/assets/e495799901a9dec2.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 67231 failed.
(timeout: https://discord.com/assets/baf2a8e4d2f28db4.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 24202 failed.
(timeout: https://discord.com/assets/dd4188f306974c50.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41606 failed.
(timeout: https://discord.com/assets/a9cea959fcf0efbb.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84127 failed.
(timeout: https://discord.com/assets/71c27cb1a94607c9.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62733 failed.
(timeout: https://discord.com/assets/5ff23a635e3201e4.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59701 failed.
(timeout: https://discord.com/assets/1aa7464b349bdd7c.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 83518 failed.
(timeout: https://discord.com/assets/6824f810f7e089a9.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93142 failed.
(timeout: https://discord.com/assets/ed448410af9900c7.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 69733 failed.
(timeout: https://discord.com/assets/fdc7c37cf8119705.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 86713 failed.
(timeout: https://discord.com/assets/9858ceb95aa7d0d4.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49546 failed.
(timeout: https://discord.com/assets/1af6abb5b23a8da8.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 17537 failed.
(timeout: https://discord.com/assets/427cff500a54ebec.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64190 failed.
(timeout: https://discord.com/assets/13987276ecda2702.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 57009 failed.
(timeout: https://discord.com/assets/79617bdec4ba9f5c.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34749 failed.
(timeout: https://discord.com/assets/b597a46b784a3ebd.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 12664 failed.
(timeout: https://discord.com/assets/9ae8a8fd6dc76f9c.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27753 failed.
(timeout: https://discord.com/assets/402da7a1961a3ca1.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 44667 failed.
(timeout: https://discord.com/assets/2ea6a96418441d34.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 21420 failed.
(timeout: https://discord.com/assets/f94e980f217097fc.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 55090 failed.
(timeout: https://discord.com/assets/9add533e12709b2a.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7803 failed.
(timeout: https://discord.com/assets/4cf8db1c79df5d9a.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84704 failed.
(timeout: https://discord.com/assets/cc50cb0b842c4d85.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 54041 failed.
(timeout: https://discord.com/assets/326660c5313d55b0.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 77374 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 33105 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 79208 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 56475 failed.
(timeout: https://discord.com/assets/981c2e05da97040a.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59541 failed.
(timeout: https://discord.com/assets/5f4ce5f6e66f07a6.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40198 failed.
(timeout: https://discord.com/assets/b56f114918522599.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 35432 failed.
(timeout: https://discord.com/assets/27959bb565226966.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 10117 failed.
(timeout: https://discord.com/assets/906f112281b60e57.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 5873 failed.
(timeout: https://discord.com/assets/c9275b524f6f7743.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 66255 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 1636 failed.
(timeout: https://discord.com/assets/c630659468be9b32.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64719 failed.
(timeout: https://discord.com/assets/0a927c35affc42da.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59646 failed.
(timeout: https://discord.com/assets/8c9e728968a50b4f.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 95782 failed.
(timeout: https://discord.com/assets/f13c8aeb7c33509f.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 4787 failed.
(timeout: https://discord.com/assets/c4072dedf040884d.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 33563 failed.
(timeout: https://discord.com/assets/c4977b054c2572b9.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93612 failed.
(timeout: https://discord.com/assets/60b4550fbb3ccf50.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 51024 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 30485 failed.
(timeout: https://discord.com/assets/363c7a0577427ff1.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 2034 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62381 failed.
(timeout: https://discord.com/assets/2caa17408b759686.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 46121 failed.
(timeout: https://discord.com/assets/e6a8fb0706bf13c9.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 45672 failed.
(timeout: https://discord.com/assets/a7f3f53d4ae74f89.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 58801 failed.
(timeout: https://discord.com/assets/e0c7e060e1ab1c27.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7602 failed.
(timeout: https://discord.com/assets/69a9ec380004afce.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 52694 failed.
(timeout: https://discord.com/assets/3413bdcfe8b546d6.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34160 failed.
(timeout: https://discord.com/assets/1166b793ed13d36b.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3039 failed.
(timeout: https://discord.com/assets/6b8f0c168d2245e2.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 3857 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 43 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27482 failed.
(timeout: https://discord.com/assets/ace78a5802687f6b.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 28636 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7525 failed.
(timeout: https://discord.com/assets/ddfa62c7b0592fbc.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 71853 failed.
(timeout: https://discord.com/assets/7f03d44ac5d841c6.js)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 21738 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 99063 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41927 failed.
(timeout: https://discord.com/assets/93346f188d69eb83.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49681 failed.
(timeout: https://discord.com/assets/d017bd86c9c06760.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 38939 failed.
(timeout: https://discord.com/assets/f8e7c687d8b4cc91.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 18299 failed.
(timeout: https://discord.com/assets/4a0e4ec6a7a51f7b.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94678 failed.
(timeout: https://discord.com/assets/61b556d43e497624.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 896 failed.
(timeout: https://discord.com/assets/2c2b089860f71b87.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 43965 failed.
(timeout: https://discord.com/assets/511e3cb6eb4fef8c.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 42658 failed.
(timeout: https://discord.com/assets/0a28a8e5be337c8a.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 60150 failed.
(timeout: https://discord.com/assets/f0af86f7d67372d0.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 87514 failed.
(timeout: https://discord.com/assets/975141ba97ffd8cb.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3795 failed.
(timeout: https://discord.com/assets/b7852bbb7adbe6aa.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8555 failed.
(timeout: https://discord.com/assets/b4e3a7e6260dd6a4.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28936 failed.
(timeout: https://discord.com/assets/2094d72b5bac8530.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 68859 failed.
(timeout: https://discord.com/assets/717075f282fefaf2.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40396 failed.
(timeout: https://discord.com/assets/b92017ade3c4eaa8.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 13088 failed.
(timeout: https://discord.com/assets/f9ffc69145cc55f5.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48330 failed.
(timeout: https://discord.com/assets/a7645574a3c44995.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 92414 failed.
(timeout: https://discord.com/assets/dddee152718afa2e.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94857 failed.
(timeout: https://discord.com/assets/58817492729a0d7a.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48840 failed.
(timeout: https://discord.com/assets/f557d295a75a00d8.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49559 failed.
(timeout: https://discord.com/assets/750af762459e05bd.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 37372 failed.
(timeout: https://discord.com/assets/89065127bfbc1382.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 99970 failed.
(timeout: https://discord.com/assets/0c4ea465fa6a5151.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41353 failed.
(timeout: https://discord.com/assets/4dc454c6fde6b71d.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 95095 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62175 failed.
(timeout: https://discord.com/assets/6d2d7fed4928e788.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 97283 failed.
(timeout: https://discord.com/assets/eefcfb71d2322823.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28136 failed.
(timeout: https://discord.com/assets/239fe8238a898225.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 53890 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 2292 failed.
(timeout: https://discord.com/assets/d5c940f4d8ad8b65.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8018 failed.
(timeout: https://discord.com/assets/e495799901a9dec2.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 67231 failed.
(timeout: https://discord.com/assets/baf2a8e4d2f28db4.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 24202 failed.
(timeout: https://discord.com/assets/dd4188f306974c50.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41606 failed.
(timeout: https://discord.com/assets/a9cea959fcf0efbb.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84127 failed.
(timeout: https://discord.com/assets/71c27cb1a94607c9.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62733 failed.
(timeout: https://discord.com/assets/5ff23a635e3201e4.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59701 failed.
(timeout: https://discord.com/assets/1aa7464b349bdd7c.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 83518 failed.
(timeout: https://discord.com/assets/6824f810f7e089a9.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93142 failed.
(timeout: https://discord.com/assets/ed448410af9900c7.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 69733 failed.
(timeout: https://discord.com/assets/fdc7c37cf8119705.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 86713 failed.
(timeout: https://discord.com/assets/9858ceb95aa7d0d4.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49546 failed.
(timeout: https://discord.com/assets/1af6abb5b23a8da8.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 17537 failed.
(timeout: https://discord.com/assets/427cff500a54ebec.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64190 failed.
(timeout: https://discord.com/assets/13987276ecda2702.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 57009 failed.
(timeout: https://discord.com/assets/79617bdec4ba9f5c.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34749 failed.
(timeout: https://discord.com/assets/b597a46b784a3ebd.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 12664 failed.
(timeout: https://discord.com/assets/9ae8a8fd6dc76f9c.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27753 failed.
(timeout: https://discord.com/assets/402da7a1961a3ca1.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 44667 failed.
(timeout: https://discord.com/assets/2ea6a96418441d34.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 21420 failed.
(timeout: https://discord.com/assets/f94e980f217097fc.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 55090 failed.
(timeout: https://discord.com/assets/9add533e12709b2a.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7803 failed.
(timeout: https://discord.com/assets/4cf8db1c79df5d9a.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84704 failed.
(timeout: https://discord.com/assets/cc50cb0b842c4d85.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 54041 failed.
(timeout: https://discord.com/assets/326660c5313d55b0.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 77374 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 33105 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 79208 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 56475 failed.
(timeout: https://discord.com/assets/981c2e05da97040a.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59541 failed.
(timeout: https://discord.com/assets/5f4ce5f6e66f07a6.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40198 failed.
(timeout: https://discord.com/assets/b56f114918522599.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 35432 failed.
(timeout: https://discord.com/assets/27959bb565226966.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 10117 failed.
(timeout: https://discord.com/assets/906f112281b60e57.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 5873 failed.
(timeout: https://discord.com/assets/c9275b524f6f7743.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 66255 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 1636 failed.
(timeout: https://discord.com/assets/c630659468be9b32.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64719 failed.
(timeout: https://discord.com/assets/0a927c35affc42da.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59646 failed.
(timeout: https://discord.com/assets/8c9e728968a50b4f.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 95782 failed.
(timeout: https://discord.com/assets/f13c8aeb7c33509f.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 4787 failed.
(timeout: https://discord.com/assets/c4072dedf040884d.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 33563 failed.
(timeout: https://discord.com/assets/c4977b054c2572b9.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93612 failed.
(timeout: https://discord.com/assets/60b4550fbb3ccf50.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 51024 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 30485 failed.
(timeout: https://discord.com/assets/363c7a0577427ff1.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 2034 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62381 failed.
(timeout: https://discord.com/assets/2caa17408b759686.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 46121 failed.
(timeout: https://discord.com/assets/e6a8fb0706bf13c9.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 45672 failed.
(timeout: https://discord.com/assets/a7f3f53d4ae74f89.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 58801 failed.
(timeout: https://discord.com/assets/e0c7e060e1ab1c27.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7602 failed.
(timeout: https://discord.com/assets/69a9ec380004afce.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 52694 failed.
(timeout: https://discord.com/assets/3413bdcfe8b546d6.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34160 failed.
(timeout: https://discord.com/assets/1166b793ed13d36b.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3039 failed.
(timeout: https://discord.com/assets/6b8f0c168d2245e2.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 3857 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 43 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27482 failed.
(timeout: https://discord.com/assets/ace78a5802687f6b.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 28636 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7525 failed.
(timeout: https://discord.com/assets/ddfa62c7b0592fbc.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 71853 failed.
(timeout: https://discord.com/assets/7f03d44ac5d841c6.js?error=true&r=1)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 21738 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 99063 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.google.com/RotateCookiesPage?og_pid=23&rot=3&origin=https%3A%2F%2Fmail.google.com&… (current https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ), type other, is_main_frame False
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://ogs.google.com/u/0/widget/app?awwd=1&gpa=3&em=2&scv=1&dpi=70251319&origin=https%3A%2F%2Fmai… (current https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ), type other, is_main_frame False
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41927 failed.
(timeout: https://discord.com/assets/93346f188d69eb83.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49681 failed.
(timeout: https://discord.com/assets/d017bd86c9c06760.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 38939 failed.
(timeout: https://discord.com/assets/f8e7c687d8b4cc91.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 18299 failed.
(timeout: https://discord.com/assets/4a0e4ec6a7a51f7b.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94678 failed.
(timeout: https://discord.com/assets/61b556d43e497624.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 896 failed.
(timeout: https://discord.com/assets/2c2b089860f71b87.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 43965 failed.
(timeout: https://discord.com/assets/511e3cb6eb4fef8c.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 42658 failed.
(timeout: https://discord.com/assets/0a28a8e5be337c8a.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 60150 failed.
(timeout: https://discord.com/assets/f0af86f7d67372d0.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 87514 failed.
(timeout: https://discord.com/assets/975141ba97ffd8cb.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3795 failed.
(timeout: https://discord.com/assets/b7852bbb7adbe6aa.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8555 failed.
(timeout: https://discord.com/assets/b4e3a7e6260dd6a4.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28936 failed.
(timeout: https://discord.com/assets/2094d72b5bac8530.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 68859 failed.
(timeout: https://discord.com/assets/717075f282fefaf2.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40396 failed.
(timeout: https://discord.com/assets/b92017ade3c4eaa8.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 13088 failed.
(timeout: https://discord.com/assets/f9ffc69145cc55f5.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48330 failed.
(timeout: https://discord.com/assets/a7645574a3c44995.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 92414 failed.
(timeout: https://discord.com/assets/dddee152718afa2e.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94857 failed.
(timeout: https://discord.com/assets/58817492729a0d7a.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48840 failed.
(timeout: https://discord.com/assets/f557d295a75a00d8.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49559 failed.
(timeout: https://discord.com/assets/750af762459e05bd.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 37372 failed.
(timeout: https://discord.com/assets/89065127bfbc1382.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 99970 failed.
(timeout: https://discord.com/assets/0c4ea465fa6a5151.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41353 failed.
(timeout: https://discord.com/assets/4dc454c6fde6b71d.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 95095 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62175 failed.
(timeout: https://discord.com/assets/6d2d7fed4928e788.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 97283 failed.
(timeout: https://discord.com/assets/eefcfb71d2322823.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28136 failed.
(timeout: https://discord.com/assets/239fe8238a898225.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 53890 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 2292 failed.
(timeout: https://discord.com/assets/d5c940f4d8ad8b65.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8018 failed.
(timeout: https://discord.com/assets/e495799901a9dec2.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 67231 failed.
(timeout: https://discord.com/assets/baf2a8e4d2f28db4.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 24202 failed.
(timeout: https://discord.com/assets/dd4188f306974c50.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41606 failed.
(timeout: https://discord.com/assets/a9cea959fcf0efbb.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84127 failed.
(timeout: https://discord.com/assets/71c27cb1a94607c9.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62733 failed.
(timeout: https://discord.com/assets/5ff23a635e3201e4.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59701 failed.
(timeout: https://discord.com/assets/1aa7464b349bdd7c.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 83518 failed.
(timeout: https://discord.com/assets/6824f810f7e089a9.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93142 failed.
(timeout: https://discord.com/assets/ed448410af9900c7.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 69733 failed.
(timeout: https://discord.com/assets/fdc7c37cf8119705.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 86713 failed.
(timeout: https://discord.com/assets/9858ceb95aa7d0d4.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49546 failed.
(timeout: https://discord.com/assets/1af6abb5b23a8da8.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 17537 failed.
(timeout: https://discord.com/assets/427cff500a54ebec.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64190 failed.
(timeout: https://discord.com/assets/13987276ecda2702.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 57009 failed.
(timeout: https://discord.com/assets/79617bdec4ba9f5c.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34749 failed.
(timeout: https://discord.com/assets/b597a46b784a3ebd.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 12664 failed.
(timeout: https://discord.com/assets/9ae8a8fd6dc76f9c.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27753 failed.
(timeout: https://discord.com/assets/402da7a1961a3ca1.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 44667 failed.
(timeout: https://discord.com/assets/2ea6a96418441d34.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 21420 failed.
(timeout: https://discord.com/assets/f94e980f217097fc.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 55090 failed.
(timeout: https://discord.com/assets/9add533e12709b2a.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7803 failed.
(timeout: https://discord.com/assets/4cf8db1c79df5d9a.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84704 failed.
(timeout: https://discord.com/assets/cc50cb0b842c4d85.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 54041 failed.
(timeout: https://discord.com/assets/326660c5313d55b0.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 77374 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 33105 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 79208 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 56475 failed.
(timeout: https://discord.com/assets/981c2e05da97040a.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59541 failed.
(timeout: https://discord.com/assets/5f4ce5f6e66f07a6.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40198 failed.
(timeout: https://discord.com/assets/b56f114918522599.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 35432 failed.
(timeout: https://discord.com/assets/27959bb565226966.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 10117 failed.
(timeout: https://discord.com/assets/906f112281b60e57.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 5873 failed.
(timeout: https://discord.com/assets/c9275b524f6f7743.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 66255 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 1636 failed.
(timeout: https://discord.com/assets/c630659468be9b32.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64719 failed.
(timeout: https://discord.com/assets/0a927c35affc42da.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59646 failed.
(timeout: https://discord.com/assets/8c9e728968a50b4f.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 95782 failed.
(timeout: https://discord.com/assets/f13c8aeb7c33509f.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 4787 failed.
(timeout: https://discord.com/assets/c4072dedf040884d.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 33563 failed.
(timeout: https://discord.com/assets/c4977b054c2572b9.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93612 failed.
(timeout: https://discord.com/assets/60b4550fbb3ccf50.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 51024 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 30485 failed.
(timeout: https://discord.com/assets/363c7a0577427ff1.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 2034 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62381 failed.
(timeout: https://discord.com/assets/2caa17408b759686.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 46121 failed.
(timeout: https://discord.com/assets/e6a8fb0706bf13c9.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 45672 failed.
(timeout: https://discord.com/assets/a7f3f53d4ae74f89.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 58801 failed.
(timeout: https://discord.com/assets/e0c7e060e1ab1c27.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7602 failed.
(timeout: https://discord.com/assets/69a9ec380004afce.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 52694 failed.
(timeout: https://discord.com/assets/3413bdcfe8b546d6.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34160 failed.
(timeout: https://discord.com/assets/1166b793ed13d36b.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3039 failed.
(timeout: https://discord.com/assets/6b8f0c168d2245e2.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 3857 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 43 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27482 failed.
(timeout: https://discord.com/assets/ace78a5802687f6b.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 28636 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7525 failed.
(timeout: https://discord.com/assets/ddfa62c7b0592fbc.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 71853 failed.
(timeout: https://discord.com/assets/7f03d44ac5d841c6.js?error=true&r=2)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 21738 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 99063 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://github.githubassets.com/assets/wp-runtime-571f504d8e30c577.js:2] Uncaught (in promise) ChunkLoadError: Loading chunk 1631 failed after 3 retries.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://github.githubassets.com/assets/wp-runtime-571f504d8e30c577.js:2] Uncaught (in promise) ChunkLoadError: Loading chunk 86089 failed after 3 retries.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] ChunkLoadError: Loading chunk 41927 failed after 3 retries.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41927 failed.
(timeout: https://discord.com/assets/93346f188d69eb83.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49681 failed.
(timeout: https://discord.com/assets/d017bd86c9c06760.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 38939 failed.
(timeout: https://discord.com/assets/f8e7c687d8b4cc91.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 18299 failed.
(timeout: https://discord.com/assets/4a0e4ec6a7a51f7b.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94678 failed.
(timeout: https://discord.com/assets/61b556d43e497624.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 896 failed.
(timeout: https://discord.com/assets/2c2b089860f71b87.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 43965 failed.
(timeout: https://discord.com/assets/511e3cb6eb4fef8c.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 42658 failed.
(timeout: https://discord.com/assets/0a28a8e5be337c8a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 60150 failed.
(timeout: https://discord.com/assets/f0af86f7d67372d0.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 87514 failed.
(timeout: https://discord.com/assets/975141ba97ffd8cb.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3795 failed.
(timeout: https://discord.com/assets/b7852bbb7adbe6aa.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8555 failed.
(timeout: https://discord.com/assets/b4e3a7e6260dd6a4.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28936 failed.
(timeout: https://discord.com/assets/2094d72b5bac8530.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 68859 failed.
(timeout: https://discord.com/assets/717075f282fefaf2.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40396 failed.
(timeout: https://discord.com/assets/b92017ade3c4eaa8.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 13088 failed.
(timeout: https://discord.com/assets/f9ffc69145cc55f5.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48330 failed.
(timeout: https://discord.com/assets/a7645574a3c44995.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 92414 failed.
(timeout: https://discord.com/assets/dddee152718afa2e.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94857 failed.
(timeout: https://discord.com/assets/58817492729a0d7a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48840 failed.
(timeout: https://discord.com/assets/f557d295a75a00d8.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49559 failed.
(timeout: https://discord.com/assets/750af762459e05bd.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 37372 failed.
(timeout: https://discord.com/assets/89065127bfbc1382.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://github.githubassets.com/assets/wp-runtime-571f504d8e30c577.js:2] Uncaught (in promise) ChunkLoadError: Loading chunk 23276 failed after 3 retries.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 99970 failed.
(timeout: https://discord.com/assets/0c4ea465fa6a5151.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41353 failed.
(timeout: https://discord.com/assets/4dc454c6fde6b71d.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 95095 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62175 failed.
(timeout: https://discord.com/assets/6d2d7fed4928e788.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://github.githubassets.com/assets/wp-runtime-571f504d8e30c577.js:2] Uncaught (in promise) ChunkLoadError: Loading chunk 1631 failed after 3 retries.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 97283 failed.
(timeout: https://discord.com/assets/eefcfb71d2322823.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28136 failed.
(timeout: https://discord.com/assets/239fe8238a898225.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 53890 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 2292 failed.
(timeout: https://discord.com/assets/d5c940f4d8ad8b65.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8018 failed.
(timeout: https://discord.com/assets/e495799901a9dec2.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 67231 failed.
(timeout: https://discord.com/assets/baf2a8e4d2f28db4.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 24202 failed.
(timeout: https://discord.com/assets/dd4188f306974c50.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41606 failed.
(timeout: https://discord.com/assets/a9cea959fcf0efbb.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84127 failed.
(timeout: https://discord.com/assets/71c27cb1a94607c9.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62733 failed.
(timeout: https://discord.com/assets/5ff23a635e3201e4.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59701 failed.
(timeout: https://discord.com/assets/1aa7464b349bdd7c.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 83518 failed.
(timeout: https://discord.com/assets/6824f810f7e089a9.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93142 failed.
(timeout: https://discord.com/assets/ed448410af9900c7.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 69733 failed.
(timeout: https://discord.com/assets/fdc7c37cf8119705.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] ChunkLoadError: Loading chunk 99063 failed after 3 retries.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 86713 failed.
(timeout: https://discord.com/assets/9858ceb95aa7d0d4.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49546 failed.
(timeout: https://discord.com/assets/1af6abb5b23a8da8.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 17537 failed.
(timeout: https://discord.com/assets/427cff500a54ebec.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64190 failed.
(timeout: https://discord.com/assets/13987276ecda2702.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 57009 failed.
(timeout: https://discord.com/assets/79617bdec4ba9f5c.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34749 failed.
(timeout: https://discord.com/assets/b597a46b784a3ebd.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 12664 failed.
(timeout: https://discord.com/assets/9ae8a8fd6dc76f9c.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27753 failed.
(timeout: https://discord.com/assets/402da7a1961a3ca1.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 44667 failed.
(timeout: https://discord.com/assets/2ea6a96418441d34.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 21420 failed.
(timeout: https://discord.com/assets/f94e980f217097fc.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 55090 failed.
(timeout: https://discord.com/assets/9add533e12709b2a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7803 failed.
(timeout: https://discord.com/assets/4cf8db1c79df5d9a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84704 failed.
(timeout: https://discord.com/assets/cc50cb0b842c4d85.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 54041 failed.
(timeout: https://discord.com/assets/326660c5313d55b0.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 77374 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 33105 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 79208 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 56475 failed.
(timeout: https://discord.com/assets/981c2e05da97040a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59541 failed.
(timeout: https://discord.com/assets/5f4ce5f6e66f07a6.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40198 failed.
(timeout: https://discord.com/assets/b56f114918522599.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 35432 failed.
(timeout: https://discord.com/assets/27959bb565226966.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 10117 failed.
(timeout: https://discord.com/assets/906f112281b60e57.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 5873 failed.
(timeout: https://discord.com/assets/c9275b524f6f7743.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 66255 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 1636 failed.
(timeout: https://discord.com/assets/c630659468be9b32.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64719 failed.
(timeout: https://discord.com/assets/0a927c35affc42da.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59646 failed.
(timeout: https://discord.com/assets/8c9e728968a50b4f.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 95782 failed.
(timeout: https://discord.com/assets/f13c8aeb7c33509f.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 4787 failed.
(timeout: https://discord.com/assets/c4072dedf040884d.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 33563 failed.
(timeout: https://discord.com/assets/c4977b054c2572b9.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93612 failed.
(timeout: https://discord.com/assets/60b4550fbb3ccf50.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 51024 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 30485 failed.
(timeout: https://discord.com/assets/363c7a0577427ff1.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 2034 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62381 failed.
(timeout: https://discord.com/assets/2caa17408b759686.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 46121 failed.
(timeout: https://discord.com/assets/e6a8fb0706bf13c9.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 45672 failed.
(timeout: https://discord.com/assets/a7f3f53d4ae74f89.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 58801 failed.
(timeout: https://discord.com/assets/e0c7e060e1ab1c27.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7602 failed.
(timeout: https://discord.com/assets/69a9ec380004afce.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 52694 failed.
(timeout: https://discord.com/assets/3413bdcfe8b546d6.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34160 failed.
(timeout: https://discord.com/assets/1166b793ed13d36b.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3039 failed.
(timeout: https://discord.com/assets/6b8f0c168d2245e2.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 3857 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 43 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27482 failed.
(timeout: https://discord.com/assets/ace78a5802687f6b.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 28636 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7525 failed.
(timeout: https://discord.com/assets/ddfa62c7b0592fbc.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 71853 failed.
(timeout: https://discord.com/assets/7f03d44ac5d841c6.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 21738 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 99063 failed.
(timeout: undefined)
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://dnsimple.com/login?account_id=171315 (current https://dnsimple.com/login?account_id=171315), type reload, is_main_frame True
05:39:02 DEBUG    webview    webenginetab:_on_find_finished:212 Active search match: 0/0
05:39:02 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_search_match_changed(SearchMatch(current=0, total=0)) (tab 14)
05:39:02 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=14 url='https://dnsimple.com/login?account_id=171315'>: LoadStatus.loading
05:39:02 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.loading: 6>) (tab 14)
05:39:02 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_started() (tab 14)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] ChunkLoadError: Loading chunk 41927 failed after 3 retries.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41927 failed.
(timeout: https://discord.com/assets/93346f188d69eb83.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49681 failed.
(timeout: https://discord.com/assets/d017bd86c9c06760.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 38939 failed.
(timeout: https://discord.com/assets/f8e7c687d8b4cc91.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 18299 failed.
(timeout: https://discord.com/assets/4a0e4ec6a7a51f7b.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94678 failed.
(timeout: https://discord.com/assets/61b556d43e497624.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 896 failed.
(timeout: https://discord.com/assets/2c2b089860f71b87.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 43965 failed.
(timeout: https://discord.com/assets/511e3cb6eb4fef8c.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 42658 failed.
(timeout: https://discord.com/assets/0a28a8e5be337c8a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 60150 failed.
(timeout: https://discord.com/assets/f0af86f7d67372d0.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 87514 failed.
(timeout: https://discord.com/assets/975141ba97ffd8cb.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3795 failed.
(timeout: https://discord.com/assets/b7852bbb7adbe6aa.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8555 failed.
(timeout: https://discord.com/assets/b4e3a7e6260dd6a4.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28936 failed.
(timeout: https://discord.com/assets/2094d72b5bac8530.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 68859 failed.
(timeout: https://discord.com/assets/717075f282fefaf2.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40396 failed.
(timeout: https://discord.com/assets/b92017ade3c4eaa8.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 13088 failed.
(timeout: https://discord.com/assets/f9ffc69145cc55f5.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48330 failed.
(timeout: https://discord.com/assets/a7645574a3c44995.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 92414 failed.
(timeout: https://discord.com/assets/dddee152718afa2e.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 94857 failed.
(timeout: https://discord.com/assets/58817492729a0d7a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 48840 failed.
(timeout: https://discord.com/assets/f557d295a75a00d8.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49559 failed.
(timeout: https://discord.com/assets/750af762459e05bd.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 37372 failed.
(timeout: https://discord.com/assets/89065127bfbc1382.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 99970 failed.
(timeout: https://discord.com/assets/0c4ea465fa6a5151.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41353 failed.
(timeout: https://discord.com/assets/4dc454c6fde6b71d.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 95095 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62175 failed.
(timeout: https://discord.com/assets/6d2d7fed4928e788.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 97283 failed.
(timeout: https://discord.com/assets/eefcfb71d2322823.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 28136 failed.
(timeout: https://discord.com/assets/239fe8238a898225.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 53890 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 2292 failed.
(timeout: https://discord.com/assets/d5c940f4d8ad8b65.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 8018 failed.
(timeout: https://discord.com/assets/e495799901a9dec2.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 67231 failed.
(timeout: https://discord.com/assets/baf2a8e4d2f28db4.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 24202 failed.
(timeout: https://discord.com/assets/dd4188f306974c50.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 41606 failed.
(timeout: https://discord.com/assets/a9cea959fcf0efbb.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84127 failed.
(timeout: https://discord.com/assets/71c27cb1a94607c9.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62733 failed.
(timeout: https://discord.com/assets/5ff23a635e3201e4.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59701 failed.
(timeout: https://discord.com/assets/1aa7464b349bdd7c.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 83518 failed.
(timeout: https://discord.com/assets/6824f810f7e089a9.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93142 failed.
(timeout: https://discord.com/assets/ed448410af9900c7.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 69733 failed.
(timeout: https://discord.com/assets/fdc7c37cf8119705.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 86713 failed.
(timeout: https://discord.com/assets/9858ceb95aa7d0d4.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 49546 failed.
(timeout: https://discord.com/assets/1af6abb5b23a8da8.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 17537 failed.
(timeout: https://discord.com/assets/427cff500a54ebec.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64190 failed.
(timeout: https://discord.com/assets/13987276ecda2702.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 57009 failed.
(timeout: https://discord.com/assets/79617bdec4ba9f5c.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34749 failed.
(timeout: https://discord.com/assets/b597a46b784a3ebd.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 12664 failed.
(timeout: https://discord.com/assets/9ae8a8fd6dc76f9c.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27753 failed.
(timeout: https://discord.com/assets/402da7a1961a3ca1.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 44667 failed.
(timeout: https://discord.com/assets/2ea6a96418441d34.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 21420 failed.
(timeout: https://discord.com/assets/f94e980f217097fc.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 55090 failed.
(timeout: https://discord.com/assets/9add533e12709b2a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7803 failed.
(timeout: https://discord.com/assets/4cf8db1c79df5d9a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 84704 failed.
(timeout: https://discord.com/assets/cc50cb0b842c4d85.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 54041 failed.
(timeout: https://discord.com/assets/326660c5313d55b0.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 77374 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 33105 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 79208 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 56475 failed.
(timeout: https://discord.com/assets/981c2e05da97040a.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59541 failed.
(timeout: https://discord.com/assets/5f4ce5f6e66f07a6.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 40198 failed.
(timeout: https://discord.com/assets/b56f114918522599.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 35432 failed.
(timeout: https://discord.com/assets/27959bb565226966.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 10117 failed.
(timeout: https://discord.com/assets/906f112281b60e57.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 5873 failed.
(timeout: https://discord.com/assets/c9275b524f6f7743.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 66255 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 1636 failed.
(timeout: https://discord.com/assets/c630659468be9b32.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 64719 failed.
(timeout: https://discord.com/assets/0a927c35affc42da.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 59646 failed.
(timeout: https://discord.com/assets/8c9e728968a50b4f.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 95782 failed.
(timeout: https://discord.com/assets/f13c8aeb7c33509f.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 4787 failed.
(timeout: https://discord.com/assets/c4072dedf040884d.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 33563 failed.
(timeout: https://discord.com/assets/c4977b054c2572b9.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 93612 failed.
(timeout: https://discord.com/assets/60b4550fbb3ccf50.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 51024 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 30485 failed.
(timeout: https://discord.com/assets/363c7a0577427ff1.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 2034 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 62381 failed.
(timeout: https://discord.com/assets/2caa17408b759686.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 46121 failed.
(timeout: https://discord.com/assets/e6a8fb0706bf13c9.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 45672 failed.
(timeout: https://discord.com/assets/a7f3f53d4ae74f89.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 58801 failed.
(timeout: https://discord.com/assets/e0c7e060e1ab1c27.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7602 failed.
(timeout: https://discord.com/assets/69a9ec380004afce.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 52694 failed.
(timeout: https://discord.com/assets/3413bdcfe8b546d6.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 34160 failed.
(timeout: https://discord.com/assets/1166b793ed13d36b.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 3039 failed.
(timeout: https://discord.com/assets/6b8f0c168d2245e2.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 3857 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 43 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 27482 failed.
(timeout: https://discord.com/assets/ace78a5802687f6b.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 28636 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 7525 failed.
(timeout: https://discord.com/assets/ddfa62c7b0592fbc.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading chunk 71853 failed.
(timeout: https://discord.com/assets/7f03d44ac5d841c6.js?error=true&r=3)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 21738 failed.
(timeout: undefined)
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] ChunkLoadError: Loading chunk 99063 failed after 3 retries.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/web.e33b617fc9bf2b61.js:149] Uncaught (in promise) ChunkLoadError: Loading css chunk 99063 failed.
(timeout: undefined)
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to static.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to static.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to static.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to static.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to static.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to static.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to static.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to static.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    network    hostblock:filter_request:137 Request to googleads.g.doubleclick.net blocked by host blocker.
05:39:02 DEBUG    js         shared:javascript_log_message:206 [https://github.com/Yeyito777:0] Some resource load requests were throttled while the tab was in background, and no request was sent from the queue in the last 1 minute. This means previously requested in-flight requests haven't received any response from servers. See https://www.chromestatus.com/feature/5527160148197376 for more details
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.google.com/RotateCookiesPage?og_pid=23&rot=3&origin=https%3A%2F%2Fmail.google.com&… (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:02 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://ogs.google.com/u/0/widget/app?awwd=1&gpa=3&em=2&scv=1&dpi=70251319&origin=https%3A%2F%2Fmai… (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:02 DEBUG    misc       eventfilter:eventFilter:45 <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff3001049b0> got new child <PyQt6.QtWidgets.QWidget object at 0x7ff2d7b57f70, className='QQuickWidget'>, installing filter
05:39:02 DEBUG    webview    webenginetab:_on_renderer_process_pid_changed:1583 Renderer process PID for tab 30: 1041958
05:39:02 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/from%3Adnsimple')) (tab 15)
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 15 to 'mail.google.com/mail/u/0/#search/from%3Adnsimple'
05:39:02 DEBUG    misc       eventfilter:eventFilter:45 <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff300127a70> got new child <PyQt6.QtWidgets.QWidget object at 0x7ff2d7b70b90, className='QQuickWidget'>, installing filter
05:39:02 DEBUG    webview    webenginetab:_on_renderer_process_pid_changed:1583 Renderer process PID for tab 31: 1041970
05:39:02 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/')) (tab 16)
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 16 to 'mail.google.com/mail/u/0/'
05:39:02 DEBUG    misc       eventfilter:eventFilter:45 <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff30014e8f0> got new child <PyQt6.QtWidgets.QWidget object at 0x7ff2d7b79310, className='QQuickWidget'>, installing filter
05:39:02 DEBUG    webview    webenginetab:_on_renderer_process_pid_changed:1583 Renderer process PID for tab 32: 1041988
05:39:02 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/')) (tab 17)
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 17 to 'mail.google.com/mail/u/0/'
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 15 to 'Gmail'
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 16 to 'Gmail'
05:39:02 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 17 to 'Gmail'
05:39:03 DEBUG    misc       eventfilter:eventFilter:83 <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff3001049b0>: removed child <PyQt6.QtCore.QObject object at 0x7ff2d7be7930>
05:39:03 DEBUG    misc       eventfilter:eventFilter:83 <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff300127a70>: removed child <PyQt6.QtCore.QObject object at 0x7ff2d7be7930>
05:39:03 DEBUG    misc       eventfilter:eventFilter:83 <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff30014e8f0>: removed child <PyQt6.QtCore.QObject object at 0x7ff2d7be7930>
05:39:03 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/u/0/data?sw=2&token=%5B%22cftp%22,%22df7b34bbe2%22,%22gmail.pinto-serv… (current https://mail.google.com/mail/u/0/#search/from%3Adnsimple), type other, is_main_frame False
05:39:03 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/u/0/data?sw=2&token=%5B%22cftp%22,%22df7b34bbe2%22,%22gmail.pinto-serv… (current https://mail.google.com/mail/u/0/), type other, is_main_frame False
05:39:03 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/u/0/data?sw=2&token=%5B%22cftp%22,%22df7b34bbe2%22,%22gmail.pinto-serv… (current https://mail.google.com/mail/u/0/), type other, is_main_frame False
05:39:05 DEBUG    js         shared:javascript_log_message:206 [https://mail.google.com/mail/u/0/data?sw=2&token=%5B%22cftp%22,%22df7b34bbe2%22,%22gmail.pinto-server_20260225.03_p1%22,%22ZyMrc6cBAw-rFZnvtXyj5A%5Cu003d%5Cu003d%22,null,3,%22%22%5D&dilte=0&gme=1&sme=1&pt=ji&di=0&dbv=112:0] An iframe which has both allow-scripts and allow-same-origin for its sandbox attribute can escape its sandboxing.
05:39:06 DEBUG    js         shared:javascript_log_message:206 [https://mail.google.com/mail/u/0/data?sw=2&token=%5B%22cftp%22,%22df7b34bbe2%22,%22gmail.pinto-server_20260225.03_p1%22,%22ZyMrc6cBAw-rFZnvtXyj5A%5Cu003d%5Cu003d%22,null,3,%22%22%5D&dilte=0&gme=1&sme=1&pt=ji&di=0&dbv=112:0] An iframe which has both allow-scripts and allow-same-origin for its sandbox attribute can escape its sandboxing.
05:39:06 DEBUG    js         shared:javascript_log_message:206 [https://mail.google.com/mail/u/0/data?sw=2&token=%5B%22cftp%22,%22df7b34bbe2%22,%22gmail.pinto-server_20260225.03_p1%22,%22ZyMrc6cBAw-rFZnvtXyj5A%5Cu003d%5Cu003d%22,null,3,%22%22%5D&dilte=0&gme=1&sme=1&pt=ji&di=0&dbv=112:0] An iframe which has both allow-scripts and allow-same-origin for its sandbox attribute can escape its sandboxing.
05:39:07 DEBUG    js         shared:javascript_log_message:206 [https://mail.google.com/_/scs/mail-static/_/js/k=gmail.main.en.tlXY0XA3-4c.es5.OL/am=oBIIAAAAAMofAXzw78EHGyAAgL8c_PjVB_6aC78bBgFQgIcImASqAdADJFkr1PPI8wTsxtPCdx8-w_PxhwQABNhydFt7PMTgKo0AAFwAAAAmY-I0TAAAAAAAAAAAAAAAAAAAAIBAeWRSQQ/d=1/exm=b/ed=1/im=1/dg=0/br=1/wt=1/rs=AHGWq9Bec7B3n8jQJJ_NIAOV0acGXdxfdQ/cb=loaded_1/m=a:1558] Deprecated API for given entry type.
05:39:07 DEBUG    js         shared:javascript_log_message:206 [https://mail.google.com/_/scs/mail-static/_/js/k=gmail.main.en.tlXY0XA3-4c.es5.OL/am=oBIIAAAAAMofAXzw78EHGyAAgL8c_PjVB_6aC78bBgFQgIcImASqAdADJFkr1PPI8wTsxtPCdx8-w_PxhwQABNhydFt7PMTgKo0AAFwAAAAmY-I0TAAAAAAAAAAAAAAAAAAAAIBAeWRSQQ/d=1/exm=b/ed=1/im=1/dg=0/br=1/wt=1/rs=AHGWq9Bec7B3n8jQJJ_NIAOV0acGXdxfdQ/cb=loaded_1/m=a:1558] Deprecated API for given entry type.
05:39:07 DEBUG    js         shared:javascript_log_message:206 [https://mail.google.com/_/scs/mail-static/_/js/k=gmail.main.en.tlXY0XA3-4c.es5.OL/am=oBIIAAAAAMofAXzw78EHGyAAgL8c_PjVB_6aC78bBgFQgIcImASqAdADJFkr1PPI8wTsxtPCdx8-w_PxhwQABNhydFt7PMTgKo0AAFwAAAAmY-I0TAAAAAAAAAAAAAAAAAAAAIBAeWRSQQ/d=1/exm=b/ed=1/im=1/dg=0/br=1/wt=1/rs=AHGWq9Bec7B3n8jQJJ_NIAOV0acGXdxfdQ/cb=loaded_1/m=a:1558] Deprecated API for given entry type.
05:39:07 DEBUG    network    hostblock:filter_request:137 Request to www.googletagmanager.com blocked by host blocker.
05:39:07 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:07 DEBUG    sql        sql:run:366     {':url': 'https://github.com/Yeyito777', ':title': 'Yeyito777 (Yeyito)', ':atime': 1772275147, ':redirect': False}
05:39:07 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:07 DEBUG    sql        sql:run:366     {':url': 'https://github.com/Yeyito777', ':title': 'Yeyito777 (Yeyito)', ':last_atime': 1772275147}
05:39:07 DEBUG    sessions   sessions:save:425 Saving session _autosave to /home/yeyito/.runtime/qutebrowser-yeyito/data/sessions/_autosave.yml...
05:39:07 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_finished(True) (tab 21)
05:39:07 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=23 url='https://github.com/Yeyito777'>: LoadStatus.success_https
05:39:07 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 21)
05:39:08 DEBUG    js         shared:javascript_log_message:206 [https://assets-production.dnsimple.com/vite/assets/rails-ujs.esm-CWnUH2HT.js:23] [bugsnag] Loaded!
05:39:08 DEBUG    js         shared:javascript_log_message:206 [https://dnsimple.com/login?account_id=171315:0] [DOM] Found 2 elements with non-unique id #organization_identifier: (More info: https://goo.gl/9p2vKq) %o %o
05:39:08 DEBUG    network    hostblock:filter_request:137 Request to sessions.bugsnag.com blocked by host blocker.
05:39:08 DEBUG    js         shared:javascript_log_message:206 [https://assets-production.dnsimple.com/vite/assets/rails-ujs.esm-CWnUH2HT.js:22] [bugsnag] Session failed to send… Error: Request failed with status 0
05:39:09 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:09 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ', ':title': 'Gmail', ':atime': 1772275149, ':redirect': False}
05:39:09 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:09 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ', ':title': 'Gmail', ':last_atime': 1772275149}
05:39:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 8)
05:39:09 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=8 url='https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ'>: LoadStatus.success_https
05:39:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 8)
05:39:09 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:09 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#inbox', ':title': 'Inbox (7,738) - alinerob31@gmail.com - Gmail', ':atime': 1772275149, ':redirect': False}
05:39:09 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:09 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#inbox', ':title': 'Inbox (7,738) - alinerob31@gmail.com - Gmail', ':last_atime': 1772275149}
05:39:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 24)
05:39:09 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=26 url='https://mail.google.com/mail/u/0/#inbox'>: LoadStatus.success_https
05:39:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 24)
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/s/desktop/18bfd1c0/jsbin/live_chat_polymer.vflset/live_chat_polymer.js:3191] LegacyDataMixin will be applied to all legacy elements.
Set `_legacyUndefinedCheck: true` on element class to enable.
05:39:09 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:09 DEBUG    sql        sql:run:366     {':url': 'https://github.com/Yeyito777#main-content', ':title': 'Yeyito777 (Yeyito)', ':atime': 1772275149, ':redirect': False}
05:39:09 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:09 DEBUG    sql        sql:run:366     {':url': 'https://github.com/Yeyito777#main-content', ':title': 'Yeyito777 (Yeyito)', ':last_atime': 1772275149}
05:39:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 6)
05:39:09 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=6 url='https://github.com/Yeyito777#main-content'>: LoadStatus.success_https
05:39:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 6)
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://i.ytimg.com/vi/JrTviqq8-sM/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://rr1---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://rr5---sn-hp57yns6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://rr5---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://rr2---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://i.ytimg.com/vi/icBDYkfxpMs/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://rr3---sn-hp57ynse.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=icBDYkfxpMs:0] The resource https://rr3---sn-hp57kndk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:09 DEBUG    sql        sql:run:366     {':url': 'https://dnsimple.com/login?account_id=171315', ':title': 'Log In - DNSimple', ':atime': 1772275149, ':redirect': False}
05:39:09 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:09 DEBUG    sql        sql:run:366     {':url': 'https://dnsimple.com/login?account_id=171315', ':title': 'Log In - DNSimple', ':last_atime': 1772275149}
05:39:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 14)
05:39:09 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=14 url='https://dnsimple.com/login?account_id=171315'>: LoadStatus.success_https
05:39:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 14)
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/vi/4YymJMmY4tQ/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr3---sn-j5caxvoq5-2utk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://js.stripe.com/v3/:1] Unrecognized feature: 'payment'.
05:39:09 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://js.stripe.com/v3/m-outer-3437aaddcdf6922d623e172c2d6f9278.html#url=https%3A%2F%2Fdnsimple.c… (current https://dnsimple.com/login?account_id=171315), type other, is_main_frame False
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://rr2---sn-u1hp55-5c.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://i.ytimg.com/vi/M2iX6HQOoLg/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://rr1---sn-hp57knkl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=M2iX6HQOoLg:0] The resource https://rr1---sn-j5caxvoq5-2utk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:50] Refused to apply inline style because it violates the following Content Security Policy directive: "style-src 'self'". Either the 'unsafe-inline' keyword, a hash ('sha256-o0LvSXd77wdpaxknsB5Ui0Xmir96SfLr7ieiAnw5OtI='), or a nonce ('nonce-...') is required to enable inline execution.

05:39:10 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:50] [Report Only] Refused to apply inline style because it violates the following Content Security Policy directive: "style-src 'self'". Either the 'unsafe-inline' keyword, a hash ('sha256-o0LvSXd77wdpaxknsB5Ui0Xmir96SfLr7ieiAnw5OtI='), or a nonce ('nonce-...') is required to enable inline execution.

05:39:10 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:50] Refused to apply inline style because it violates the following Content Security Policy directive: "style-src 'self'". Either the 'unsafe-inline' keyword, a hash ('sha256-o0LvSXd77wdpaxknsB5Ui0Xmir96SfLr7ieiAnw5OtI='), or a nonce ('nonce-...') is required to enable inline execution.

05:39:10 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:50] [Report Only] Refused to apply inline style because it violates the following Content Security Policy directive: "style-src 'self'". Either the 'unsafe-inline' keyword, a hash ('sha256-o0LvSXd77wdpaxknsB5Ui0Xmir96SfLr7ieiAnw5OtI='), or a nonce ('nonce-...') is required to enable inline execution.

05:39:10 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:10 DEBUG    sql        sql:run:366     {':url': 'https://www.google.com/search?hl=en&sca_esv=9be18ee3e64d646c&sxsrf=ANbL-n4fVYy6CkdHc8ky74rkxH-2i-2FbA:1772155674996&udm=2&fbs=ADc_l-aN0CWEZBOHjofHoaMMDiKpaEWjvZ2Py1XXV8d8KvlI3vxYI1tojT_24H7Q4iMwclSqIfnTP5J_a1_YHnhrZjiiTJD_2pug00kYgkdnJCgVeWKMtN3ZYjU-fsD1M3d2Dmz1foaT9_R1LQVgaHp55LH_v32V-HRoy-dUTf3fbguP4iqnOyH0s16yO48k0dBLeKMo1WdNvgJZylz2CnOnN2tgIPl--g&q=golden+goose+for+women&sa=X&sqi=2&ved=2ahUKEwittPqrwviSAxV9QjABHZLFKTIQtKgLegQIExAB&biw=1743&bih=1042&dpr=1#vhid=wIf44cD_SfywZM&vssid=mosaic', ':title': 'golden goose for women - Google Search', ':atime': 1772275150, ':redirect': False}
05:39:10 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:10 DEBUG    sql        sql:run:366     {':url': 'https://www.google.com/search?hl=en&sca_esv=9be18ee3e64d646c&sxsrf=ANbL-n4fVYy6CkdHc8ky74rkxH-2i-2FbA:1772155674996&udm=2&fbs=ADc_l-aN0CWEZBOHjofHoaMMDiKpaEWjvZ2Py1XXV8d8KvlI3vxYI1tojT_24H7Q4iMwclSqIfnTP5J_a1_YHnhrZjiiTJD_2pug00kYgkdnJCgVeWKMtN3ZYjU-fsD1M3d2Dmz1foaT9_R1LQVgaHp55LH_v32V-HRoy-dUTf3fbguP4iqnOyH0s16yO48k0dBLeKMo1WdNvgJZylz2CnOnN2tgIPl--g&q=golden+goose+for+women&sa=X&sqi=2&ved=2ahUKEwittPqrwviSAxV9QjABHZLFKTIQtKgLegQIExAB&biw=1743&bih=1042&dpr=1#vhid=wIf44cD_SfywZM&vssid=mosaic', ':title': 'golden goose for women - Google Search', ':last_atime': 1772275150}
05:39:10 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 25)
05:39:10 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=27 url='https://www.google.com/search?hl=en&sca_esv=9be18ee3e64d646c&sxsrf=ANbL-n4fVYy6CkdHc8ky74rkxH-2i-2F…'>: LoadStatus.success_https
05:39:10 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 25)
05:39:10 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://m.stripe.network/inner.html#url=https%3A%2F%2Fdnsimple.com%2Flogin%3Faccount_id%3D171315&ti… (current https://dnsimple.com/login?account_id=171315), type other, is_main_frame False
05:39:10 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:50] Refused to apply inline style because it violates the following Content Security Policy directive: "style-src https://m.stripe.network". Either the 'unsafe-inline' keyword, a hash ('sha256-o0LvSXd77wdpaxknsB5Ui0Xmir96SfLr7ieiAnw5OtI='), or a nonce ('nonce-...') is required to enable inline execution.

05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://i.ytimg.com/vi/6Nru5OQq9O4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://rr4---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://rr1---sn-hp57knkl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://rr1---sn-hp57knkl.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:10 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 15 to 'Search results - alinerob31@gmail.com - Gmail'
05:39:11 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#inbox')) (tab 16)
05:39:11 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#inbox')) (tab 17)
05:39:11 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 16 to 'Inbox (7,738) - alinerob31@gmail.com - Gmail'
05:39:11 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 17 to 'Inbox (7,738) - alinerob31@gmail.com - Gmail'
05:39:12 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Vim Keys:269] [yt-vim] loaded — h/l seek ±5s, j/k volume ±5%
05:39:12 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:474] [yt-resume] EVENT: document-idle (script loaded)
05:39:12 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:425] [yt-resume] startForVideo(false): no videoId in URL, skipping
05:39:13 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.google.com/RotateCookiesPage?og_pid=23&rot=3&origin=https%3A%2F%2Fmail.google.com&… (current https://mail.google.com/mail/u/0/#search/from%3Adnsimple), type other, is_main_frame False
05:39:13 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:13 DEBUG    sql        sql:run:366     {':url': 'https://claude.ai/chat/7f55a028-ef6f-46c7-85ad-d7e348f5be14', ':title': '', ':atime': 1772275153, ':redirect': False}
05:39:13 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:13 DEBUG    sql        sql:run:366     {':url': 'https://claude.ai/chat/7f55a028-ef6f-46c7-85ad-d7e348f5be14', ':title': '', ':last_atime': 1772275153}
05:39:13 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 26)
05:39:13 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=28 url='https://claude.ai/chat/7f55a028-ef6f-46c7-85ad-d7e348f5be14'>: LoadStatus.success_https
05:39:13 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 26)
05:39:14 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:14 DEBUG    sql        sql:run:366     {':url': 'https://claude.ai/new', ':title': '', ':atime': 1772275154, ':redirect': False}
05:39:14 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:14 DEBUG    sql        sql:run:366     {':url': 'https://claude.ai/new', ':title': '', ':last_atime': 1772275154}
05:39:14 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 12)
05:39:14 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=12 url='https://claude.ai/new'>: LoadStatus.success_https
05:39:14 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 12)
05:39:14 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[ConnectionStore] 
font-weight: bold;
color: purple;
 Socket is reconnecting because of starting new session
05:39:14 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 .connect() called, new state is WILL_RECONNECT
05:39:14 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 Setting connection state to WILL_RECONNECT
05:39:14 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 Setting connection state to CONNECTING
05:39:14 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 [CONNECT] wss://gateway.discord.gg, encoding: json, version: 9, compression: zlib-stream
05:39:14 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 [CONNECTED] wss://gateway.discord.gg/?encoding=json&v=9&compress=zlib-stream in 329 ms
05:39:14 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[ConnectionStore] 
font-weight: bold;
color: purple;
 handleIdentify called [object Object]
05:39:14 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 Setting connection state to IDENTIFYING
05:39:14 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 [IDENTIFY]
05:39:14 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://ogs.google.com/u/0/widget/app?awwd=1&gpa=3&em=2&scv=1&dpi=70251319&origin=https%3A%2F%2Fmai… (current https://mail.google.com/mail/u/0/#search/from%3Adnsimple), type other, is_main_frame False
05:39:15 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 [HELLO] via 
gateway-prd-arm-us-east1-d-959d: 0, heartbeat interval: 41250, took 882 ms
05:39:15 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/_/bscframe (current https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox), type other, is_main_frame False
05:39:15 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.google.com/RotateCookiesPage?og_pid=23&rot=3&origin=https%3A%2F%2Fmail.google.com&… (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:15 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.google.com/RotateCookiesPage?og_pid=23&rot=3&origin=https%3A%2F%2Fmail.google.com&… (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:16 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:16 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#search/from%3Adnsimple', ':title': 'Search results - alinerob31@gmail.com - Gmail', ':atime': 1772275156, ':redirect': False}
05:39:16 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:16 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#search/from%3Adnsimple', ':title': 'Search results - alinerob31@gmail.com - Gmail', ':last_atime': 1772275156}
05:39:16 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 15)
05:39:16 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=30 url='https://mail.google.com/mail/u/0/#search/from%3Adnsimple'>: LoadStatus.success_https
05:39:16 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 15)
05:39:16 DEBUG    network    hostblock:filter_request:137 Request to mail-ads.google.com blocked by host blocker.
05:39:16 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 [READY] took 2169ms, as 00ffa7a6162f6437a501e0271725ecbc
05:39:16 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 
gateway-prd-arm-us-east1-d-959d: 539.278
|  id_created: 0.67
|  session_lookup_time: 0.214
|  session_lookup_finished: 0.016
|  discord-sessions-prd-2-27: 526.215
|  |  start_session: 333.624
|  |  |  discord-api-rpc-5c8f956bb4-bbpt6: 254.213
|  |  |  |  get_user: 11.688
|  |  |  |  get_guilds: 106.908
|  |  |  |  user_settings_proto: 0.074
|  |  |  |  relationships: 93.654
|  |  |  |  game_relationships: 0.005
|  |  |  |  friend_suggestion: 0.035
|  |  |  |  connections: 0.221
|  |  |  |  serialized_read_states: 0.014
|  |  |  |  send_scheduled_deletion_message: 0.005
|  |  |  |  sanitize_premium_perks: 0.002
|  |  |  |  guild_join_requests: 0.002
|  |  |  |  user_guild_settings: 0.004
|  |  |  |  serialized_private_channels: 0.002
|  |  |  |  user_segments: 0.01
|  |  |  |  game_invites: 0.002
|  |  |  |  blocker_ids: 0.002
|  |  |  |  affine_user_ids: 3.001
|  |  |  |  experiments: 24.123
|  |  |  |  required_action: 0.011
|  |  |  |  authorized_ip_coro: 0.002
|  |  |  |  pending_payments: 2.126
|  |  |  |  apex_experiments: 33.65
|  |  |  |  sessions_experiments: 0.005
|  |  |  |  user_activities: 0.008
|  |  |  |  played_application_ids: 0.002
|  |  |  |  linked_users: 0.002
|  |  |  |  ad_personalization_toggles_disabled: 0.002
|  |  |  |  regional_feature_config: 0.002
|  |  starting_guild_connect: 0.166
|  |  presence_started: 1.167
|  |  guilds_started: 0.676
|  |  lobbies_started: 0.001
|  |  guilds_connect: 186.404
|  |  presence_connect: 0.001
|  |  connect_finished: 186.746
|  |  build_ready: 2.375
|  |  clean_ready: 0.001
|  |  optimize_ready: 1.385
|  |  split_ready: 0.073
05:39:16 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 Setting connection state to SESSION_ESTABLISHED
05:39:16 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 Updating resume url to wss://gateway-us-east1-d.discord.gg
05:39:16 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Flux] 
font-weight: bold;
color: purple;
 Dispatching CONNECTION_OPEN
05:39:16 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[AuthenticationStore] 
font-weight: bold;
color: purple;
 handleConnectionOpen called [object Object]
05:39:16 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[DatabaseManager] 
font-weight: bold;
color: purple;
 removing database (user: 310543961825738754, database: undefined)
05:39:16 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[DatabaseManager] 
font-weight: bold;
color: purple;
 added database (310543961825738754 → null)
05:39:17 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://ogs.google.com/u/0/widget/app?awwd=1&gpa=3&em=2&scv=1&dpi=70251319&origin=https%3A%2F%2Fmai… (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:17 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:17 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#inbox', ':title': 'Inbox (7,738) - alinerob31@gmail.com - Gmail', ':atime': 1772275157, ':redirect': False}
05:39:17 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:17 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#inbox', ':title': 'Inbox (7,738) - alinerob31@gmail.com - Gmail', ':last_atime': 1772275157}
05:39:17 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 17)
05:39:17 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=32 url='https://mail.google.com/mail/u/0/#inbox'>: LoadStatus.success_https
05:39:17 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 17)
05:39:17 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Spotify] 
font-weight: bold;
color: purple;
 WS Connecting
05:39:17 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Spotify] 
font-weight: bold;
color: purple;
 Added account: dz06wukvj1i64h23fdlpa0xpf
05:39:17 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[MessageActionCreators] 
font-weight: bold;
color: purple;
 Fetching messages for 1389446484105101352 between undefined and undefined. jump={"jumpType":"ANIMATED"}
05:39:17 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Flux] 
font-weight: bold;
color: purple;
 Slow dispatch on CONNECTION_OPEN: 951.7000000029802ms
05:39:17 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[OverlayRenderStore] 
font-weight: bold;
color: purple;
 setOverlayEnabled: not supported
05:39:17 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.google.com/RotateCookiesPage?og_pid=23&rot=3&origin=https%3A%2F%2Fmail.google.com&… (current https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox), type other, is_main_frame False
05:39:17 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://ogs.google.com/u/0/widget/app?awwd=1&gpa=3&em=2&scv=1&dpi=70251319&origin=https%3A%2F%2Fmai… (current https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox), type other, is_main_frame False
05:39:17 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://contacts.google.com/widget/hovercard/v/2?hl=en&origin=https%3A%2F%2Fmail.google.com&usegapi… (current https://mail.google.com/mail/u/0/#search/from%3Adnsimple), type other, is_main_frame False
05:39:17 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Flux] 
font-weight: bold;
color: purple;
 Slow batch emitReactChanges took 392ms recentActions: TRACK -> TRACK -> TRACK -> TRACK -> TRACK -> GUILD_SUBSCRIPTIONS_FLUSH -> LOAD_MESSAGES -> AD_PERSONALIZATION_TOGGLES_RESTRICTED -> TRACK -> STREAMING_UPDATE
05:39:17 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://ogs.google.com/u/0/widget/app?awwd=1&gpa=3&em=2&scv=1&dpi=70251319&origin=https%3A%2F%2Fmai… (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:18 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:18 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:18 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:18 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:18 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:39:18 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://contacts.google.com/widget/hovercard/v/2?hl=en&origin=https%3A%2F%2Fmail.google.com&usegapi… (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:18 DEBUG    network    hostblock:filter_request:137 Request to mail-ads.google.com blocked by host blocker.
05:39:18 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:18 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox', ':title': 'Inbox (7,738) - alinerob31@gmail.com - Gmail', ':atime': 1772275158, ':redirect': False}
05:39:18 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:18 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox', ':title': 'Inbox (7,738) - alinerob31@gmail.com - Gmail', ':last_atime': 1772275158}
05:39:18 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 9)
05:39:18 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=9 url='https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox'>: LoadStatus.success_https
05:39:18 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 9)
05:39:18 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://contacts.google.com/widget/hovercard/v/2?hl=en&origin=https%3A%2F%2Fmail.google.com&usegapi… (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:19 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 13 to '(10) Discord | #yeyo | raw mutton'
05:39:19 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:39:19 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#inbox', ':title': 'Inbox (7,738) - alinerob31@gmail.com - Gmail', ':atime': 1772275159, ':redirect': False}
05:39:19 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:39:19 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#inbox', ':title': 'Inbox (7,738) - alinerob31@gmail.com - Gmail', ':last_atime': 1772275159}
05:39:19 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_finished(True) (tab 16)
05:39:19 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=31 url='https://mail.google.com/mail/u/0/#inbox'>: LoadStatus.success_https
05:39:19 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 16)
05:39:19 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[MessageActionCreators] 
font-weight: bold;
color: purple;
 Fetched 10 messages for 1389446484105101352 isBefore:false isAfter:false
05:39:19 DEBUG    network    hostblock:filter_request:137 Request to mail-ads.google.com blocked by host blocker.
05:39:19 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[ChannelMessages] 
font-weight: bold;
color: purple;
 loadComplete: resetting state for channelId=1389446484105101352, sending.length=0
05:39:19 DEBUG    network    hostblock:filter_request:137 Request to mail-ads.google.com blocked by host blocker.
05:39:20 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 [READY_SUPPLEMENTAL] took 5813ms
05:39:20 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[GatewaySocket] 
font-weight: bold;
color: purple;
 Setting connection state to SESSION_ESTABLISHED
05:39:20 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Spotify] 
font-weight: bold;
color: purple;
 WS Connected
05:39:20 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Spotify] 
font-weight: bold;
color: purple;
 Devices updated for dz06wukvj1i64h23fdlpa0xpf: 
05:39:20 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Spotify] 
font-weight: bold;
color: purple;
 Profile updated for dz06wukvj1i64h23fdlpa0xpf: isPremium = true
05:39:21 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://contacts.google.com/widget/hovercard/v/2?hl=en&origin=https%3A%2F%2Fmail.google.com&usegapi… (current https://mail.google.com/mail/u/0/?q=from%3Adnsimple+verify+OR+verification#inbox), type other, is_main_frame False
05:39:23 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2d6814690).
05:39:23 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d6814690: b'{"args":[":js-eval-tab 30 document.title"],"target_arg":"tab-silent","protocol_version":1}\n'
05:39:23 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 30 document.title"],"target_arg":"tab-silent","protocol_version":1}

05:39:23 DEBUG    init       app:process_pos_args:318 Startup cmd ':js-eval-tab 30 document.title'
05:39:23 DEBUG    commands   command:run:513 command called: js-eval-tab ['30', 'document.title']
05:39:23 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.js_eval_tab(<qutebrowser.browser.commands.CommandDispatcher>, 30, 'document.title')
05:39:23 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2d6814690: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:39:23 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:39:23 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2d6814690.
05:39:23 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:39:24 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[OverlayKeybindExperimentManager] 
font-weight: bold;
color: purple;
 Experiments initializing...
05:39:24 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Flux] 
font-weight: bold;
color: purple;
 Slow dispatch on POST_CONNECTION_OPEN: 108.90000000596046ms
05:39:24 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[OverlayKeybindExperimentManager] 
font-weight: bold;
color: purple;
 Experiments initialized
05:39:24 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[libdiscore] 
font-weight: bold;
color: purple;
 [Cache] Set cache for key: experiments_snapshot
05:39:24 DEBUG    network    hostblock:filter_request:137 Request to mail-ads.google.com blocked by host blocker.
05:39:25 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 8 to 'Security update: Action Required for 2SV Account Recovery - alinerob31@gmail.com - Gmail'
05:39:26 DEBUG    network    hostblock:filter_request:137 Request to mail-ads.google.com blocked by host blocker.
05:39:26 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/_/bscframe (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:28 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[LibDaveManager] 
font-weight: bold;
color: purple;
 DAVE loaded
05:39:28 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[LibDaveManager] 
font-weight: bold;
color: purple;
 Successfully initialized DAVE
05:39:28 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[MediaEngineWebRTC] 
font-weight: bold;
color: purple;
 Successfully initialized DAVE, version: 1
05:39:30 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/_/bscframe (current https://mail.google.com/mail/u/0/#search/from%3Adnsimple), type other, is_main_frame False
05:39:30 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://contacts.google.com/widget/hovercard/v/2?hl=en&origin=https%3A%2F%2Fmail.google.com&usegapi… (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:30 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2d62f28f0).
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'{"args":[":js-eval-tab 30 \n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 30 

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: {"args":[":js-eval-tab 30
05:39:30 ERROR    ipc        ipc:_handle_invalid_data:298 Ignoring invalid IPC data from socket 0x7ff2d62f28f0.
05:39:30 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:39:30 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2d62f28f0.
05:39:30 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'var rows = document.querySelectorAll(\\"tr.zA\\");\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing: var rows = document.querySelectorAll(\"tr.zA\");

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: var rows = document.querySelectorAll(\"tr.zA\");
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'var results = [];\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing: var results = [];

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: var results = [];
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'rows.forEach(function(r, i) {\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing: rows.forEach(function(r, i) {

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: rows.forEach(function(r, i) {
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'    if (i < 20) {\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing:     if (i < 20) {

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: if (i < 20) {
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'        var from = r.querySelector(\\".yW .bA4 span, .yW span[email]\\");\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing:         var from = r.querySelector(\".yW .bA4 span, .yW span[email]\");

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: var from = r.querySelector(\".yW .bA4 span, .yW span[email]\");
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'        var subject = r.querySelector(\\".y6 span:first-child, .bog span\\");\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing:         var subject = r.querySelector(\".y6 span:first-child, .bog span\");

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: var subject = r.querySelector(\".y6 span:first-child, .bog span\");
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'        var date = r.querySelector(\\".xW, .xW span\\");\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing:         var date = r.querySelector(\".xW, .xW span\");

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: var date = r.querySelector(\".xW, .xW span\");
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'        results.push((from ? from.getAttribute(\\"name\\") || from.textContent : \\"?\\") + \\" | \\" + \n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing:         results.push((from ? from.getAttribute(\"name\") || from.textContent : \"?\") + \" | \" + 

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: results.push((from ? from.getAttribute(\"name\") || from.textContent : \"?\") + \" | \" +
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'                     (subject ? subject.textContent.trim() : \\"?\\") + \\" | \\" +\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing:                      (subject ? subject.textContent.trim() : \"?\") + \" | \" +

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: (subject ? subject.textContent.trim() : \"?\") + \" | \" +
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'                     (date ? date.textContent.trim() : \\"?\\"));\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing:                      (date ? date.textContent.trim() : \"?\"));

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: (date ? date.textContent.trim() : \"?\"));
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'    }\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing:     }

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: }
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'});\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing: });

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: });
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:30 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d62f28f0: b'results.length + \\" results:\\\\n\\" + results.join(\\"\\\\n\\")"],"target_arg":"tab-silent","protocol_version":1}\n'
05:39:30 DEBUG    ipc        ipc:_handle_data:313 Processing: results.length + \" results:\\n\" + results.join(\"\\n\")"],"target_arg":"tab-silent","protocol_version":1}

05:39:30 ERROR    ipc        ipc:_handle_data:317 invalid json: results.length + \" results:\\n\" + results.join(\"\\n\")"],"target_arg":"tab-silent","protocol_version":1}
05:39:30 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:39:30 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:39:31 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/_/bscframe (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:31 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/_/bscframe (current https://mail.google.com/mail/u/0/#inbox), type other, is_main_frame False
05:39:31 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://contacts.google.com/widget/hovercard/v/2?hl=en&origin=https%3A%2F%2Fmail.google.com&usegapi… (current https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ), type other, is_main_frame False
05:39:34 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[libdiscore] 
font-weight: bold;
color: purple;
 [NETWORK] Sending GET request to https://cdn.discordapp.com/bad-domains/current_revision.txt
05:39:34 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[libdiscore] 
font-weight: bold;
color: purple;
 [NETWORK] Completed GET request to https://cdn.discordapp.com/bad-domains/current_revision.txt with status: 200
05:39:34 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[libdiscore] 
font-weight: bold;
color: purple;
 [BlockedDomainsStore] Already on latest revision 2554
05:39:34 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[libdiscore] 
font-weight: bold;
color: purple;
 [BlockedDomainsStore] Successfully fetched blocked domains
05:39:43 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/_/bscframe (current https://mail.google.com/mail/u/0/#inbox/FMfcgzQfCDPXrldjrSnQjmQjBJcKnzdJ), type other, is_main_frame False
05:39:44 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2d43ff6b0).
05:39:44 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d43ff6b0: b'{"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}\n'
05:39:44 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}

05:39:44 DEBUG    init       app:process_pos_args:318 Startup cmd ':dom-snapshot 30'
05:39:44 DEBUG    commands   command:run:513 command called: dom-snapshot ['30']
05:39:44 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.dom_snapshot(<qutebrowser.browser.commands.CommandDispatcher>, 30)
05:39:44 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2d43ff6b0: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:39:44 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:39:44 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2d43ff6b0.
05:39:44 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:39:45 DEBUG    ipc        ipc:update_atime:428 Touching /home/yeyito/.runtime/qutebrowser-yeyito/runtime/ipc-68c269b09ec0f6fa43ac4f56debfec19
05:40:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:40:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:40:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:40:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:40:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:40:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/vi/4YymJMmY4tQ/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr3---sn-j5caxvoq5-2utk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:06 DEBUG    sessions   sessions:save:425 Saving session _autosave to /home/yeyito/.runtime/qutebrowser-yeyito/data/sessions/_autosave.yml...
05:40:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:09 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:40:16 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2d44265d0).
05:40:16 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d44265d0: b'{"args":[":command-eval 30 0 :open https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant"],"target_arg":"tab-silent","protocol_version":1}\n'
05:40:16 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":command-eval 30 0 :open https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant"],"target_arg":"tab-silent","protocol_version":1}

05:40:16 DEBUG    init       app:process_pos_args:318 Startup cmd ':command-eval 30 0 :open https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant'
05:40:16 DEBUG    commands   command:run:513 command called: command-eval ['30', '0', ':open https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant']
05:40:16 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.command_eval(<qutebrowser.browser.commands.CommandDispatcher>, 30, 0, ':open https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant')
05:40:16 DEBUG    commands   command:run:513 command called: open ['https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant']
05:40:16 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.openurl(<qutebrowser.browser.commands.CommandDispatcher>, 'https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant', False, False, False, False, None, False, False)
05:40:16 DEBUG    url        urlutils:get_path_if_valid:407 Checking if 'https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant' is a path
05:40:16 DEBUG    url        urlutils:is_url:311 Checking if 'https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant' is a URL (autosearch=naive).
05:40:16 DEBUG    url        urlutils:is_url:334 Contains explicit scheme
05:40:16 DEBUG    url        urlutils:is_url:358 url = True
05:40:16 DEBUG    url        urlutils:fuzzy_url:265 URL is a fuzzy address
05:40:16 DEBUG    url        urlutils:fuzzy_url:267 Converting fuzzy term 'https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant' to URL -> https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant
05:40:16 DEBUG    webview    browsertab:_on_before_load_started:1136 Going to start loading: https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant
05:40:16 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 21 to 'https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant'
05:40:16 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2d44265d0: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:40:16 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:40:16 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2d44265d0.
05:40:16 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:40:16 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant (current https://github.com/Yeyito777), type typed, is_main_frame True
05:40:16 DEBUG    webview    webenginetab:_on_find_finished:212 Active search match: 0/0
05:40:16 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_search_match_changed(SearchMatch(current=0, total=0)) (tab 21)
05:40:16 DEBUG    statusbar  searchmatch:set_match:30 Clearing search match text.
05:40:16 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=23 url='https://github.com/Yeyito777'>: LoadStatus.loading
05:40:16 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_status_changed(<LoadStatus.loading: 6>) (tab 21)
05:40:16 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_started() (tab 21)
05:40:16 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason load started) as we're in mode KeyMode.yesno
05:40:16 DEBUG    modes      tabbedbrowser:_leave_modes_on_load:779 Ignoring leave_on_load request due to setting.
05:40:16 DEBUG    misc       eventfilter:eventFilter:45 <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3af390> got new child <PyQt6.QtWidgets.QWidget object at 0x7ff2d443b390, className='QQuickWidget'>, installing filter
05:40:16 DEBUG    webview    webenginetab:_on_renderer_process_pid_changed:1583 Renderer process PID for tab 23: 1056296
05:40:16 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant')) (tab 21)
05:40:16 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 21 to 'mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant'
05:40:16 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 21 to 'Gmail'
05:40:16 DEBUG    misc       eventfilter:eventFilter:83 <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff33c3af390>: removed child <PyQt6.QtCore.QObject object at 0x7ff2d44582d0>
05:40:16 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/u/0/data?sw=2&token=%5B%22cftp%22,%22df7b34bbe2%22,%22gmail.pinto-serv… (current https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant), type other, is_main_frame False
05:40:16 DEBUG    js         shared:javascript_log_message:206 [https://mail.google.com/_/scs/mail-static/_/js/k=gmail.main.en.tlXY0XA3-4c.es5.OL/am=oBIIAAAAAMofAXzw78EHGyAAgL8c_PjVB_6aC78bBgFQgIcImASqAdADJFkr1PPI8wTsxtPCdx8-w_PxhwQABNhydFt7PMTgKo0AAFwAAAAmY-I0TAAAAAAAAAAAAAAAAAAAAIBAeWRSQQ/d=1/exm=b/ed=1/im=1/dg=0/br=1/wt=1/rs=AHGWq9Bec7B3n8jQJJ_NIAOV0acGXdxfdQ/cb=loaded_1/m=a:1558] Deprecated API for given entry type.
05:40:17 DEBUG    js         shared:javascript_log_message:206 [https://mail.google.com/mail/u/0/data?sw=2&token=%5B%22cftp%22,%22df7b34bbe2%22,%22gmail.pinto-server_20260225.03_p1%22,%22ZyMrc6cBAw-rFZnvtXyj5A%5Cu003d%5Cu003d%22,null,3,%22%22%5D&dilte=0&gme=1&sme=1&pt=ji&di=0&dbv=112:0] An iframe which has both allow-scripts and allow-same-origin for its sandbox attribute can escape its sandboxing.
05:40:18 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 21 to 'Search results - alinerob31@gmail.com - Gmail'
05:40:19 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://accounts.google.com/RotateCookiesPage?og_pid=23&rot=3&origin=https%3A%2F%2Fmail.google.com&… (current https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant), type other, is_main_frame False
05:40:21 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:40:21 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant', ':title': 'Search results - alinerob31@gmail.com - Gmail', ':atime': 1772275221, ':redirect': False}
05:40:21 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:40:21 DEBUG    sql        sql:run:366     {':url': 'https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant', ':title': 'Search results - alinerob31@gmail.com - Gmail', ':last_atime': 1772275221}
05:40:21 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_finished(True) (tab 21)
05:40:21 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=23 url='https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant'>: LoadStatus.success_https
05:40:21 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 21)
05:40:22 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://ogs.google.com/u/0/widget/app?awwd=1&gpa=3&em=2&scv=1&dpi=70251319&origin=https%3A%2F%2Fmai… (current https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant), type other, is_main_frame False
05:40:23 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://contacts.google.com/widget/hovercard/v/2?hl=en&origin=https%3A%2F%2Fmail.google.com&usegapi… (current https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant), type other, is_main_frame False
05:40:23 DEBUG    network    hostblock:filter_request:137 Request to mail-ads.google.com blocked by host blocker.
05:40:25 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2d44c89b0).
05:40:25 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d44c89b0: b'{"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}\n'
05:40:25 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}

05:40:25 DEBUG    init       app:process_pos_args:318 Startup cmd ':dom-snapshot 30'
05:40:25 DEBUG    commands   command:run:513 command called: dom-snapshot ['30']
05:40:25 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.dom_snapshot(<qutebrowser.browser.commands.CommandDispatcher>, 30)
05:40:25 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2d44c89b0: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:40:25 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:40:25 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2d44c89b0.
05:40:25 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:40:34 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2d44de170).
05:40:34 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d44de170: b'{"args":[":js-eval-tab 30 \n'
05:40:34 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 30 

05:40:34 ERROR    ipc        ipc:_handle_data:317 invalid json: {"args":[":js-eval-tab 30
05:40:34 ERROR    ipc        ipc:_handle_invalid_data:298 Ignoring invalid IPC data from socket 0x7ff2d44de170.
05:40:34 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:40:34 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2d44de170.
05:40:34 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:40:34 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:40:34 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d44de170: b'var searchBox = document.querySelector(\\"input[aria-label*=\\\\\\"Search\\\\\\"], input[name=\\\\\\"q\\\\\\"]\\");\n'
05:40:34 DEBUG    ipc        ipc:_handle_data:313 Processing: var searchBox = document.querySelector(\"input[aria-label*=\\\"Search\\\"], input[name=\\\"q\\\"]\");

05:40:34 ERROR    ipc        ipc:_handle_data:317 invalid json: var searchBox = document.querySelector(\"input[aria-label*=\\\"Search\\\"], input[name=\\\"q\\\"]\");
05:40:34 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:40:34 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:40:34 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d44de170: b'searchBox ? searchBox.value : \\"no search box found\\""],"target_arg":"tab-silent","protocol_version":1}\n'
05:40:34 DEBUG    ipc        ipc:_handle_data:313 Processing: searchBox ? searchBox.value : \"no search box found\""],"target_arg":"tab-silent","protocol_version":1}

05:40:34 ERROR    ipc        ipc:_handle_data:317 invalid json: searchBox ? searchBox.value : \"no search box found\""],"target_arg":"tab-silent","protocol_version":1}
05:40:34 WARNING  ipc        ipc:_handle_invalid_data:295 Ignoring invalid IPC data (socket already disconnected).
05:40:34 DEBUG    ipc        ipc:_get_socket:365 In _get_socket with None socket!
05:40:34 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://mail.google.com/mail/_/bscframe (current https://mail.google.com/mail/u/0/#search/verify+OR+verification+domain+OR+registrant), type other, is_main_frame False
05:41:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:41:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:41:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:41:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:41:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:41:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:06 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://i.ytimg.com/vi/JrTviqq8-sM/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:06 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://rr1---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:06 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://rr5---sn-hp57yns6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:06 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://rr5---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:06 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=JrTviqq8-sM:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:06 DEBUG    sessions   sessions:save:425 Saving session _autosave to /home/yeyito/.runtime/qutebrowser-yeyito/data/sessions/_autosave.yml...
05:41:07 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:07 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/vi/4YymJMmY4tQ/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:07 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr3---sn-j5caxvoq5-2utk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:07 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:07 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:41:31 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff2a4409e50, className='QQuickWidget'>
05:41:31 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtCore.QObject object at 0x7ff2a4409e50, className='QtWebEngineCore::RenderWidgetHostViewQtDelegateItem'>
05:41:31 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff2a4409e50, className='QQuickWidget'>
05:41:33 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: None
05:41:58 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Flux] 
font-weight: bold;
color: purple;
 Slow dispatch on PASSIVE_UPDATE_V2: 712.5ms
05:42:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:42:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:42:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:42:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:42:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:42:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/vi/4YymJMmY4tQ/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr3---sn-j5caxvoq5-2utk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:05 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:42:45 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a441afd0).
05:42:45 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a441afd0: b'{"args":[":js-eval-tab 14 document.querySelector(\\"input[type=email]\\") ? \\"login form present\\" : \\"no login form\\""],"target_arg":"tab-silent","protocol_version":1}\n'
05:42:45 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 14 document.querySelector(\"input[type=email]\") ? \"login form present\" : \"no login form\""],"target_arg":"tab-silent","protocol_version":1}

05:42:45 DEBUG    init       app:process_pos_args:318 Startup cmd ':js-eval-tab 14 document.querySelector("input[type=email]") ? "login form present" : "no login form"'
05:42:45 DEBUG    commands   command:run:513 command called: js-eval-tab ['14', 'document.querySelector("input[type=email]") ? "login form present" : "no login form"']
05:42:45 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.js_eval_tab(<qutebrowser.browser.commands.CommandDispatcher>, 14, 'document.querySelector("input[type=email]") ? "login form present" : "no login form"')
05:42:45 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a441afd0: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:42:45 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:42:45 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a441afd0.
05:42:45 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:42:51 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2d44de170).
05:42:51 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d44de170: b'{"args":[":command-eval 30 0 :open https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)"],"target_arg":"tab-silent","protocol_version":1}\n'
05:42:51 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":command-eval 30 0 :open https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)"],"target_arg":"tab-silent","protocol_version":1}

05:42:51 DEBUG    init       app:process_pos_args:318 Startup cmd ':command-eval 30 0 :open https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)'
05:42:51 DEBUG    commands   command:run:513 command called: command-eval ['30', '0', ':open https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)']
05:42:51 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.command_eval(<qutebrowser.browser.commands.CommandDispatcher>, 30, 0, ':open https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)')
05:42:51 DEBUG    commands   command:run:513 command called: open ['https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)']
05:42:51 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.openurl(<qutebrowser.browser.commands.CommandDispatcher>, 'https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)', False, False, False, False, None, False, False)
05:42:51 DEBUG    url        urlutils:get_path_if_valid:407 Checking if 'https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)' is a path
05:42:51 DEBUG    url        urlutils:is_url:311 Checking if 'https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)' is a URL (autosearch=naive).
05:42:51 DEBUG    url        urlutils:is_url:334 Contains explicit scheme
05:42:51 DEBUG    url        urlutils:is_url:358 url = True
05:42:51 DEBUG    url        urlutils:fuzzy_url:265 URL is a fuzzy address
05:42:51 DEBUG    url        urlutils:fuzzy_url:267 Converting fuzzy term 'https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)' to URL -> https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)
05:42:51 DEBUG    webview    browsertab:_on_before_load_started:1136 Going to start loading: https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)
05:42:51 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 21 to 'https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)'
05:42:51 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2d44de170: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:42:51 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:42:51 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2d44de170.
05:42:51 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:42:51 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+from%3Aregistrant+OR+(verify+AND+domain)')) (tab 21)
05:42:51 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:42:51 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:42:51 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:00 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a4436670).
05:43:00 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a4436670: b'{"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}\n'
05:43:00 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}

05:43:00 DEBUG    init       app:process_pos_args:318 Startup cmd ':dom-snapshot 30'
05:43:00 DEBUG    commands   command:run:513 command called: dom-snapshot ['30']
05:43:00 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.dom_snapshot(<qutebrowser.browser.commands.CommandDispatcher>, 30)
05:43:00 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a4436670: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:43:00 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:43:00 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a4436670.
05:43:00 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:43:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:43:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:43:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:43:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:43:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:43:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:43:09 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a4446490).
05:43:09 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a4446490: b'{"args":[":js-eval-tab 30 window.location.hash = \\"#search/from:key-systems OR from:emailverification OR (verify domain)\\"; \\"navigated\\""],"target_arg":"tab-silent","protocol_version":1}\n'
05:43:09 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 30 window.location.hash = \"#search/from:key-systems OR from:emailverification OR (verify domain)\"; \"navigated\""],"target_arg":"tab-silent","protocol_version":1}

05:43:09 DEBUG    init       app:process_pos_args:318 Startup cmd ':js-eval-tab 30 window.location.hash = "#search/from:key-systems OR from:emailverification OR (verify domain)"; "navigated"'
05:43:09 DEBUG    commands   command:run:513 command called: js-eval-tab ['30', 'window.location.hash = "#search/from:key-systems OR from:emailverification OR (verify domain)"; "navigated"']
05:43:09 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.js_eval_tab(<qutebrowser.browser.commands.CommandDispatcher>, 30, 'window.location.hash = "#search/from:key-systems OR from:emailverification OR (verify domain)"; "navigated"')
05:43:09 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a4446490: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:43:09 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:43:09 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a4446490.
05:43:09 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:43:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/from:key-systems OR from:emailverification OR (verify domain)')) (tab 15)
05:43:09 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/from%3Akey-systems+OR+from%3Aemailverification+OR+(verify+domain)')) (tab 15)
05:43:09 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:09 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:09 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:09 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:09 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:09 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:18 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a445ae90).
05:43:18 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a445ae90: b'{"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}\n'
05:43:18 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}

05:43:18 DEBUG    init       app:process_pos_args:318 Startup cmd ':dom-snapshot 30'
05:43:18 DEBUG    commands   command:run:513 command called: dom-snapshot ['30']
05:43:18 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.dom_snapshot(<qutebrowser.browser.commands.CommandDispatcher>, 30)
05:43:18 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a445ae90: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:43:18 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:43:18 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a445ae90.
05:43:18 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:43:33 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a44698b0).
05:43:33 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a44698b0: b'{"args":[":js-eval-tab 30 window.location.hash = \\"#search/verify+domain+after:2026/2/1+before:2026/3/1\\"; \\"navigated\\""],"target_arg":"tab-silent","protocol_version":1}\n'
05:43:33 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 30 window.location.hash = \"#search/verify+domain+after:2026/2/1+before:2026/3/1\"; \"navigated\""],"target_arg":"tab-silent","protocol_version":1}

05:43:33 DEBUG    init       app:process_pos_args:318 Startup cmd ':js-eval-tab 30 window.location.hash = "#search/verify+domain+after:2026/2/1+before:2026/3/1"; "navigated"'
05:43:33 DEBUG    commands   command:run:513 command called: js-eval-tab ['30', 'window.location.hash = "#search/verify+domain+after:2026/2/1+before:2026/3/1"; "navigated"']
05:43:33 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.js_eval_tab(<qutebrowser.browser.commands.CommandDispatcher>, 30, 'window.location.hash = "#search/verify+domain+after:2026/2/1+before:2026/3/1"; "navigated"')
05:43:33 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a44698b0: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:43:33 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:43:33 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a44698b0.
05:43:33 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:43:33 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/verify+domain+after:2026/2/1+before:2026/3/1')) (tab 15)
05:43:34 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:34 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:34 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:34 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/verify+domain+after%3A2026')) (tab 15)
05:43:34 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:34 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:34 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:43 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a446b890).
05:43:43 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a446b890: b'{"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}\n'
05:43:43 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}

05:43:43 DEBUG    init       app:process_pos_args:318 Startup cmd ':dom-snapshot 30'
05:43:43 DEBUG    commands   command:run:513 command called: dom-snapshot ['30']
05:43:43 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.dom_snapshot(<qutebrowser.browser.commands.CommandDispatcher>, 30)
05:43:43 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a446b890: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:43:43 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:43:43 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a446b890.
05:43:43 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:43:52 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a44718b0).
05:43:52 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a44718b0: b'{"args":[":js-eval-tab 30 window.location.hash = \\"#search/IMMEDIATE+VERIFICATION+required+domain\\"; \\"navigated\\""],"target_arg":"tab-silent","protocol_version":1}\n'
05:43:52 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 30 window.location.hash = \"#search/IMMEDIATE+VERIFICATION+required+domain\"; \"navigated\""],"target_arg":"tab-silent","protocol_version":1}

05:43:52 DEBUG    init       app:process_pos_args:318 Startup cmd ':js-eval-tab 30 window.location.hash = "#search/IMMEDIATE+VERIFICATION+required+domain"; "navigated"'
05:43:52 DEBUG    commands   command:run:513 command called: js-eval-tab ['30', 'window.location.hash = "#search/IMMEDIATE+VERIFICATION+required+domain"; "navigated"']
05:43:52 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.js_eval_tab(<qutebrowser.browser.commands.CommandDispatcher>, 30, 'window.location.hash = "#search/IMMEDIATE+VERIFICATION+required+domain"; "navigated"')
05:43:52 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a44718b0: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:43:52 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:43:52 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a44718b0.
05:43:52 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:43:52 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/IMMEDIATE+VERIFICATION+required+domain')) (tab 15)
05:43:52 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:52 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:43:52 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:44:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:44:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:44:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:44:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:44:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:44:01 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a447b6b0).
05:44:01 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a447b6b0: b'{"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}\n'
05:44:01 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}

05:44:01 DEBUG    init       app:process_pos_args:318 Startup cmd ':dom-snapshot 30'
05:44:01 DEBUG    commands   command:run:513 command called: dom-snapshot ['30']
05:44:01 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.dom_snapshot(<qutebrowser.browser.commands.CommandDispatcher>, 30)
05:44:02 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a447b6b0: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:44:02 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:44:02 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a447b6b0.
05:44:02 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:44:26 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a4489090).
05:44:26 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a4489090: b'{"args":[":js-eval-tab 30 window.location.hash = \\"#search/newer_than:30d+(verification+OR+verify+OR+registrant)\\"; \\"navigated\\""],"target_arg":"tab-silent","protocol_version":1}\n'
05:44:26 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 30 window.location.hash = \"#search/newer_than:30d+(verification+OR+verify+OR+registrant)\"; \"navigated\""],"target_arg":"tab-silent","protocol_version":1}

05:44:26 DEBUG    init       app:process_pos_args:318 Startup cmd ':js-eval-tab 30 window.location.hash = "#search/newer_than:30d+(verification+OR+verify+OR+registrant)"; "navigated"'
05:44:26 DEBUG    commands   command:run:513 command called: js-eval-tab ['30', 'window.location.hash = "#search/newer_than:30d+(verification+OR+verify+OR+registrant)"; "navigated"']
05:44:26 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.js_eval_tab(<qutebrowser.browser.commands.CommandDispatcher>, 30, 'window.location.hash = "#search/newer_than:30d+(verification+OR+verify+OR+registrant)"; "navigated"')
05:44:26 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a4489090: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:44:26 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:44:26 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a4489090.
05:44:26 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:44:26 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/newer_than:30d+(verification+OR+verify+OR+registrant)')) (tab 15)
05:44:26 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#search/newer_than%3A30d+(verification+OR+verify+OR+registrant)')) (tab 15)
05:44:26 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:26 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:26 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:26 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:26 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:26 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:39 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a449fe30).
05:44:39 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a449fe30: b'{"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}\n'
05:44:39 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}

05:44:39 DEBUG    init       app:process_pos_args:318 Startup cmd ':dom-snapshot 30'
05:44:39 DEBUG    commands   command:run:513 command called: dom-snapshot ['30']
05:44:39 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.dom_snapshot(<qutebrowser.browser.commands.CommandDispatcher>, 30)
05:44:39 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a449fe30: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:44:39 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:44:39 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a449fe30.
05:44:39 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:44:45 DEBUG    ipc        ipc:update_atime:428 Touching /home/yeyito/.runtime/qutebrowser-yeyito/runtime/ipc-68c269b09ec0f6fa43ac4f56debfec19
05:44:55 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a449d4f0).
05:44:55 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a449d4f0: b'{"args":[":js-eval-tab 30 window.location.hash = \\"#spam\\"; \\"navigated to spam\\""],"target_arg":"tab-silent","protocol_version":1}\n'
05:44:55 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 30 window.location.hash = \"#spam\"; \"navigated to spam\""],"target_arg":"tab-silent","protocol_version":1}

05:44:55 DEBUG    init       app:process_pos_args:318 Startup cmd ':js-eval-tab 30 window.location.hash = "#spam"; "navigated to spam"'
05:44:55 DEBUG    commands   command:run:513 command called: js-eval-tab ['30', 'window.location.hash = "#spam"; "navigated to spam"']
05:44:55 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.js_eval_tab(<qutebrowser.browser.commands.CommandDispatcher>, 30, 'window.location.hash = "#spam"; "navigated to spam"')
05:44:55 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a449d4f0: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:44:55 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:44:55 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a449d4f0.
05:44:55 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:44:55 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#spam')) (tab 15)
05:44:56 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:56 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:56 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:44:57 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff2a44799f0, className='QQuickWidget'>
05:44:57 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtCore.QObject object at 0x7ff2a44799f0, className='QtWebEngineCore::RenderWidgetHostViewQtDelegateItem'>
05:44:57 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff2a44799f0, className='QQuickWidget'>
05:44:57 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 15 to 'Spam (167) - alinerob31@gmail.com - Gmail'
05:44:58 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: None
05:45:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:45:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:45:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:45:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:45:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:45:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:45:01 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a445b890).
05:45:01 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a445b890: b'{"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}\n'
05:45:01 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}

05:45:01 DEBUG    init       app:process_pos_args:318 Startup cmd ':dom-snapshot 30'
05:45:01 DEBUG    commands   command:run:513 command called: dom-snapshot ['30']
05:45:01 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.dom_snapshot(<qutebrowser.browser.commands.CommandDispatcher>, 30)
05:45:01 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a445b890: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:45:01 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:45:01 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a445b890.
05:45:01 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:45:10 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff2a4436670, className='QQuickWidget'>
05:45:10 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtCore.QObject object at 0x7ff2a4436670, className='QtWebEngineCore::RenderWidgetHostViewQtDelegateItem'>
05:45:10 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff2a4436670, className='QQuickWidget'>
05:45:11 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: None
05:45:29 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2a4435450).
05:45:29 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2a4435450: b'{"args":[":js-eval-tab 30 window.location.hash = \\"#spam/19c8eb658eb77917\\"; \\"navigated\\""],"target_arg":"tab-silent","protocol_version":1}\n'
05:45:29 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":js-eval-tab 30 window.location.hash = \"#spam/19c8eb658eb77917\"; \"navigated\""],"target_arg":"tab-silent","protocol_version":1}

05:45:29 DEBUG    init       app:process_pos_args:318 Startup cmd ':js-eval-tab 30 window.location.hash = "#spam/19c8eb658eb77917"; "navigated"'
05:45:29 DEBUG    commands   command:run:513 command called: js-eval-tab ['30', 'window.location.hash = "#spam/19c8eb658eb77917"; "navigated"']
05:45:29 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.js_eval_tab(<qutebrowser.browser.commands.CommandDispatcher>, 30, 'window.location.hash = "#spam/19c8eb658eb77917"; "navigated"')
05:45:29 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2a4435450: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:45:29 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:45:29 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2a4435450.
05:45:29 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:45:29 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#spam/19c8eb658eb77917')) (tab 15)
05:45:29 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:45:29 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:45:29 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:45:30 DEBUG    signals    signalfilter:_filter_signals:78 ignoring: cur_url_changed(PyQt6.QtCore.QUrl('https://mail.google.com/mail/u/0/#spam/FMfcgzQfBsvSTzLhVzxbxhgLbSvjQsnH')) (tab 15)
05:45:30 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:45:30 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:45:30 DEBUG    js         shared:javascript_log_message:206 [userscript:_qute_stylesheet:138] Failed to style frame: Failed to read a named property '_qutebrowser' from 'Window': Blocked a frame with origin "https://mail.google.com" from accessing a cross-origin frame.
05:45:30 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 15 to 'Final Request for email address validation - alinerob31@gmail.com - Gmail'
05:45:38 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2d44c8690).
05:45:38 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d44c8690: b'{"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}\n'
05:45:38 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args": [":dom-snapshot 30"], "target_arg": "tab-silent", "protocol_version": 1}

05:45:38 DEBUG    init       app:process_pos_args:318 Startup cmd ':dom-snapshot 30'
05:45:38 DEBUG    commands   command:run:513 command called: dom-snapshot ['30']
05:45:38 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.dom_snapshot(<qutebrowser.browser.commands.CommandDispatcher>, 30)
05:45:38 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2d44c8690: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:45:38 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:45:38 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2d44c8690.
05:45:38 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:45:43 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Flux] 
font-weight: bold;
color: purple;
 Slow batch emitChanges took 103ms recentActions: MESSAGE_CREATE -> MESSAGE_CREATE -> GUILD_MEMBER_ADD -> MESSAGE_CREATE -> MESSAGE_UPDATE -> CONVERSATION_SUMMARY_UPDATE -> CONVERSATION_SUMMARY_UPDATE -> MESSAGE_CREATE -> PASSIVE_UPDATE_V2 -> PRESENCE_UPDATES
05:46:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:46:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:46:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:46:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:46:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:46:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:46:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:47:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:47:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:47:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:47:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:47:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:47:24 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Flux] 
font-weight: bold;
color: purple;
 Slow dispatch on PRESENCE_UPDATES: 101.3999999910593ms
05:48:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:48:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:48:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:48:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:48:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:48:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:48:52 DEBUG    ipc        ipc:handle_connection:255 Client connected (socket 0x7ff2d67d8ff0).
05:48:52 DEBUG    ipc        ipc:on_ready_read:385 Read from socket 0x7ff2d67d8ff0: b'{"args":[":command-eval 0 0 :open -t https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com"],"target_arg":"tab-silent","protocol_version":1}\n'
05:48:52 DEBUG    ipc        ipc:_handle_data:313 Processing: {"args":[":command-eval 0 0 :open -t https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com"],"target_arg":"tab-silent","protocol_version":1}

05:48:52 DEBUG    init       app:process_pos_args:318 Startup cmd ':command-eval 0 0 :open -t https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com'
05:48:52 DEBUG    commands   command:run:513 command called: command-eval ['0', '0', ':open -t https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com']
05:48:52 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.command_eval(<qutebrowser.browser.commands.CommandDispatcher>, 0, 0, ':open -t https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com')
05:48:52 DEBUG    commands   command:run:513 command called: open ['-t', 'https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com']
05:48:52 DEBUG    commands   command:run:527 Calling qutebrowser.browser.commands.CommandDispatcher.openurl(<qutebrowser.browser.commands.CommandDispatcher>, 'https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com', False, False, True, False, None, False, False)
05:48:52 DEBUG    url        urlutils:get_path_if_valid:407 Checking if 'https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com' is a path
05:48:52 DEBUG    url        urlutils:is_url:311 Checking if 'https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com' is a URL (autosearch=naive).
05:48:52 DEBUG    url        urlutils:is_url:334 Contains explicit scheme
05:48:52 DEBUG    url        urlutils:is_url:358 url = True
05:48:52 DEBUG    url        urlutils:fuzzy_url:265 URL is a fuzzy address
05:48:52 DEBUG    url        urlutils:fuzzy_url:267 Converting fuzzy term 'https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com' to URL -> https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com
05:48:52 DEBUG    webview    tabbedbrowser:tabopen:636 Creating new tab with URL PyQt6.QtCore.QUrl('https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com'), background False, related False, idx None
05:48:52 DEBUG    greasemonkey webenginetab:_inject_greasemonkey_scripts:1258 adding script: GM-Always Show Hover Elements
05:48:52 DEBUG    greasemonkey webenginetab:_inject_greasemonkey_scripts:1258 adding script: GM-http://tampermonkey.net//Claude Autosend
05:48:52 DEBUG    greasemonkey webenginetab:_inject_greasemonkey_scripts:1258 adding script: GM-http://tampermonkey.net//YouTube Vim Keys
05:48:52 DEBUG    greasemonkey webenginetab:_inject_greasemonkey_scripts:1258 adding script: GM-yeyito/Discord Squarify
05:48:52 DEBUG    greasemonkey webenginetab:_inject_greasemonkey_scripts:1258 adding script: GM-qute.chatgpt.autosend/ChatGPT Auto-Send from ?q= (stable + no-dup)
05:48:52 DEBUG    greasemonkey webenginetab:_inject_greasemonkey_scripts:1258 adding script: GM-qute.aistudio.autorun/Google AI Studio Auto-Run (Ctrl+Enter)
05:48:52 DEBUG    greasemonkey webenginetab:_inject_greasemonkey_scripts:1258 adding script: GM-qutebrowser/Chrome Web Store Extension Downloader
05:48:52 DEBUG    greasemonkey webenginetab:_inject_greasemonkey_scripts:1258 adding script: GM-http://tampermonkey.net//YouTube Resume Playback
05:48:52 DEBUG    webview    tabbedbrowser:_get_new_tab_idx:723 tabs.new_position next -> opening new tab at 22, next left: 21 / right: 23
05:48:52 DEBUG    webview    browsertab:_on_before_load_started:1136 Going to start loading: https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com
05:48:52 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 22 to 'https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com'
05:48:52 DEBUG    misc       eventfilter:eventFilter:45 <qutebrowser.browser.webengine.webview.WebEngineView object at 0x7ff2d67d8a50> got new child <PyQt6.QtWidgets.QWidget object at 0x7ff2d6bea530, className='QQuickWidget'>, installing filter
05:48:52 DEBUG    modes      tabbedbrowser:_on_current_changed:923 Current tab changed, focusing <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=33 url=''>
05:48:52 DEBUG    modes      tabbedbrowser:_on_current_changed:930 Mode before tab change: yesno (mode_on_change = normal)
05:48:52 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.hint (reason tab changed) as we're in mode KeyMode.yesno
05:48:52 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.caret (reason tab changed) as we're in mode KeyMode.yesno
05:48:52 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason tab changed) as we're in mode KeyMode.yesno
05:48:52 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.passthrough (reason tab changed) as we're in mode KeyMode.yesno
05:48:52 DEBUG    modes      tabbedbrowser:_on_current_changed:941 Mode after tab change: yesno (mode_on_change = normal)
05:48:52 DEBUG    statusbar  searchmatch:set_match:30 Clearing search match text.
05:48:52 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob… (current ), type typed, is_main_frame True
05:48:52 DEBUG    ipc        ipc:on_error:235 Socket 0x7ff2d67d8ff0: error LocalSocketError.PeerClosedError: QLocalSocket: Remote closed
05:48:52 DEBUG    qt         Unknown module:none:0 QObject::disconnect: wildcard call disconnects from destroyed signal of QNativeSocketEngine::unnamed
05:48:52 DEBUG    ipc        ipc:on_disconnected:282 Client disconnected from socket 0x7ff2d67d8ff0.
05:48:52 DEBUG    ipc        ipc:handle_connection:253 No new connection to handle.
05:48:52 DEBUG    webview    webenginetab:_on_find_finished:212 Active search match: 0/0
05:48:52 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_search_match_changed(SearchMatch(current=0, total=0)) (tab 22)
05:48:52 DEBUG    statusbar  searchmatch:set_match:30 Clearing search match text.
05:48:52 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=33 url=''>: LoadStatus.loading
05:48:52 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_status_changed(<LoadStatus.loading: 6>) (tab 22)
05:48:52 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_started() (tab 22)
05:48:52 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason load started) as we're in mode KeyMode.yesno
05:48:52 DEBUG    modes      tabbedbrowser:_leave_modes_on_load:779 Ignoring leave_on_load request due to setting.
05:48:53 DEBUG    js         shared:javascript_log_message:206 [:0] Error with Feature-Policy header: Unrecognized feature: 'payment'.
05:48:53 DEBUG    js         shared:javascript_log_message:206 [:0] Error with Feature-Policy header: Unrecognized feature: 'usb'.
05:48:53 DEBUG    js         shared:javascript_log_message:206 [:0] Error with Feature-Policy header: Some features are specified in both Feature-Policy and Permissions-Policy header: accelerometer, camera, geolocation, gyroscope, magnetometer, microphone. Values defined in Permissions-Policy header will be used.
05:48:53 DEBUG    js         shared:javascript_log_message:206 [:0] Error with Permissions-Policy header: Unrecognized feature: 'payment'.
05:48:53 DEBUG    js         shared:javascript_log_message:206 [:0] Error with Permissions-Policy header: Unrecognized feature: 'usb'.
05:48:53 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_url_changed(PyQt6.QtCore.QUrl('https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com')) (tab 22)
05:48:53 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 22 to 'emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com'
05:48:53 DEBUG    webview    tabbedbrowser:_on_title_changed:799 Changing title for idx 22 to 'EmailVerification'
05:48:54 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://www.recaptcha.net/recaptcha/api2/anchor?ar=1&k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&co=… (current https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com), type other, is_main_frame False
05:48:54 DEBUG    sql        sql:run:362 INSERT INTO History (url, title, atime, redirect) values(:url, :title, :atime, :redirect)
05:48:54 DEBUG    sql        sql:run:366     {':url': 'https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com', ':title': 'EmailVerification', ':atime': 1772275734, ':redirect': False}
05:48:54 DEBUG    sql        sql:run:362 REPLACE INTO CompletionHistory (url, title, last_atime) values(:url, :title, :last_atime)
05:48:54 DEBUG    sql        sql:run:366     {':url': 'https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com', ':title': 'EmailVerification', ':last_atime': 1772275734}
05:48:54 DEBUG    sessions   sessions:save:425 Saving session _autosave to /home/yeyito/.runtime/qutebrowser-yeyito/data/sessions/_autosave.yml...
05:48:54 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_finished(True) (tab 22)
05:48:54 DEBUG    webview    browsertab:_set_load_status:1102 load status for <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=33 url='https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob…'>: LoadStatus.success_https
05:48:54 DEBUG    signals    signalfilter:_filter_signals:72 emitting: cur_load_status_changed(<LoadStatus.success_https: 3>) (tab 22)
05:48:55 DEBUG    webview    browsertab:_on_navigation_request:1160 navigation request: url https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&v=AWtrSI7lAmTAfV1rzWqEqz54&k=6LeD2owqAAAAAFmo… (current https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob31@gmail.com), type other, is_main_frame False
05:49:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:49:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:49:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:49:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:49:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:49:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://i.ytimg.com/vi/6Nru5OQq9O4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://rr4---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://rr1---sn-hp57knkl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=6Nru5OQq9O4:0] The resource https://rr1---sn-hp57knkl.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/vi/4YymJMmY4tQ/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr3---sn-j5caxvoq5-2utk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://rr4---sn-hp57kndr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=4YymJMmY4tQ:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr5---sn-hp57yne7.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr2---sn-hp57kndk.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/vi/vV4zUFFnhms/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://rr1---sn-j5caxvoq5-2ut6.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:12 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=vV4zUFFnhms:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:49:45 DEBUG    ipc        ipc:update_atime:428 Touching /home/yeyito/.runtime/qutebrowser-yeyito/runtime/ipc-68c269b09ec0f6fa43ac4f56debfec19
05:50:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:50:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:50:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:50:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:50:01 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Flux] 
font-weight: bold;
color: purple;
 Slow dispatch on IDLE: 162.79999999701977ms
05:50:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:50:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:50:40 DEBUG    js         shared:javascript_log_message:206 [https://discord.com/assets/sentry.326b8e376f098d48.js:15] %c[Flux] 
font-weight: bold;
color: purple;
 Slow dispatch on PASSIVE_UPDATE_V2: 109.5ms
05:51:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:51:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:51:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:51:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:51:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:51:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:51:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:52:00 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 9dDgUc7CjiE: time=1125.5, playing=false, loop=false
05:52:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for JrTviqq8-sM: time=185.1, playing=false, loop=false
05:52:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for tKGhxMi50y8: time=38.5, playing=false, loop=false
05:52:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for vV4zUFFnhms: time=142.7, playing=false, loop=false
05:52:01 DEBUG    js         shared:javascript_log_message:206 [userscript:GM-http://tampermonkey.net//YouTube Resume Playback:263] [yt-resume] savePosition: saving for 4YymJMmY4tQ: time=35.6, playing=false, loop=false
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/vi/9dDgUc7CjiE/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57ynsl.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr1---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://rr5---sn-hp57knds.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=9dDgUc7CjiE:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/vi/rJt-x-0Jci4/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr5---sn-hp57knds.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr4---sn-j5caxvoq5-2utr.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://rr1---sn-hp57ynsd.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=rJt-x-0Jci4:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-u1hp55-5h.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/vi/tKGhxMi50y8/hqdefault.jpg was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-hp57kndy.c.youtube.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://i.ytimg.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:04 DEBUG    js         shared:javascript_log_message:206 [https://www.youtube.com/watch?v=tKGhxMi50y8:0] The resource https://rr2---sn-j5caxvoq5-2ute7.googlevideo.com/generate_204 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate `as` value and it is preloaded intentionally.
05:52:26 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff2e4344b90, className='QQuickWidget'>
05:52:26 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtCore.QObject object at 0x7ff2e4344b90, className='QtWebEngineCore::RenderWidgetHostViewQtDelegateItem'>
05:52:26 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff2e4344b90, className='QQuickWidget'>
05:52:27 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: None
05:52:29 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff3001eb610, className='QQuickWidget'>
05:52:29 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtCore.QObject object at 0x7ff3001eb610, className='QtWebEngineCore::RenderWidgetHostViewQtDelegateItem'>
05:52:29 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: <PyQt6.QtWidgets.QWidget object at 0x7ff3001eb610, className='QQuickWidget'>
05:52:33 DEBUG    modes      modeman:_handle_keyrelease:335 filter: False
05:52:33 DEBUG    modes      modeman:_handle_keyrelease:335 filter: False
05:52:34 DEBUG    webview    webenginetab:_js_cb_single:817 Got element from JS: {'attributes': {'lang': 'en'}, 'class_name': '', 'id': 0, 'is_content_editable': False, 'outer_xml': '<html lang="en"><head><meta http-equiv="origin-trial" content="3NNj0GXVktLOmVKwWUDendk4Vq2qgMVDBDX+Sni48ATJl9JBj+zF+9W2HGB3pvt6qowOihTbQgTeBm9SKbdTwYAAABfeyJvcmlnaW4iOiJodHRwczovL3JlY2FwdGNoYS5uZXQ6NDQzIiwiZmVhdHVyZSI6IlRwY2QiLCJleHBpcnkiOjE3MzUzNDM5OTksImlzVGhpcmRQYXJ0eSI6dHJ1ZX0="><meta http-equiv="origin-trial" content="A6iYDRdcg1LVww9DNZEU+JUx2g1IJxSxk4P6F+LimR0ElFa38FydBqtz/AmsKdGr11ZooRgDPCInHJfGzwtR+A4AAACXeyJvcmlnaW4iOiJodHRwczovL3d3dy5yZWNhcHRjaGEubmV0OjQ0MyIsImZlYXR1cmUiOiJEaXNhYmxlVGhpcmRQYXJ0eVN0b3JhZ2VQYXJ0aXRpb25pbmczIiwiZXhwaXJ5IjoxNzU3OTgwODAwLCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ==">\n    <meta charset="utf-8">\n    <meta name="robots" content="noindex, nofollow, noarchive, nosnippet, noodp">\n    <meta name="author" content="emailverification.info">\n    <meta name="publisher" content="emailverfification.info">\n    <meta name="viewport" content="widt…
05:52:34 DEBUG    webelem    webelem:is_editable:243 Checking if element is editable: <qutebrowser.browser.webengine.webengineelem.WebEngineElement html='<html lang="en"><head><meta http-equiv="origin-trial" content="3NNj0GXVktLOmVKwWUDendk4Vq2qgMVDBDX+Sni48ATJl9JBj+zF+9W2HGB3pvt6qowOihTbQgTeBm9SKbdTwYAAABfeyJvcmlnaW4iOiJodHRwczovL3JlY2FwdGNoYS5uZXQ6NDQzIiwiZmVhdHVyZSI6IlRwY2QiLCJleHBpcnkiOjE3MzUzNDM5OTksImlzVGhpcmRQYXJ0eSI6dHJ1ZX0="><meta http-equiv="origin-trial" content="A6iYDRdcg1LVww9DNZEU+JUx2g1IJxSxk4P6F+LimR0ElFa38FydBqtz/AmsKdGr11ZooRgDPCInHJfGzwtR+A4AAACXeyJvcmlnaW4iOiJodHRwczovL3d3dy5yZWNhcHRjaGEubmV0OjQ0MyIsImZlYXR1cmUiOiJEaXNhYmxlVG…'>
05:52:34 DEBUG    mouse      eventfilter:_mousepress_insertmode_cb:212 Clicked non-editable element!
05:52:34 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason click) as we're in mode KeyMode.yesno
05:52:35 DEBUG    webview    webenginetab:_js_cb_single:817 Got element from JS: {'attributes': {'frameborder': '0', 'height': '78', 'name': 'a-fipwtl9ealzk', 'role': 'presentation', 'sandbox': 'allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation', 'scrolling': 'no', 'src': 'https://www.recaptcha.net/recaptcha/api2/anchor?ar=1&k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&co=aHR0cHM6Ly93d3cuZW1haWx2ZXJpZmljYXRpb24uaW5mbzo0NDM.&hl=en&v=AWtrSI7lAmTAfV1rzWqEqz54&size=normal&anchor-ms=20000&execute-ms=30000&cb=tp4sx8gvr4z', 'title': 'reCAPTCHA', 'width': '304'}, 'class_name': '', 'id': 1, 'is_content_editable': False, 'outer_xml': '<iframe title="reCAPTCHA" width="304" height="78" role="presentation" name="a-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/a…
05:52:35 DEBUG    webelem    webelem:is_editable:243 Checking if element is editable: <qutebrowser.browser.webengine.webengineelem.WebEngineElement html='<iframe title="reCAPTCHA" width="304" height="78" role="presentation" name="a-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/anchor?ar=1&amp;k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&amp;co=aHR0cHM6Ly93d3cuZW1haWx2ZXJpZmljYXRpb24uaW5mbzo0NDM.&amp;hl=en&amp;v=AWtrSI7lAmTAfV1rzWqEqz5…'>
05:52:35 DEBUG    mouse      eventfilter:_mousepress_insertmode_cb:212 Clicked non-editable element!
05:52:35 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason click) as we're in mode KeyMode.yesno
05:52:37 DEBUG    webview    webenginetab:_js_cb_single:817 Got element from JS: {'attributes': {'frameborder': '0', 'name': 'c-fipwtl9ealzk', 'sandbox': 'allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation', 'scrolling': 'no', 'src': 'https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&v=AWtrSI7lAmTAfV1rzWqEqz54&k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0zWhbBqP8EjzoV0ObmCfeNVavuizRIZQ', 'style': 'width: 400px; height: 580px;', 'title': 'recaptcha challenge expires in two minutes'}, 'class_name': '', 'id': 2, 'is_content_editable': False, 'outer_xml': '<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bfram…
05:52:37 DEBUG    webelem    webelem:is_editable:243 Checking if element is editable: <qutebrowser.browser.webengine.webengineelem.WebEngineElement html='<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&amp;v=AWtrSI7lAmTAfV1rzWqEqz54&amp;k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&amp;bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0z…'>
05:52:37 DEBUG    mouse      eventfilter:_mousepress_insertmode_cb:212 Clicked non-editable element!
05:52:37 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason click) as we're in mode KeyMode.yesno
05:52:37 DEBUG    webview    webenginetab:_js_cb_single:817 Got element from JS: {'attributes': {'frameborder': '0', 'name': 'c-fipwtl9ealzk', 'sandbox': 'allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation', 'scrolling': 'no', 'src': 'https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&v=AWtrSI7lAmTAfV1rzWqEqz54&k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0zWhbBqP8EjzoV0ObmCfeNVavuizRIZQ', 'style': 'width: 400px; height: 580px;', 'title': 'recaptcha challenge expires in two minutes'}, 'class_name': '', 'id': 3, 'is_content_editable': False, 'outer_xml': '<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bfram…
05:52:37 DEBUG    webelem    webelem:is_editable:243 Checking if element is editable: <qutebrowser.browser.webengine.webengineelem.WebEngineElement html='<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&amp;v=AWtrSI7lAmTAfV1rzWqEqz54&amp;k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&amp;bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0z…'>
05:52:37 DEBUG    mouse      eventfilter:_mousepress_insertmode_cb:212 Clicked non-editable element!
05:52:37 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason click) as we're in mode KeyMode.yesno
05:52:37 DEBUG    webview    webenginetab:_js_cb_single:817 Got element from JS: {'attributes': {'frameborder': '0', 'name': 'c-fipwtl9ealzk', 'sandbox': 'allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation', 'scrolling': 'no', 'src': 'https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&v=AWtrSI7lAmTAfV1rzWqEqz54&k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0zWhbBqP8EjzoV0ObmCfeNVavuizRIZQ', 'style': 'width: 400px; height: 580px;', 'title': 'recaptcha challenge expires in two minutes'}, 'class_name': '', 'id': 4, 'is_content_editable': False, 'outer_xml': '<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bfram…
05:52:37 DEBUG    webelem    webelem:is_editable:243 Checking if element is editable: <qutebrowser.browser.webengine.webengineelem.WebEngineElement html='<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&amp;v=AWtrSI7lAmTAfV1rzWqEqz54&amp;k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&amp;bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0z…'>
05:52:37 DEBUG    mouse      eventfilter:_mousepress_insertmode_cb:212 Clicked non-editable element!
05:52:37 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason click) as we're in mode KeyMode.yesno
05:52:37 DEBUG    webview    webenginetab:_js_cb_single:817 Got element from JS: {'attributes': {'frameborder': '0', 'name': 'c-fipwtl9ealzk', 'sandbox': 'allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation', 'scrolling': 'no', 'src': 'https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&v=AWtrSI7lAmTAfV1rzWqEqz54&k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0zWhbBqP8EjzoV0ObmCfeNVavuizRIZQ', 'style': 'width: 400px; height: 580px;', 'title': 'recaptcha challenge expires in two minutes'}, 'class_name': '', 'id': 5, 'is_content_editable': False, 'outer_xml': '<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bfram…
05:52:37 DEBUG    webelem    webelem:is_editable:243 Checking if element is editable: <qutebrowser.browser.webengine.webengineelem.WebEngineElement html='<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&amp;v=AWtrSI7lAmTAfV1rzWqEqz54&amp;k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&amp;bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0z…'>
05:52:37 DEBUG    mouse      eventfilter:_mousepress_insertmode_cb:212 Clicked non-editable element!
05:52:37 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason click) as we're in mode KeyMode.yesno
05:52:38 DEBUG    webview    webenginetab:_js_cb_single:817 Got element from JS: {'attributes': {'frameborder': '0', 'name': 'c-fipwtl9ealzk', 'sandbox': 'allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation', 'scrolling': 'no', 'src': 'https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&v=AWtrSI7lAmTAfV1rzWqEqz54&k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0zWhbBqP8EjzoV0ObmCfeNVavuizRIZQ', 'style': 'width: 400px; height: 580px;', 'title': 'recaptcha challenge expires in two minutes'}, 'class_name': '', 'id': 6, 'is_content_editable': False, 'outer_xml': '<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bfram…
05:52:38 DEBUG    webelem    webelem:is_editable:243 Checking if element is editable: <qutebrowser.browser.webengine.webengineelem.WebEngineElement html='<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&amp;v=AWtrSI7lAmTAfV1rzWqEqz54&amp;k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&amp;bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0z…'>
05:52:38 DEBUG    mouse      eventfilter:_mousepress_insertmode_cb:212 Clicked non-editable element!
05:52:38 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason click) as we're in mode KeyMode.yesno
05:52:38 DEBUG    webview    webenginetab:_js_cb_single:817 Got element from JS: {'attributes': {'frameborder': '0', 'name': 'c-fipwtl9ealzk', 'sandbox': 'allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation', 'scrolling': 'no', 'src': 'https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&v=AWtrSI7lAmTAfV1rzWqEqz54&k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0zWhbBqP8EjzoV0ObmCfeNVavuizRIZQ', 'style': 'width: 400px; height: 580px;', 'title': 'recaptcha challenge expires in two minutes'}, 'class_name': '', 'id': 7, 'is_content_editable': False, 'outer_xml': '<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bfram…
05:52:38 DEBUG    webelem    webelem:is_editable:243 Checking if element is editable: <qutebrowser.browser.webengine.webengineelem.WebEngineElement html='<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&amp;v=AWtrSI7lAmTAfV1rzWqEqz54&amp;k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&amp;bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0z…'>
05:52:38 DEBUG    mouse      eventfilter:_mousepress_insertmode_cb:212 Clicked non-editable element!
05:52:38 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason click) as we're in mode KeyMode.yesno
05:52:39 DEBUG    webview    webenginetab:_js_cb_single:817 Got element from JS: {'attributes': {'frameborder': '0', 'name': 'c-fipwtl9ealzk', 'sandbox': 'allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation', 'scrolling': 'no', 'src': 'https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&v=AWtrSI7lAmTAfV1rzWqEqz54&k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0zWhbBqP8EjzoV0ObmCfeNVavuizRIZQ', 'style': 'width: 400px; height: 580px;', 'title': 'recaptcha challenge expires in two minutes'}, 'class_name': '', 'id': 8, 'is_content_editable': False, 'outer_xml': '<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bfram…
05:52:39 DEBUG    webelem    webelem:is_editable:243 Checking if element is editable: <qutebrowser.browser.webengine.webengineelem.WebEngineElement html='<iframe title="recaptcha challenge expires in two minutes" name="c-fipwtl9ealzk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.recaptcha.net/recaptcha/api2/bframe?hl=en&amp;v=AWtrSI7lAmTAfV1rzWqEqz54&amp;k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG&amp;bft=0dAFcWeA5RP7qDfNZgnRaqMEA3VRU7Gh-FuVSfdXGVKm7jteDpX9_na_8V6_WfeH8Hbn0z…'>
05:52:39 DEBUG    mouse      eventfilter:_mousepress_insertmode_cb:212 Clicked non-editable element!
05:52:39 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.insert (reason click) as we're in mode KeyMode.yesno
05:52:39 DEBUG    js         shared:javascript_log_message:206 [https://www.gstatic.com/recaptcha/releases/AWtrSI7lAmTAfV1rzWqEqz54/recaptcha__en.js:1557] Refused to connect to 'https://www.recaptcha.net/recaptcha/api2/clr?k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG' because it violates the following Content Security Policy directive: "connect-src 'self'".

05:52:39 DEBUG    js         shared:javascript_log_message:206 [https://www.gstatic.com/recaptcha/releases/AWtrSI7lAmTAfV1rzWqEqz54/recaptcha__en.js:1557] Fetch API cannot load https://www.recaptcha.net/recaptcha/api2/clr?k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG. Refused to connect because it violates the document's Content Security Policy.
05:52:39 DEBUG    js         shared:javascript_log_message:206 [https://www.gstatic.com/recaptcha/releases/AWtrSI7lAmTAfV1rzWqEqz54/recaptcha__en.js:1557] Refused to connect to 'https://www.recaptcha.net/recaptcha/api2/clr?k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG' because it violates the following Content Security Policy directive: "connect-src 'self'".

05:52:39 DEBUG    js         shared:javascript_log_message:206 [https://www.gstatic.com/recaptcha/releases/AWtrSI7lAmTAfV1rzWqEqz54/recaptcha__en.js:1557] Fetch API cannot load https://www.recaptcha.net/recaptcha/api2/clr?k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG. Refused to connect because it violates the document's Content Security Policy.
05:52:39 DEBUG    js         shared:javascript_log_message:206 [https://www.gstatic.com/recaptcha/releases/AWtrSI7lAmTAfV1rzWqEqz54/recaptcha__en.js:1557] Refused to connect to 'https://www.recaptcha.net/recaptcha/api2/clr?k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG' because it violates the following Content Security Policy directive: "connect-src 'self'".

05:52:39 DEBUG    js         shared:javascript_log_message:206 [https://www.gstatic.com/recaptcha/releases/AWtrSI7lAmTAfV1rzWqEqz54/recaptcha__en.js:1557] Fetch API cannot load https://www.recaptcha.net/recaptcha/api2/clr?k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG. Refused to connect because it violates the document's Content Security Policy.
05:52:39 DEBUG    js         shared:javascript_log_message:206 [https://www.gstatic.com/recaptcha/releases/AWtrSI7lAmTAfV1rzWqEqz54/recaptcha__en.js:1557] Refused to connect to 'https://www.recaptcha.net/recaptcha/api2/clr?k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG' because it violates the following Content Security Policy directive: "connect-src 'self'".

05:52:39 DEBUG    js         shared:javascript_log_message:206 [https://www.gstatic.com/recaptcha/releases/AWtrSI7lAmTAfV1rzWqEqz54/recaptcha__en.js:1557] Fetch API cannot load https://www.recaptcha.net/recaptcha/api2/clr?k=6LeD2owqAAAAAFmoeENOXqX7OqUQB1z7hB7CDVGG. Refused to connect because it violates the document's Content Security Policy.
05:52:41 DEBUG    modes      modeman:_handle_keypress:277 got keypress in mode KeyMode.yesno - delegating to <qutebrowser.keyinput.modeparsers.CommandKeyParser do_log=True mode=<KeyMode.yesno: 4> passthrough=False supports_count=False win_id=0>
05:52:41 DEBUG    keyboard   basekeyparser:_debug_log:203 CommandKeyParser for mode yesno: Got key: <qutebrowser.keyinput.keyutils.KeyInfo key='Key_Y' modifiers='NoModifier' text='y'> (dry_run True)
05:52:41 DEBUG    modes      modeman:_handle_keypress:310 match: SequenceMatch.ExactMatch, forward_unbound_keys: auto, passthrough: False, is_non_alnum: False, dry_run: True --> filter: True (focused: <PyQt6.QtWidgets.QWidget object at 0x7ff3001e98b0, className='QQuickWidget'>)
05:52:41 DEBUG    modes      modeman:_handle_keypress:277 got keypress in mode KeyMode.yesno - delegating to <qutebrowser.keyinput.modeparsers.CommandKeyParser do_log=True mode=<KeyMode.yesno: 4> passthrough=False supports_count=False win_id=0>
05:52:41 DEBUG    keyboard   basekeyparser:_debug_log:203 CommandKeyParser for mode yesno: Got key: <qutebrowser.keyinput.keyutils.KeyInfo key='Key_Y' modifiers='NoModifier' text='y'> (dry_run False)
05:52:41 DEBUG    keyboard   basekeyparser:_debug_log:203 CommandKeyParser for mode yesno: Definitive match for 'y'.
05:52:41 DEBUG    keyboard   basekeyparser:_debug_log:203 CommandKeyParser for mode yesno: Clearing keystring (was: y).
05:52:41 DEBUG    commands   command:run:513 command called: prompt-accept ['yes']
05:52:41 DEBUG    commands   command:run:527 Calling qutebrowser.mainwindow.prompt.PromptContainer.prompt_accept(<qutebrowser.mainwindow.prompt.PromptContainer win_id=0>, 'yes', save=False)
05:52:41 DEBUG    modes      modeman:leave:429 Leaving mode KeyMode.yesno (reason: :prompt-accept)
05:52:41 DEBUG    statusbar  bar:set_mode_active:344 Setting prompt flag to False
05:52:41 DEBUG    prompt     prompt:_on_mode_left:248 Left mode KeyMode.yesno, hiding <qutebrowser.utils.usertypes.Question default=None mode=<PromptMode.yesno: 1> option='content.notifications.enabled' text='Allow the website at <b>https://calendar.google.com</b> to show notifications?' title='Permission request'>
05:52:41 DEBUG    prompt     prompt:_on_show_prompts:344 Deleting old prompt qutebrowser.mainwindow.prompt.YesNoPrompt(question=<qutebrowser.utils.usertypes.Question default=None mode=<PromptMode.yesno: 1> option='content.notifications.enabled' text='Allow the website at <b>https://calendar.google.com</b> to show notifications?' title='Permission request'>)
05:52:41 DEBUG    prompt     prompt:_on_show_prompts:348 No prompts left, hiding prompt container.
05:52:41 DEBUG    modes      tabbedbrowser:on_release_focus:893 Focus released, focusing <qutebrowser.browser.webengine.webenginetab.WebEngineTab tab_id=33 url='https://www.emailverification.info/?trigger=MTc3MDkwNTAzMC45MTY2OCM4MjkxMTM1MDczMTI5&email=alinerob…'>
05:52:41 DEBUG    modes      modeman:leave:422 Ignoring leave request for KeyMode.yesno (reason left in other window) as we're in mode KeyMode.normal
05:52:41 DEBUG    modes      modeman:leave:429 Leaving mode KeyMode.normal (reason: enter normal: restore mode before yesno)
05:52:41 ERROR    misc       crashsignal:_handle_early_exits:229 Uncaught exception
Traceback (most recent call last):
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/eventfilter.py", line 117, in eventFilter
    return handler(cast(QKeyEvent, event))
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/eventfilter.py", line 64, in _handle_key_event
    return man.handle_event(event)
           ~~~~~~~~~~~~~~~~^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/modeman.py", line 466, in handle_event
    return handler(cast(QKeyEvent, event))
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/modeman.py", line 279, in _handle_keypress
    match = parser.handle(event, dry_run=dry_run)
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/basekeyparser.py", line 311, in handle
    self._handle_result(info, result)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/basekeyparser.py", line 330, in _handle_result
    self.execute(result.command, count)
    ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/keyinput/modeparsers.py", line 62, in execute
    self._commandrunner.run(cmdstr, count)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/commands/runners.py", line 176, in run
    result.cmd.run(self._win_id, args, count=count)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/commands/command.py", line 529, in run
    self.handler(*posargs, **kwargs)
    ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/mainwindow/prompt.py", line 443, in prompt_accept
    question.done()
    ~~~~~~~~~~~~~^^
  File "/home/yeyito/.local/share/qutebrowser-venv/lib/python3.14/site-packages/qutebrowser/utils/usertypes.py", line 414, in done
    self.answered.emit(self.answer)
    ^^^^^^^^^^^^^
RuntimeError: wrapped C/C++ object of type Question has been deleted
05:52:41 DEBUG    sql        sql:run:362 SELECT count(*) FROM History
05:52:41 DEBUG    misc       app:on_focus_object_changed:635 Focus object changed: None
05:52:41 DEBUG    sql        sql:run:362 pragma user_version
05:52:41 DEBUG    sql        sql:run:362 PRAGMA journal_mode=WAL
05:52:41 DEBUG    sql        sql:run:362 PRAGMA synchronous=NORMAL
05:52:41 DEBUG    sql        sql:run:362 select sqlite_version()
