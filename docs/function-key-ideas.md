# Function Key Binding Ideas for dwm

All F1-F12 keys are currently unbound. F13 is already bound to keyboard lock.

## Layout

| Key | Action | Status | Notes |
|-----|--------|--------|-------|
| **F1** | Screen record toggle | Needs script | Press to start recording, press again to stop and upload to YT |
| **F2** | Whisper transcription (hold) | Needs whisperflow setup | Hold to dictate, release to get text pasted |
| **F3** | Agent voice input (hold) | Needs script | Hold to speak a command to Kit/claude code wrapper |
| **F4** | Toggle floating | Ready | Was previously on Alt+Shift+Space (commented out) |
| **F5** | Monocle toggle | Ready | Fullscreen-ish single window layout |
| **F6** | Dictionary on selection | Needs script | Select a word, hit F6, get definition via notification |
| **F7** | Mic mute toggle | Ready | `amixer set Capture toggle` or similar |
| **F8** | Audio sink switch | Needs script | Toggle between speakers/headphones (airpods) |
| **F9** | Quick scratchpad | Ready | dmenu prompt that appends to a scratchpad file |
| **F10** | System monitor popup | Ready | Float an `st -e htop` |
| **F11** | Fullscreen toggle | Ready | Traditional fullscreen, apps expect this keysym |
| **F12** | Spawn Kit | Ready | Quick access, frees Alt+Shift+L for reuse |

## Related todo items
- F1 recording idea: todo line 27
- F2/F3 whisper + agent: todo line 37
- F6 dict notifications: todo line 32
- F8 airpods switching: todo lines 11, 20
