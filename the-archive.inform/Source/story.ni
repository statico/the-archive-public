"The Archive PUBLIC VERSION REDACTED" by Ian Langworth

Part - Configuration

Use the serial comma, and American dialect.

Include Basic IF Help by Andrew Plotkin.
Include Conversation Framework by Eric Eve.
Include Conversation Responses by Eric Eve.
Include Conversational Defaults by Eric Eve.
Include Extended Grammar by Aaron Reed.
Include Basic Screen Effects by Emily Short.
Include Epistemology by Eric Eve.

When play begins, seed the random-number generator with 42. [make testing deterministic]

Instead of giving something to someone, try showing the noun to the second noun. [prefer to show things to the Custodian, not give them]

The carrying capacity of the player is 7.

Instead of taking inventory:
	say "You're carrying [a list of things carried by the player][if the player wears something]. You are wearing [a list of things worn by the player][end if]."

The new ending rule is listed instead of the print obituary headline rule in for printing the player's obituary. This is the new ending rule: say "*** GAME OVER ***[para](You can reload to start a new game.)"; abide by the immediately quit rule;

Part - General Help and Non-Game Bits

Section - Pre-Game Area

To say external-links -- running on:
	(- print "LINKEDIN GITHUB DOTFILES BLOG TWITTER EMAIL ABOUT SOURCE LINKS PERLBOOK GPGKEY HELP"; -).

Welcome is a room. "You have connected to Ian Langworth's archive.[para]Enter GAME to continue.[para]Other valid commands: [external-links][para]Hint: Page Up and Page Down scroll when on desktop.[para]Good luck!"

start-game is an action applying to nothing.
Understand "game" as start-game.
Carry out start-game:
	if the player is in Welcome, move the player to the West Side;
	otherwise say "You are already inside the Archive.";

openurl-github is an action out of world. Report openurl-github: say "OPENURL:https://github.com/statico". Understand "github" as openurl-github.

openurl-blog is an action out of world. Report openurl-blog: say "OPENURL:https://blog.langworth.com". Understand "blog" as openurl-blog.

openurl-perlbook is an action out of world. Report openurl-perlbook: say "OPENURL:https://www.oreilly.com/library/view/perl-testing-a/0596100922/". Understand "perlbook" as openurl-perlbook.

openurl-linkedin is an action out of world. Report openurl-linkedin: say "OPENURL:https://www.linkedin.com/in/ianlangworth". Understand "linkedin" as openurl-linkedin.

openurl-twitter is an action out of world. Report openurl-twitter: say "OPENURL:https://twitter.com/statico". Understand "twitter" as openurl-twitter.

openurl-dotfiles is an action out of world. Report openurl-dotfiles: say "OPENURL:https://github.com/statico/dotfiles". Understand "dotfiles" as openurl-dotfiles.

openurl-vim is an action out of world. Report openurl-vim: say "OPENURL:https://statico.github.io/vim.html". Understand "vim" as openurl-vim.

Help-email is a help-topic. The description is "You can email Ian at ian@langworth.com.". Understand "email" as help-email.

openurl-email is an action out of world. Understand "email" as openurl-email. Report openurl-email: say "OPENURL:mailto:ian@langworth.com".

Help-ian is a help-topic. The description is "Ian created this for fun. Maybe view the source of this page or check out his GitHub account. Try typing these: [external-links]". Understand "ian" as help-ian.

show-help-ian is an action out of world. Understand "ian" as show-help-ian. Carry out show-help-ian: Instead try help-invoking help-ian.

Help-resume is a help-topic. The description is "Ian's resume is not available online. Instead, check out his GitHub account, look him up on LinkedIn, or email him. Try typing these: [external-links]". Understand "resume" as help-resume.

show-help-resume is an action out of world. Understand "resume" as show-help-resume. Carry out show-help-resume: Instead try help-invoking help-resume.

show-credits is an action out of world. Report show-credits: say "OPENURL:https://github.com/statico/langterm#readme". Understand "about" as show-credits.

show-source is an action out of world. Report show-source: say "OPENURL:https://github.com/statico/langterm". Understand "source" as show-source.

