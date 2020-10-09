# The Archive

👉 **The file you probably want to look at is [`The Archive.inform/Source/story.ni`](https://github.com/statico/the-archive-public/blob/master/The%20Archive.inform/Source/story.ni).** 👈

This is the public version of the text adventure game found on https://langworth.com. It's mostly the same source but without the initial puzzle secret and everything else inside.

It's built with [Inform 7](http://inform7.com/), a system for creating interactive fiction (IF) games like Zork. On the web site it runs in a CRT terminal emulator ([langterm](https://github.com/statico/langterm)) with a Z-machine HTTP server ([ifhttp](https://github.com/statico/ifhttp)).

You almost certainly want to read [Inform 7 for Programmers](http://www.ifwiki.org/index.php/Inform_7_for_Programmers).

![image](https://user-images.githubusercontent.com/137158/94717063-a6e96c00-0304-11eb-956c-24848b2a63e6.png)

## Getting started (macOS)

We'll install the IDE and use its pre-compiled tools, but I prefer to do development in the terminal using [glulxe](https://www.eblong.com/zarf/glulx/).

The `build` command will build a Glulx game file with debug commands unless you specify `RELEASE=1`, in which case it will build a Z8 file. (You can use `frotz` to play Z8 game files.)

In debug mode (`DEBUG=1`), the game will build a Glulx game file with debug commands (`showme`, `showverb`, etc.) because debugging stuff won't fit in the max Z8 VM size. In non-debug mode, it will build a Z8 file.

1. `brew cask install inform` - installs the IDE and compiler
1. `brew install glulxe` - installs a command-line Glulx player
1. Open the extensions folder from Inform.app (probably `~/Library/Inform/Extensions`) and download https://github.com/i7/archive and extract the contents there
1. Make sure the game compiles from Inform.app by opening `The Archive.inform` and clicking the "Go!" button.
1. `npm install -g nodemon` for an easy file watcher
1. Open three terminals:
1. `vim story.ni` - to edit the story (and install my port of the [vim-inform7](https://github.com/statico/vim-inform7) syntax file)
1. `nodemon -e ni -x ./build` - to build the .ulx file when the story changes
1. `nodemon --signal SIGKILL -e ulx -w run -w . -x ./run` - to run a script through the game when the .ulx file changes

Or run `glulxe output.ulx` to play interactively.
