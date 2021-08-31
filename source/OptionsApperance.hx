package;

import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import Controls.KeyboardScheme;

class OptionsApperance extends MusicBeatState
{
	
	var selector:FlxText;
	var curSelected:Int = 0;

	var controlsStrings:Array<String> = [];

	private var grpControls:FlxTypedGroup<Alphabet>;

	override function create()
	{
		TheData.saveLoad();

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		controlsStrings = CoolUtil.coolTextFile(Paths.txt('controls'));
		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		controlsStrings = CoolUtil.coolStringFile(
			(FlxG.save.data.colour ? 'Color bar by Character' : 'Color bar classic') +
			"\n" + (FlxG.save.data.watermark ? "Watermark On" : "Watermark Off") +
			"\n" + (FlxG.save.data.betterIcons ? "Better Icons On" : "Better Icons Off") +
			"\n" + (FlxG.save.data.flashing ? "Flashing Lights On" : "Flashing Lights Off"));
		trace("Apperance Settings: " + controlsStrings);

		
		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...controlsStrings.length)
		{
				var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i], true, false);
				controlLabel.isMenuItem = true;
				controlLabel.targetY = i;
				grpControls.add(controlLabel);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}
		 

		super.create();

		//openSubState(new OptionsSubState()); lol
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if(controls.BACK)
			FlxG.switchState(new OptionsSelectState());
			trace("Apperance Settings: " + controlsStrings);
		if (controls.UP_P)
			changeSelection(-1);
		if (controls.DOWN_P)
			changeSelection(1);

		if (controls.ACCEPT)
			{
				if (curSelected != 5)
					grpControls.remove(grpControls.members[curSelected]);
				switch(curSelected)
				{
					case 0:
						FlxG.save.data.colour = !FlxG.save.data.colour;
						var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, (FlxG.save.data.colour ? 'Color bar by Character' : 'Color bar classic'), true, false);
						ctrl.isMenuItem = true;
						ctrl.targetY = curSelected - 1;
						grpControls.add(ctrl);
					case 1:
						FlxG.save.data.watermark = !FlxG.save.data.watermark;
						var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, (!FlxG.save.data.watermark ? 'Watermark Off' : 'Watermark On'), true, false);
						ctrl.isMenuItem = true;
						ctrl.targetY = curSelected - 1;
						grpControls.add(ctrl);
					case 2:
						FlxG.save.data.betterIcons = !FlxG.save.data.betterIcons;
						var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, (!FlxG.save.data.betterIcons ? "Better Icons Off" : "Better Icons On"), true, false);
						ctrl.isMenuItem = true;
						ctrl.targetY = curSelected - 1;
						grpControls.add(ctrl);
					case 3:
						FlxG.save.data.flashing = !FlxG.save.data.flashing;
						var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, (FlxG.save.data.flashing ? "Flashing Lights On" : "Flashing Lights Off"), true, false);
						ctrl.isMenuItem = true;
						ctrl.targetY = curSelected - 1;
						grpControls.add(ctrl);
				}
			}
		FlxG.save.flush();
	}

	function changeSelection(change:Int = 0)
		{
			#if !switch
			// NGio.logEvent('Fresh');
			#end
			
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
	
			curSelected += change;
	
			if (curSelected < 0)
				curSelected = grpControls.length - 1;
			if (curSelected >= grpControls.length)
				curSelected = 0;
	
			// selector.y = (70 * curSelected) + 30;
	
			var bullShit:Int = 0;
	
			for (item in grpControls.members)
			{
				item.targetY = bullShit - curSelected;
				bullShit++;
	
				item.alpha = 0.6;
				// item.setGraphicSize(Std.int(item.width * 0.8));
	
				if (item.targetY == 0)
				{
					item.alpha = 1;
					// item.setGraphicSize(Std.int(item.width));
				}
			}
		}
}