show-links is an action out of world. Report show-links: say "OPENURL:https://statico.link". Understand "links" as show-links.

show-gpgkey is an action out of world. Report show-gpgkey: say "OPENURL:https://github.com/statico.gpg". Understand "gpgkey" as show-gpgkey.

try-unix-command is an action out of world. Understand "ls", "ps", "cd", "rm", "pwd" as try-unix-command. Report try-unix-command: say "Sorry, this isn't Unix. Try HELP"

try-dos-command is an action out of world. Understand "dir", "cls" as try-dos-command. Report try-dos-command: say "Sorry, this isn't DOS. Try HELP"

try-sudo-command is an action out of world. Understand "sudo" as try-sudo-command. Report try-sudo-command: say "You are not in the sudoers file. This incident will be reported."

save-restore-disabled is an action out of world. Understand "save" and "restore" as save-restore-disabled. Carry out save-restore-disabled: say "(Sorry, save and restore doesn't work. Your session ID is saved in your browser's local storage and will expire if you are idle for too long.)"

Section - VT220 Hacks

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

Section - Help Topics

Help-doors is a help-topic.
Understand "door" as help-doors.
The description is "Doors are things in the world that can be opened or closed. Some doors have handles, others have locks, and some even have keypads."

Help-keypad is a help-topic.
Understand "keypad", "key pad", "numpad", "num pad", "number pad", "numeric keypad" as help-keypad.
The description is "Keypads are used to unlock doors. If you see a keypad you can enter numbers on it. For example: 'enter 1234'."

Help-pile is a help-topic.
Understand "pile" as help-pile.
The description is "Piles are a collection of things that sit on the ground. It's hard to pick up a pile so sometimes you can't do that. Piles can also be searched as sometimes they contain hidden items."

Part - Reusable Things

Section - Debugging

Cheating is an action applying to nothing.
Understand "xyzzy" as cheating.
Instead of cheating, say "Nothing happens. Nice try!"

Section - Keypad

A keypad is a kind of thing.
	Understand "keypad", "numeric keypad", "number pad", "pad" as a keypad.
	A keypad has some text called the code.
	A keypad has a door called the controlled door.
	A keypad is scenery.
	The description is "A brushed metal numeric keypad with buttons. You guess that it controls [the controlled door]."

Instead of using a keypad, say "Try entering a number on the keypad, like ENTER 1234".
Instead of pushing a keypad, try using the noun.

Understand "enter code [text] on [something]", "enter [text] on [something]", "type [text] on [something]" as keypad-unlocking.
Understand "enter code [text]", "enter combination [text]", "enter [text]", "type [text]" as keypad-unlocking.
Understand "press keypad [text]", "press [text]", "tap [text]" as keypad-unlocking when any keypad is visible.
Understand "tap [something]" as pushing.

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
	let KP be the second noun;
	let door be the controlled door of KP;
	if door is unlocked:
		say "[The door] is already unlocked.";
		stop the action;
	let input be "[the topic understood]";
	if input matches the regular expression "\D":
		say "The keypad only has numbers on the buttons.";
		stop the action;
	let length be the number of characters in input;
	if length < the number of characters in the code of KP:
		say "Nothing happens for a few moments, and then the keypad emits a negative-sounding tone. Maybe the code needs more numbers?";
	otherwise if length > the number of characters in the code of KP:
		let iscorrect be true;
		repeat with N running from 1 to 4:
			let A be character number N in the code of KP;
			let B be character number N in input;
			if A is not B:
				now iscorrect is false;
		if iscorrect is true:
			say "The keypad chirps excitedly after the first [the number of characters in the code of KP] number[s]. From behind the door you hear a large whirring sound followed by a series of metallic clanks. The whirring stops and [the door] opens slowly.";
			now the door is unlocked;
			try silently opening the door;
		otherwise:
			say "The keypad emits a short negative-sounding beep after the first [the number of characters in the code of KP] number[s], but other than that nothing happens.";
	otherwise:
		if input is the code of KP:
			say "The keypad chirps excitedly. From behind the door you hear a large whirring sound followed by a series of metallic clanks. The whirring stops and [the door] opens slowly.";
			now the door is unlocked;
			try silently opening the door;
		otherwise:
			say "The keypad beeps negatively, but other than that nothing happens.";

