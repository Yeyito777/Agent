- [ ] Add notifications to retrieving memories and memory updating agent updating memories.

- [ ] When an agent finishes through the claude finish convo hook make sure it notifies the window in the wm such that it shows up with a notif on it (I can check on it) (This should be a global hook)

- [ ] Delete the memory pointers section from CLAUDE.md entirely since we're now handling memory through the memory subagent

- [ ] Add a post tool use hook that whenever the agent cd's into a directory that has a reference/ it tells the agent about it and to consider reading any reference files that it might consider relevant to the user qurey. Also update your current reference files to follow memory notation, top line is plaintext sentence description of the reference, and instructions at the bottom on what to watch out for / what may need to be updated.

- [ ] Add to CLAUDE.md inside each project that I care about a "How to test this" section. This section should get fed to the agent through a tool hook, so that for example it always knows to test its changes with st -d by spawning a window and having it print the necessary output (sidestepping it being able to use UI entirely).

- [ ] Split the memory recall agent into many subagents that each analyze a subset of all total memories, make #subagents dynamic depending on the amount of memories maybe.. floor(total memories / 20), then aggregate their answers. Should prevent needle-in-a-haystack style problems. Tune the "20" param and make it a setting in agent.conf such that agents are not over-eager with memories (need to have sufficient) but don't have too much that they rot.


- [ ] Memory audit / cleaner agent in a cron job that checks that everything is up to date and also makes sure that titles, and descriptions can be easily picked up by context and by the recall subagent

- [ ] Merge the memory update subagent with a new agent: memory creator agent, (do this after you have st notifications) and find a way to run it in this directory or /memory directory without CLAUDE.md being injected.

- [ ] See if it's safe to remove pointers from CLAUDE.md after the memory recall subagent was introduced, do this after you can get st notifications for better auditing 

