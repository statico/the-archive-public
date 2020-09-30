# The Archive (Public Version)

This is the public version of the text adventure game found on https://langworth.com. It's mostly the same source but without the initial puzzle secret and everything else inside.

It's built with [Inform 7](http://inform7.com/), a system for creating interactive fiction (IF) games like Zork. On the web site it runs in a CRT terminal emulator ([langterm](https://github.com/statico/langterm)) with a Z-machine HTTP server ([ifhttp](https://github.com/statico/ifhttp)).

## Getting started (macOS)

We'll install the IDE and use its pre-compiled tools, but development is best done on the command line because the IDE is buggy.

1. `brew cask install inform` - installs the IDE and tools
1. `brew install frotz` - installs a 
1. Open the extensions folder from Inform.app (probably `~/Library/Inform/Extensions`) and download https://github.com/i7/archive and extract the contents there
1. Make sure the game compiles from Inform.app by opening `The Archive.inform` and clicking the "Go!" button.
1. `npm install -g nodemon` for an easy file watcher
1. Open three terminals:
  1. `vim story.ni`
  1. `nodemon -e ni -x ./build`
  1. `nodemon -e z8 -x ./run`

## Deploying

Run `./push`