Carry out unlocking:
	say "The door has no keyhole. The keypad appears to be the only means to unlock it."

Section - Powered Devices

A device can be powered or unpowered. A device is usually powered.

Understand "turn on [device]" as switching on.
Understand "turn off [device]" as switching off.

Definition: a device is unpowered if it is not powered.

Check an actor switching on an unpowered device (this is the cannot switch on powerless devices rule):
	if the player is the actor:
		say "[The noun] appears to be unpowered." instead;
	stop the action.

Section - Fillability

A thing is either fillable or unfillable. A thing is usually unfillable.
A thing is either pourable or unpourable. A thing is usually unpourable.

Filling is an action applying to one thing.
Understand "fill [something]" as filling.
Understand "fill up [something]" as filling.

Report filling (this is the default filling rule):
	say "Fill [the noun] with what?" instead;

Filling it with is an action applying to two things.
Understand "fill [something] in/with [something]" as filling it with.
Understand "fill up [something] in/with [something]" as filling it with.
Understand "pour [any pourable thing] in/into [something]" as filling it with (with nouns reversed).
Understand "tip [any pourable thing] in/into [something]" as filling it with (with nouns reversed).

Report filling it with (this is the default filling it with rule):
	if the noun is not fillable:
		say "[The noun] doesn't seem to be fillable.";
	otherwise if the second noun is not pourable:
		say "[The noun] doesn't seem to be something you can fill something else with.";
	otherwise:
		say "Ian didn't think to handle someone trying to fill [the noun] with [the second noun]. Maybe you should complain?";

Section - Keyless Unlocking

Unlocking keylessly is an action applying to one thing.
Understand "unlock [something]" as unlocking keylessly.
Understand "unlock [a locked lockable thing]" as unlocking keylessly.
Understand "unlock [a lockable thing]" as unlocking keylessly.

Section - Riding

Riding is an action applying to one thing.
Understand "ride [something]" as riding.

Report riding something (this is the default riding rule):
	if the player is not on a supporter:
		try entering the noun;
	if the noun is an enterable supporter:
		say "You make some 'yee-hah!' noises but go nowhere.";
	otherwise:
		say "[The noun] is not really something you can ride.";

Pedaling is an action applying to one thing.
Understand "pedal [something]" as pedaling.
A bicycle is kind of enterable supporter.

Report pedaling something (this is the default pedaling rule):
	if the player is not on a supporter:
		try entering the noun;
	if the holder of the player is a bicycle:
		say "You spin the pedals with your feet. Exciting!";
	otherwise:
		say "[The holder of the player] doesn't have any pedals.";

Section - Using

Using is an action applying to one thing.

Understand "use [something]" as using.

Report using something (this is the first using rule): 
	let verbword be word number 1 in the player's command; 
	say "I'm not sure how to [verbword] [the noun]. Can you be more specific, or try a different verb?".

Using it with is an action applying to two things.

Understand "pull [something] with [something]" as using it with.
Understand "push [something] with [something]" as using it with.
Understand "take [something] with [something]" as using it with.

Report using something with a second noun (this is the second using rule):
	let verbword be word number 1 in the player's command; 
	say "You can't [verbword] [the noun] with [the second noun].".

Section - Conductivity

A thing can be conductive or non-conductive. A thing is usually non-conductive.

A wire is a kind of thing. A wire is usually conductive.
A wire can be thick or thin. A wire is usually thin.
Understand "wire" as a wire.

Part - Outside

The Outside Area is a region.
	In it is the West Side, the North Side, the East Side, and the South Side.

The building is a backdrop. It is in the West Side, the North Side, the East Side, and the South Side. The description is "A single-story, aged, crumbling concrete building that appears to have been once been painted white. It stands as a solitary cube in the green grassy field." Understand "wall" as the building.

