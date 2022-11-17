# The Archive - PUBLIC REDACTED VERSION

This is the **public redacted version** of the text adventure game found on https://langworth.com. It's mostly the same source but without the initial puzzle secret and most of the story and secrets.

> 👉 **The file you probably want to look at is [`the archive.inform/Source/story.ni`](https://github.com/statico/the-archive-public/blob/master/the%20archive.inform/Source/story.ni).** 👈

It's built with [Inform 7](http://inform7.com/), a system for creating interactive fiction (IF) games like Zork. On the web site it runs in a CRT terminal emulator ([langterm](https://github.com/statico/langterm)) with a Z-machine HTTP server ([glulxe-httpd](https://github.com/statico/glulxe-httpd)).

You almost certainly want to read [Inform 7 for Programmers](http://www.ifwiki.org/index.php/Inform_7_for_Programmers).

![image](https://user-images.githubusercontent.com/137158/94717063-a6e96c00-0304-11eb-956c-24848b2a63e6.png)

## Development (macOS)

We'll install the IDE and use its pre-compiled tools, but I prefer to do development in the terminal using [glulxe](https://www.eblong.com/zarf/glulx/).

1. `brew cask install inform` - installs the IDE and compiler
1. `brew install glulxe frotz` - installs a command-line Glulx player and dfrotz for testing
1. Open the extensions folder from Inform.app (probably `~/Library/Inform/Extensions`) and download https://github.com/i7/archive and extract the contents there
1. Make sure the game compiles from Inform.app by opening `the-archive.inform` and clicking the "Go!" button.
1. `npm install -g nodemon` for an easy file watcher
1. Open three terminals:
1. `vim story.ni` - to edit the story (and install my port of the [vim-inform7](https://github.com/statico/vim-inform7) syntax file)
1. `nodemon -e ni -x ./build` - to build the .ulx file when the story changes
1. `nodemon -e ulx -w run -w . -x ./run` - to run a script through the game when the .ulx file changes

## Testing

1. To build a non-ncurses, text-only version of glulxe: Check out [glulxe](https://github.com/erkyrath/glulxe) and [cheapglk](https://github.com/erkyrath/cheapglk) beside each other. Build cheapglk and then glulxe. Copy the `glulxe` binary to `dglulxe` somewhere in your path. (The "d" is for "dumb.")

`./test` will compare the game's output against the saved snapshots.

Run `./test -s` to update the snapshots.

## Deploy

Run `RELEASE=1 ./build` and copy the `.ulx` file to the server.
