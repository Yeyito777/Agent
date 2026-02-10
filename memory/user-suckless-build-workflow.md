Workflow for modifying user's suckless tools (dwm, st, dmenu, etc.)

# Location
Suckless configs are in: `/home/yeyito/Config/<tool>/config.h`
- dwm: `/home/yeyito/Config/dwm/config.h`
- st: `/home/yeyito/Config/st/config.h`
- dmenu: `/home/yeyito/Config/dmenu/config.h` (vi-mode patch applied, starts in normal mode)
- dwmblocks: `/home/yeyito/Config/dwmblocks/config.h` (dwmblocks-async fork)

# After Modifying
Always build and install after making changes:
```bash
cd /home/yeyito/Config/<tool> && make && sudo make install
```

No need for `make clean` - just `make && sudo make install`.

# Applying Changes
- **dwm**: The user restarts dwm themselves. NEVER send signals to dwm (kill -HUP, etc.) — this kills the entire X session and all running programs. After `make && sudo make install`, just tell the user the build is ready and they'll restart dwm on their own.
- **st**: New terminals will use updated config; existing terminals unaffected
- **dmenu**: Takes effect immediately on next invocation
- **dwmblocks**: `killall dwmblocks; setsid dwmblocks &` to restart, or just restart dwm

# Notes
- config.h files will show clang errors when analyzed standalone - this is expected since they're included during the main build
- User wants changes built/installed immediately, not left as uncommitted config edits

---
Update this memory when the information above becomes outdated.
