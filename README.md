# Git Extras

Does *git* have enough commands yet?  It probably does, by any reasonable
measure, and yet here we are with a few more.  These commands are
for policy/convenience, they make it a little easier to perform some actions
around branching and re-basing in a consistent manner.  Hopefully the policy
implemented by these commands suits your workflow as much as it suits mine.

## Requirements

 * [makeshift](https://github.com/tim-rose/makeshift)
 * [midden](https://github.com/tim-rose/midden), for shell utility functions (arg-parsing, logging)

## Installation

If you have makeshift installed:

```bash
make install
```

Otherwise, you might try:
```
for file in *.sh; do install -m 755 $file /usr/local/bin/${file%.sh}; done
```

## Getting Started

### git-hist
### git-sync, git-blend
### git-new-branch, git-rm-branch

## TODO

 * man pages
 * bug: rm-branch assumes origin.

## Credits

Some of these commands have been inspired by the work of others.  Thanks to 
Glenn Maddern for [git-smart](https://github.com/geelen/git-smart),
and Adil Baig's 
[thoughtsimproved](https://thoughtsimproved.wordpress.com/2014/12/21/more-git-branches)
excellent summary of git's various branch-related commands.
