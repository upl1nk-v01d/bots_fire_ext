# COD4X Bot Warfare Weapon Fire Extension

First of all, the full credit goes to INeedGames/INeedBot(s) @ ineedbots@outlook.com

I greatly admire his work! 

I made an weapon firing modification for bots, so they may be more realistic.
Bots will fire with delay according to targeting distances.

The main purpose is to make bots more realistic with mod extensions without touching original files.

# Instructions

To use bots_fire_ext.gsc, you have to install Bot Warfare mod first.
Bot Warfare mod with instructions is available at link below:
https://github.com/ineedbots/cod4x_bot_warfare

Next, place the file bots_fire_ext.gsc in [COD4X]/mods/[yourMod]/scripts directory.

Put the following line below statement **level thread maps\mp\bots\_wp_editor::init();** in [COD4X]/mods/[yourMod]/maps/mp/gametypes/_callbacksetup.gsx. 

`level thread scripts\bots_fire_ext::init();`

In game make sure the DVAR is set to **bots_fire_ext 1**
