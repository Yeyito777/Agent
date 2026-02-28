<memory-metadata>
{
  "frequency": 11,
  "last_accessed_session": 1115,
  "created_session": 879,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions MusicPlayer, mp command, TUI music player, mpv subprocess, vim-style navigation, or building/modifying the music player project.
</conditional>

<fuzzy-match>
musicplayer, mp, TUI, mpv, vim navigation, audio playback, IPC socket, songs directory, make install, zsh alias, h/l seek, j/k move, pause, stop, playlist, sidebar, Ctrl+M, state persistence, state.save, resume playback
</fuzzy-match>

<memory>
MusicPlayer — minimal C-based TUI music player at ~/Workspace/MusicPlayer with vim keybindings, mpv backend, IPC control, and installation to ~/.local/bin

MusicPlayer is a minimal TUI (terminal user interface) music player written in C. Located at ~/Workspace/MusicPlayer.

**Architecture & Dependencies:**
- Uses the alt screen buffer for the TUI display
- Audio playback handled by spawning mpv as a subprocess
- IPC communication with mpv via Unix socket at /tmp/musicplayer-mpv.sock for seek and pause commands

**Navigation & Controls (vim-style):**
- j/k — move up/down in song list
- g — go to top
- G — go to bottom
- Enter / Space — play selected song
- h — seek backward 5 seconds
- l — seek forward 5 seconds
- -/+ — volume down/up
- m — toggle loop single/all
- n — toggle shuffle
- / or ? — enter search filter (regex, case-insensitive). Enter keeps filter, Escape clears it
- Ctrl+M — toggle playlist sidebar (right-side panel, CSI sequence `\033[109;5u` from st)
- Space — pause/resume (when playing)
- Escape — stop playback
- q — quit the player

**Playlists:**
- `.playlist` files in `playlists/` directory (overridable via `PLAYLISTS_DIR` env var)
- Each file contains song filenames line-by-line
- Ctrl+M toggles a right-side sidebar with vim navigation (j/k/g/G), Enter selects, Escape closes
- Selecting a playlist filters the song list; search with `/` operates within the active playlist
- Header shows active playlist name in brackets: `MusicPlayer [name]`

**State Persistence (state.save):**
- Full session state saved to `state.save` (renamed from `config.conf`) on every state change
- Persists: volume, playing song (by filename) + position + paused, cursor (by filename), active playlist (by name), loop mode, shuffle
- `save_state()` called before every `draw()` in the main loop — immediate writes, no buffering
- NOT called during cleanup/signals — quit with `q` or signal preserves playback for resume
- `restore_state()` on startup: restores playlist → cursor → playback (with mpv seek + optional pause)
- SIGQUIT also handled alongside SIGINT/SIGTERM; SIGKILL uses last saved state (~250ms stale max)

**Installation & Usage:**
- Binary installs to ~/.local/bin/musicplayer via `make install`
- Zsh alias 'mp' defined in ~/.zshrc: cds to project directory and runs the player
- Songs stored in songs/ directory (which is gitignored)

**Repository:**
GitHub: https://github.com/Yeyito777/MusicPlayer

---
Update this memory when the player's control scheme, architecture, or installation process changes.
</memory>
