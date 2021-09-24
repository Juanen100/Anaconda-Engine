package;

import lime.math.ColorMatrix;
import openfl.Lib;
import Options;
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
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import lime.utils.Assets;

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	var options:Array<OptionCatagory> = [
		new OptionCatagory("Gameplay", [
			new InputOption(""),
			new DownscrollOption(""),
			new CpuStrums(""),
			new Reset("")
		]),
		new OptionCatagory("Appareance", [
			new Colour(""),
			new BetterIcon(""), 
			new FlashingLightsOption("")
		]),
		new OptionCatagory("Misc", [
			new Health(""),
			new BotPlay(""),
			#if !web
			new Haxeflixel(""),
			#end
			new ResetSettings("")
		]),
		new OptionCatagory("Controls", [
			new ControlOption()
		])
	];

	private var currentDescription:String = "";
	private var grpControls:FlxTypedGroup<Alphabet>;

	var currentSelectedCat:OptionCatagory;

	override function create()
	{
		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menuDesat"));

		menuBG.color = 0xFF00D310;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...options.length)
		{
			var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getName(), true, false);
			controlLabel.isMenuItem = true;
			controlLabel.targetY = i;
			grpControls.add(controlLabel);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}

		super.create();
	}

	var isCat:Bool = false;
	
	function truncateFloat( number : Float, precision : Int): Float {
		var num = number;
		num = num * Math.pow(10, precision);
		num = Math.round( num ) / Math.pow(10, precision);
		return num;
		}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

			if (controls.BACK && !isCat)
			{
				FlxG.switchState(new MainMenuState());
				FlxTween.tween(FlxG.camera, { zoom: -2}, 0.4, { ease: FlxEase.expoIn});
				FlxTween.tween(FlxG.camera, { angle: -90}, 0.4, { ease: FlxEase.expoIn});
			}
			else if (controls.BACK)
			{
				isCat = false;
				grpControls.clear();
				for (i in 0...options.length)
					{
						var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getName(), true, false);
						controlLabel.isMenuItem = true;
						controlLabel.targetY = i;
						grpControls.add(controlLabel);
						// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
					}
				curSelected = 0;
			}
			if (FlxG.keys.justPressed.UP)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeSelection(-1);
				}
	
				if (FlxG.keys.justPressed.DOWN)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeSelection(1);
				}
			
			if (isCat)
			{
				switch(currentSelectedCat.getOptions()[curSelected].getDisplay())
				{
					case 'FPS Cap':
						var fps = (cast (Lib.current.getChildAt(0), Main)).getFPSCap();

						if (FlxG.keys.pressed.RIGHT && fps < 285) // actual cap is 285
						{
							(cast (Lib.current.getChildAt(0), Main)).setFPSCap(fps + 10);
							FlxG.save.data.fpsCap = fps + 10;
						}
		
						if (FlxG.keys.pressed.LEFT && fps > 60)
						{
							(cast (Lib.current.getChildAt(0), Main)).setFPSCap(fps - 10);
							FlxG.save.data.fpsCap = fps - 10;
						}
		
						
					case 'Scroll Speed':
						if (FlxG.keys.justPressed.RIGHT)
							FlxG.save.data.scrollSpeed += 0.1;
		
						if (FlxG.keys.justPressed.LEFT)
							FlxG.save.data.scrollSpeed -= 0.1;

						// caps

						if (FlxG.save.data.scrollSpeed < 1)
							FlxG.save.data.scrollSpeed = 1;

						if (FlxG.save.data.scrollSpeed > 10)
							FlxG.save.data.scrollSpeed = 10;
					default:
						if (FlxG.keys.pressed.RIGHT)
							FlxG.save.data.offset += 0.01;
		
						if (FlxG.keys.pressed.LEFT)
							FlxG.save.data.offset -= 0.01;
						
				}
			}
			else
			{
				if (FlxG.keys.pressed.RIGHT)
					FlxG.save.data.offset+= 0.01;

				if (FlxG.keys.pressed.LEFT)
					FlxG.save.data.offset-= 0.01;
			
			}
		

			if (controls.ACCEPT)
			{
				if (isCat)
				{
					if (currentSelectedCat.getOptions()[curSelected].press()) {
						grpControls.remove(grpControls.members[curSelected]);
						var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, currentSelectedCat.getOptions()[curSelected].getDisplay(), true, false);
						ctrl.isMenuItem = true;
						grpControls.add(ctrl);
					}
				}
				else
				{
					currentSelectedCat = options[curSelected];
					isCat = true;
					grpControls.clear();
					for (i in 0...currentSelectedCat.getOptions().length)
						{
							var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, currentSelectedCat.getOptions()[i].getDisplay(), true, false);
							controlLabel.isMenuItem = true;
							controlLabel.targetY = i;
							grpControls.add(controlLabel);
							// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
						}
					curSelected = 0;
				}
			}
		FlxG.save.flush();
	}

	var isSettingControl:Bool = false;

	function changeSelection(change:Int = 0)
	{
		#if !switch
		// NGio.logEvent("Fresh");
		#end

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