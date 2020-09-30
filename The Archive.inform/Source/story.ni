"The Archive" by Ian Langworth

[This is the PUBLIC version of the game. Most of the game has been removed.]

Part 0 - Configuration

Use scoring, the serial comma, and American dialect.

Include Basic IF Help by Andrew Plotkin.
Include Conversation Framework by Eric Eve. [TODO: Conversation Rules]

Part 1 - General Help and Non-Game Bits

Section 1 - Pre-Game Area

To say external-links -- running on:
	(- print "~github~ ~linkedin~ ~blog~ ~twitter~ ~perlbook~ ~dotfiles~ ~keybase~ ~email~ ~about~ ~help~"; -).

Welcome is a room. "You have connected to Ian Langworth's archive. Type 'game' to play the text adventure game.[para]Type 'look' or 'go north' to look and move around. Try other commands. Type 'help' if you need help or hints. Use the page-up and page-down keys to scroll.[para]Other valid commands: [external-links]"

Understand "game" as start-game.
	start-game is an action applying to nothing.
	Carry out start-game:
		if the player is in Welcome, move the player to the West Side;
		otherwise say "You are already inside the Archive.";

openurl-github is an action out of world. Report openurl-github: say "OPENURL:https://github.com/statico". Understand "github" as openurl-github.

openurl-blog is an action out of world. Report openurl-blog: say "OPENURL:https://statico.github.io". Understand "blog" as openurl-blog.

openurl-perlbook is an action out of world. Report openurl-perlbook: say "OPENURL:https://shop.oreilly.com/product/9780596100926.do". Understand "perlbook" as openurl-perlbook.

openurl-linkedin is an action out of world. Report openurl-linkedin: say "OPENURL:https://www.linkedin.com/in/ianlangworth". Understand "linkedin" as openurl-linkedin.

openurl-twitter is an action out of world. Report openurl-twitter: say "OPENURL:https://twitter.com/statico". Understand "twitter" as openurl-twitter.

openurl-dotfiles is an action out of world. Report openurl-dotfiles: say "OPENURL:https://github.com/statico/dotfiles". Understand "dotfiles" as openurl-dotfiles.

openurl-keybase is an action out of world. Report openurl-keybase: say "OPENURL:https://keybase.io/statico". Understand "keybase" as openurl-keybase.

Help-email is a help-topic. The description is "You can email Ian at ian@xxxxxxxxxxxx.com.". Understand "email" as help-email.

openurl-email is an action out of world. Understand "email" as openurl-email. Report openurl-email: say "OPENURL:mailto:ian@xxxxxxxxxxxx.com".

Help-ian is a help-topic. The description is "Ian created this for fun. Maybe view the source of this page or check out his GitHub account. Try typing these: [external-links]". Understand "ian" as help-ian.

show-help-ian is an action out of world. Understand "ian" as show-help-ian. Carry out show-help-ian: Instead try help-invoking help-ian.

Help-resume is a help-topic. The description is "Ian's resume is not available online. Instead, check out his GitHub account, look him up on LinkedIn, or email him. Try typing these: [external-links]". Understand "resume" as help-resume.

show-help-resume is an action out of world. Understand "resume" as show-help-resume. Carry out show-help-resume: Instead try help-invoking help-resume.

show-credits is an action out of world. Report show-credits: say "'The Archive' is an interactive fiction game made by Ian Langworth using Inform7 and displayed with WebGL. VT520 photo by Ratko Grbic. Apple II font by KreativeKorp. CRT styled scanline shader by Timothy Lottes. View Page Source for more information." Understand "about" as show-credits.

try-unix-command is an action out of world. Understand "ls" and "ps" and "cd" as try-unix-command. Report try-unix-command: say "Sorry, this isn't Unix. Try HELP"

try-dos-command is an action out of world. Understand "dir" as try-dos-command. Report try-dos-command: say "Sorry, this isn't DOS. Try HELP"

Section 2 - VT220 Hacks

The display banner rule does nothing.

[Shorten newlines to make better use of vertical space.]
To say br -- running on: (- print ""; -).
To say paragraph break -- running on: (- print " "; -).

[Copied from the Standard Rules, but added "in upper case"]
The room description heading rule does nothing. The new room description heading rule is listed first in the carry out looking rules. Carry out looking (this is the new room description heading rule):
	say bold type;
	if the visibility level count is 0:
		begin the printing the name of a dark room activity;
		if handling the printing the name of a dark room activity:
			say "Darkness" (A);
		end the printing the name of a dark room activity;
	otherwise if the visibility ceiling is the location:
		say "[visibility ceiling]" in upper case; [<------]
	otherwise:
		say "[The visibility ceiling]" in upper case; [<------]
	say roman type;
	let intermediate level be the visibility-holder of the actor;
	repeat with intermediate level count running from 2 to the visibility level count:
		if the intermediate level is a supporter or the intermediate level is an animal:
			say " (on [the intermediate level])" (B);
		otherwise:
			say " (in [the intermediate level])" (C);
		let the intermediate level be the visibility-holder of the intermediate level;
	[say line break;]
	[say run paragraph on with special look spacing.]

Section 3 - Help Topics

Help-doors is a help-topic.
Understand "door" as help-doors.
The description is "Doors are things in the world that can be opened or closed. Some doors have handles, others have locks, and some even have keypads."

