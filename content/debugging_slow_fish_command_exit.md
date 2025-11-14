---
date: 2025-11-13
tags: notes, macos, fish, shell
---
# Debugging fish shell slow exit when command fails

With the help of https://fishshell.com/docs/current/prompt.html

```sh
ls .ll  # if `.ll` does not exist, this is super slow to exit
        # similarly any other failing command does the same

fish --no-config  # verified that in a new terminal, slow exit does not happen
                  # hypothesize that slowness is due to something in the prompt

fish_config prompt show  # shows all built-in prompts
fish_config prompt choose simple
funcsave fish_prompt  # make prompt choice persist

# other things
funced fish_prompt  # edit the current prompt and save the result for this session only
```

I suspect the culprit was the vcs check in the default prompt.

