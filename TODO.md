- [ ] Memory audit / cleaner agent in a cron job that checks that everything is up to date and also makes sure that titles, and descriptions can be easily picked up by context and by the recall subagent

- [ ] Merge the memory update subagent with a new agent: memory creator agent, (do this after you have st notifications) and find a way to run it in this directory or /memory directory without CLAUDE.md being injected.

- [ ] See if it's safe to remove pointers from CLAUDE.md after the memory recall subagent was introduced, do this after you can get st notifications for better auditing 

- [ ] When an agent finishes through the claude finish convo hook make sure it notifies the window in the wm such that it shows up with a notif on it (I can check on it) (This should be a global hook)