Help-keypad is a help-topic.
Understand "keypad", "key pad", "numpad", "num pad", "number pad", "numeric keypad" as help-keypad.
The description is "Keypads are used to unlock doors. If you see a keypad you can enter numbers on it. For example: 'enter 1234'."

Help-pile is a help-topic.
Understand "pile" as help-pile.
The description is "Piles are a collection of things that sit on the ground. It's hard to pick up a pile so sometimes you can't do that. Piles can also be searched as sometimes they contain hidden items."

Part 2 - Reusable Things

Section 1 - Keypad

A keypad is a kind of thing.
	A keypad has some text called the code.
	A keypad has a door called the controlled door.
	A keypad is scenery.
	The description is "A brushed metal numeric keypad with buttons. You guess that it controls [the controlled door]."

Understand "enter code [text] on [something]" and "enter [text] on [something]" and "type [text] on [something]" as keypad-unlocking.

Understand "enter code [text]" and "enter [text]" and "type [text]" as keypad-unlocking.

Keypad-unlocking is an action applying to one topic and one thing.

Rule for supplying a missing second noun while keypad-unlocking:
	if the player can touch a keypad (called target):
		now the second noun is the target;
	otherwise:
		say "There is no keypad here on which you can enter a code." instead.

Carry out keypad-unlocking the topic understood:
	if the second noun is not a keypad:
		say "You can't enter a code on that.";
		stop the action;
	let input be "[the topic understood]";
	let length be the number of characters in input;
	let KP be the second noun;
	if length < the number of characters in the code of KP:
		say "Nothing happens.";
	otherwise if length > the number of characters in the code of KP:
		say "The keypad emits a short beep after the first [the number of characters in the code of KP] number[s], but other than that nothing happens.";
	otherwise:
		if input is the code of KP:
			say "The keypad beeps twice. From behind the door you hear a large whirring sound followed by a series of metallic clanks. The whirring stops and [the controlled door of KP] opens slowly.";
			now the controlled door of KP is unlocked;
			try silently opening the controlled door of KP;
		otherwise:
			say "The keypad beeps, but other than that nothing happens.";

Part 3 - Outside

The Outside Area is a region.
	In it is the West Side, the North Side, the East Side, and the South Side.

The West Side is a room.
	"You are standing on the west side of a small, concrete building. Surrounding the building is a field of lush, green grass that meets the horizon in every direction under a clear blue sky. The entrance to the building is bare. A faded door is recessed into a square concrete building. You can go around the building to the north and south."
	It is west of the North Side and west of the South Side.

The sky is a backdrop.
	"A wonderful blue cloudless sky extends to the horizon."
	It is in the Outside Area.

The field is a backdrop. It is in the Outside Area. "A lush field of healthy green grass that extends in all directions."

[The door is locked with a keypad. The player has to find the clue to the code.]

The faded door is a door. It is scenery. It is lockable and locked. It is east of the West Side and west of the Upper Staircase. "An old but clearly reinforced door appears to be the only way into the building. On the door is a numeric keypad."

The outside keypad code is always "1234".

A numeric keypad is here. It is a keypad.
	The code of the keypad is the outside keypad code.
	The controlled door of the keypad is the faded door.

Instead of attacking the faded door,
	say "[one of]That hurt.[or]That was painful.[or]Violence probably isn't the answer.[at random]".

Understand "kick [thing]" as attacking.

[South Side has a clue to the code to the keypad.]

The South Side is a room. It is south of the West Side and south of the East Side. "The south side of the building is featureless other than a few cracked paint chips where the concrete was painted white a long time ago. You can go east and west."

A pile of debris is here. It is not portable. The description is "Bits of concrete and paint appear to have collected at the base of the wall.[if the scrap of paper is lost] Something seems out of place and you feel compelled to search through the pile for something more.[end if]"

Some paint chips are a thing. The paint chips can be found or lost. The paint chips are lost. The paint chips are inedible. Instead of eating paint chips: say "Eating paint chips wouldn't be a good idea."

To decide what text is the outside keypad code hint:
	let M be (the number of characters in the outside keypad code) - 1;
	repeat with N running from 1 to M:
		say character number N in the outside keypad code;
	decide on ""

The scrap of paper is a thing. The description of the scrap is "The piece of paper is a torn corner of a larger document. You can make out the numbers '[outside keypad code hint]' but the rest has been torn away." The paper can be found or lost. The paper is lost.

Understand "inspect" and "rummage through" as searching.

Instead of searching the pile of debris when the paper is lost:
	now the paper is found;
	now the paint chips are found;
	say "You rummage through the debris. It's mostly paint chips but you also find a scrap of paper.";
	move the paint chips to the South Side;
	move the scrap of paper to the South Side

[Player can walk to the other sides of the building.]

The North Side is a room. It is north of the West Side and north of the East Side. "The north side of the building is featureless and unremarkable. You can go east and west."

The East Side is a room. It is east of the North Side and east of the South Side. "The east side of the building is as plain as the rest. The concrete wall is cracked and has clearly been here for some time. You can go north and south."

[Entering the building begins the adventure.]

The Inside Area is a region. Inside the Inside Area is the Upper Staircase.

The Upper Staircase is inside from the West Side. "This is where the public version ends."