The grass is a backdrop. It is in the West Side, the North Side, the East Side, and the South Side. The description is "The lush, green grass under a clear sky reminds you of the Windows 95 wallpaper."

The West Side is a room.
	"You are standing on the west side of a small, concrete building. Surrounding the building is a field of lush, green grass that meets the horizon in every direction under a clear blue sky. The entrance to the building is bare. A [steel door] is recessed into a square concrete building. You can go around the building to the north and south."
	It is west of the North Side and west of the South Side.

The sky is a backdrop.
	"A wonderful blue cloudless sky extends to the horizon."
	It is in the Outside Area.

The field is a backdrop. It is in the Outside Area. "A lush field of healthy green grass that extends in all directions."

[The door is locked with a keypad. The player has to find the clue to the code.]

The steel door is a door. It is scenery. It is lockable and locked. It is east of the West Side and west of the Upper Staircase. "An old, tarnished, reinforced steel door appears to be the only way into the building. On the door is a numeric keypad."

Instead of going inside from the west side, try going the steel door.
Instead of examining inside when the player is in the Outside Area:
	if the steel door is open:
		say "It looks dark inside.";
	otherwise:
		say "It's impossible to look inside when the door is closed.";

Instead of unlocking keylessly the steel door when the steel door is locked, say "The door appears to be locked with a keypad."
Instead of unlocking keylessly the steel door when the steel door is unlocked, say "It is already unlocked."

The outside keypad code is always "0000".

A numeric keypad is here. It is a keypad.
	The code of the keypad is the outside keypad code.
	The controlled door of the keypad is the steel door.

Instead of attacking the steel door, say "[one of]That hurt.[or]That was painful.[or]Violence probably isn't the answer.[at random]".

[South Side has a clue to the code to the keypad.]

The South Side is a room. It is south of the West Side and south of the East Side. "The south side of the building is featureless other than a few cracked paint chips where the concrete was painted white a long time ago. You can go east and west."

A pile of debris is here. It is not portable. The description is "Bits of concrete and paint appear to have collected at the base of the wall."

Some paint chips are here. Understand "paint chips", "chips" as the paint chips. The paint chips are edible. After eating paint chips, say "You eat the paint chips. You feel a strange mental acuity." Instead of smelling the paint chips, say "The paint chips smell earthy and old."

To decide what text is the outside keypad code hint:
	let M be (the number of characters in the outside keypad code) - 1;
	repeat with N running from 1 to M:
		say character number N in the outside keypad code;
	decide on ""

The scrap of paper is a thing. The description of the scrap is "The piece of paper is a torn corner of a larger document. You can make out the numbers '[outside keypad code hint]' but the paper has rotted away where the last number was written." The paper can be found or lost. The paper is lost.

Understand "turn over [thing]", "turn [thing] over" as turning over.

Turning over is an action applying to one thing.

Instead of turning over the scrap of paper:
	say "The other side of the scrap of paper is blank."

Instead of turning the scrap of paper:
	try turning over the scrap of paper

Understand "inspect", "rummage", "rummage through" as searching.

Instead of examining the pile of debris when the paper is lost:
	try searching the noun;

Instead of searching the pile of debris when the paper is lost:
	now the paper is found;
	say "You rummage through the debris. It's mostly paint chips but you also find a scrap of paper.";
	move the scrap of paper to the South Side

[Player can walk to the other sides of the building.]

The North Side is a room. It is north of the West Side and north of the East Side. "The north side of the building is featureless and unremarkable. You can go east and west."

The East Side is a room. It is east of the North Side and east of the South Side. "The east side of the building is as plain as the rest. The concrete wall is cracked and has clearly been here for some time. You can go north and south."

The crack is scenery in the East Side. "A long, thin crack has appeared in the concrete, probably from the building settling over time."

[Entering the building begins the adventure.]

The Inside Area is a region. Inside the Inside Area is the Upper Staircase.

The Upper Staircase is inside from the West Side. "As you enter the small building, a fluorescent light flickers to life and reveals bare, unfinished concrete walls. In the center of the room an industrial-looking spiral staircase goes down into darkness."

[XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]
[The rest of the game has been redacted.]
[XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]
