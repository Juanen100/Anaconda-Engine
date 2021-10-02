## MOD SUPPORT GUIDE (STILL WIP, MORE STUFF COMING SOON)

In this document you'll find stuff related to the mod support on the Solar Engine.

![polyNo](https://raw.githubusercontent.com/Juanen100/Solar-Engine/master/art/polyNo.png)

To avoid using Polymod for the mod support, I coded in the game the mod support. Follow the steps in order to avoid problems

## CUSTOM CHARACTERS

First: You go into mods/custom_chars and you create a new folder called like the name of your character, like in the following image

![character_first](https://raw.githubusercontent.com/Juanen100/Solar-Engine/master/art/character_first.png)

Second: you put your character .png and .xml file on your character folder and you name both "char". It will always be "char" (i'll maybe change it on the future).

![character_second](https://raw.githubusercontent.com/Juanen100/Solar-Engine/master/art/character_second.png)

Third: On the custom_chars folder, you go into the custom_chars.jsonc file (open with either notepad or Visual Code) and do something like the following image

![character_third](https://raw.githubusercontent.com/Juanen100/Solar-Engine/master/art/character_third.png) 

Were it says "bf_wrk" goes your character name, it doens't matter what numbers you put on "icons"

Fourth: In the "custom_chars" folder, copy the template.json file and paste it with your characters name. Then rename the animations to whatever is on the .xml file. Like in the image!

![character_sixth_but_xd](https://raw.githubusercontent.com/Juanen100/Solar-Engine/master/art/character_sixth_but_xd.png)

Fifth: You finished creating your character HORAY! But there is another thing, the icon. For the icon you go (outside the mods folder) to assets/images/icons/betterIcons (or nomalIcons). From here you copy what ever icon you want and draw on top of it with the name of you character

![character_fourth](https://raw.githubusercontent.com/Juanen100/Solar-Engine/master/art/character_fourth.png) Something like this

Sixth and final step: Actually putting you character on the game, YAY! Remember the assets folder? You gotta go to assets/data, once you are there, go to this file: characterList.txt, and replace the template thing with your character name

![character_fifth](https://raw.githubusercontent.com/Juanen100/Solar-Engine/master/art/character_fifth.png)

To test the character, just press 7 in the song you want and change the player two to your character
