Moidfy my fork of dwm such that if I start dwm with --persist (-p) it saves runtime information about itself in dwm folder in/home/yeyito/.runtime/dwm (creates the runtime dir and the dwm dir if they don't exist).

The saving / loading process works the following way:
for dwm tag saving: dwm creates numbered dirs inside the dwm dir, each one corresponding to a tag, it looks
like this:
1/
2/
3/
...

But how are we going to restore the windows within tags?
**each program is responsible for saving their state in their own .save files**

A program like st is goig to send a request to dwm:
please save me with these CLI args: ./st --blah --bleh --bluh

If a file doesn't exist, then dwm creates one:
st-<PID>.save

and in that file, the first line is basically the argv of how st is going to start back up: st --blah
--bleh --bluh
dwm will then append metadata to this file, detailing where in the window stack it is + anything else
required to restore it properly.

If the program terminates then dwm will remove its associated save file, doesn't matter if it was
sigtermed or sigkilled.
If the program moves in the window stack, then dwm will update the .save file's metadata accordingly.
If the program moves to another tag, dwm will mv it accordingly.
If a tag is deleted then dwm can simply delete its associated dir and all its contents.
If a tag is swapped with another one / changes in the tag stack, dwm can mv the names of the tags that
swapped to keep correct order numbering.
...

On startup:
dwm will spawn the correct number of tags depending on the amount of dirs and their nums,
dwm will spawn windows by looking at the .save files with the correct CLI args and place them in the correct position in the window stack.*
    * If the metadata of a program requests to be placed on the nth position but there are less than n windows, that's fine, we collapse the virtual window stack by removing empty positions before actually proceeding to turn it into a real window stack and loading it.
    ** The above can happen if for example a program that never requests to be saved is above a program that does request to be saved in the window stack before reloading dwm.

Considerations:
IPC from programs to dwm needs to be simple enough such that programs can do it by calling a bash file if they so choose. Talk to me about the approaches here and the one you recommend

dwm removing .save files on program death must be robust, doesn't matter if it exited cleanly or was straight up killed. (Tell me if this is doable, if not, I have some ideas on how to harden this)
Ideas on how to harden removing .save files:
- When dwm mutates its runtime state it scans involved tags and ensures that the saved processes are still alive
- when dwm is quit through alt+shift+q it first scans that all the processes in the runtime, checking they're are still alive, pruning any that are not, before proceeding to end itself
- User aliases poweroff and reboot to first IPC (perhaps through X properties) to any running dwm instances to quit, which triggers the scan→prune→end sequence, once they've all exited cleanly (or after a timeout) poweroff/reboot is officially initiated.*
    * The shell that poweroff would run in would have to be detached since dwm quitting kills the parent st window (and thus the shell) where poweroff was called.
- When dwm receives a SIGTERM, it first triggers the scan→prune→end sequence before exiting.

Consider what I just told you and tell me your thoughts. I need to know what you think: am I correct, incorrect? Is there something I'm missing? Anything not ironed out? Or is everything largely ok? Talk to me.
