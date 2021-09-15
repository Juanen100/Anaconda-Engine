![lelogo](https://user-images.githubusercontent.com/65170591/131541948-3d792876-8f49-4430-9892-0e317cb77c93.png)

# Friday Night Funkin' JSW Engine

This is the repository for a mod of Friday Night Funkin, a game originally made for Ludum Dare 47 "Stuck In a Loop".

Play the Ludum Dare prototype here: https://ninja-muffin24.itch.io/friday-night-funkin
Play the Newgrounds one here: https://www.newgrounds.com/portal/view/770371
Support the project on the itch.io page: https://ninja-muffin24.itch.io/funkin

IF YOU MAKE A MOD AND DISTRIBUTE A MODIFIED / RECOMPILED VERSION, YOU MUST OPEN SOURCE YOUR MOD AS WELL

This Engine is highly inspired on Kade Engine

## Credits / shoutouts

- [ninjamuffin99](https://twitter.com/ninja_muffin99) - Programmer of Friday Night Funkin
- [PhantomArcade3K](https://twitter.com/phantomarcade3k) and [Evilsk8r](https://twitter.com/evilsk8r) - Artists of Friday Night Funkin
- [Kawaisprite](https://twitter.com/kawaisprite) - Musician of Friday Night Funkin

This game was made with love to Newgrounds and its community. Extra love to Tom Fulp.

## Credits of JSW Engine
- [Juanen100](https://twitter.com/Juanen1001) - JSW Engine Programmer (and the Logo artist

## Previews

![2021-08-30 19-58-40_Trim](https://user-images.githubusercontent.com/65170591/131385724-8db235b5-1935-4a4a-b4e9-a219ffb62080.gif)
![Tutorial (Hard) on Upscroll](https://user-images.githubusercontent.com/65170591/131541953-582da4c6-19af-4882-8299-2783a8b79f74.gif)
![MainMenuThingLel](https://user-images.githubusercontent.com/65170591/131541950-a27f8e4a-6769-424a-a049-001e323e8e9c.png)
![JAJASenpaiAngry](https://user-images.githubusercontent.com/65170591/131541945-b2515555-e3e6-486b-aaf4-11e8193a8db1.png)
![FreeplayWeird](https://user-images.githubusercontent.com/65170591/131541934-bdf0df39-a9fa-4662-98df-f984f603ab9d.png)

## New Stuff

- BotPlay (WIP, the idle doesn't work)
- Full Health Option if you are bad
- KeyBinds
- Health Bar Color by Character (Example: Pico = green)
- Better Icons (Winning Icons and Lose Icons to characters doens't have one)
- Light CPU Strums (imitate the Player notes)
- New Input and Old Input
- New Freeplay Menu
- New Pause Menu

## Build instructions

THESE INSTRUCTIONS ARE FOR COMPILING THE GAME'S SOURCE CODE!!!

IF YOU WANT TO JUST DOWNLOAD AND INSTALL AND PLAY THE GAME NORMALLY, GO TO ITCH.IO TO DOWNLOAD THE GAME FOR PC, MAC, AND LINUX!!

https://ninja-muffin24.itch.io/funkin

IF YOU WANT TO COMPILE THE GAME YOURSELF, CONTINUE READING!!!

### Installing the Required Programs

First, you need to install Haxe and HaxeFlixel. I'm too lazy to write and keep updated with that setup (which is pretty simple). 
1. [Install Haxe 4.1.5](https://haxe.org/download/version/4.1.5/) (Download 4.1.5 instead of 4.2.0 because 4.2.0 is broken and is not working with gits properly...)
2. [Install HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/) after downloading Haxe

Other installations you'd need are the additional libraries, a fully updated list will be in `Project.xml` in the project root. Currently, these are all of the things you need to install:
```
flixel
flixel-addons
flixel-ui
hscript
newgrounds
```
So for each of those type `haxelib install [library]` so shit like `haxelib install newgrounds`

You'll also need to install a couple things that involve Gits. To do this, you need to do a few things first.
1. Download [git-scm](https://git-scm.com/downloads). Works for Windows, Mac, and Linux, just select your build.
2. Follow instructions to install the application properly.
3. Run `haxelib git polymod https://github.com/larsiusprime/polymod.git` to install Polymod.
4. Run `haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc` to install Discord RPC.

You should have everything ready for compiling the game! Follow the guide below to continue!

At the moment, you can optionally fix the transition bug in songs with zoomed-out cameras.
- Run `haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons` in the terminal/command-prompt.

### Ignored files

Because, I added directly the APIStuff.hx on the Github repository, this section is basically useless lol

### Compiling game

Once you have all those installed, it's pretty easy to compile the game. You just need to run 'lime test html5 -debug' in the root of the project to build and run the HTML5 version. (command prompt navigation guide can be found here: [https://ninjamuffin99.newgrounds.com/news/post/1090480](https://ninjamuffin99.newgrounds.com/news/post/1090480))
To run it from your desktop (Windows, Mac, Linux) it can be a bit more involved. For Linux, you only need to open a terminal in the project directory and run 'lime test linux -debug' and then run the executable file in export/release/linux/bin. For Windows, you need to install Visual Studio Community 2019. While installing VSC, don't click on any of the options to install workloads. Instead, go to the individual components tab and choose the following:
* MSVC v142 - VS 2019 C++ x64/x86 build tools
* Windows SDK (10.0.17763.0)

Once that is done you can open up a command line in the project's directory and run `lime test windows -debug`. Once that command finishes (it takes forever even on a higher end PC), you can run FNF from the .exe file under export\release\windows\bin
As for Mac, 'lime test mac -debug' should work, if not the internet surely has a guide on how to compile Haxe stuff for Mac.

### Additional guides

- [Command line basics](https://ninjamuffin99.newgrounds.com/news/post/1090480)
