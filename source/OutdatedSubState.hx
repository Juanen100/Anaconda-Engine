package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465',
		'#bd06c9',
		'#50ce73',
		'#f4f4dc'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('week54prototype', 'shared'));
		bg.scale.x *= 1.55;
		bg.scale.y *= 1.55;
		bg.screenCenter();
		add(bg);
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Your JSW Engine is outdated!\nYou are on "
			+ MainMenuState.versionlol
			+ "\nwhile the most recent version is " + needVer + "."
			+ "\n\nPress Space to go to Github\nor ESCAPE to ignore this",
			32);

		if (MainMenuState.preRelease != "")
			txt.text = 
			"You are on\n"
			+ MainMenuState.versionlol
			+ "\nWhich is a BETA BUILD!"
			+ "\n\nReport all bugs to the author of the pre-release.\nSpace/Escape ignores this.";
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
		
		FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
			if(colorRotation < (bgColors.length - 1)) colorRotation++;
			else colorRotation = 0;
		}, 0);
		
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT && MainMenuState.preRelease == "")
		{
			epicOpenUrl("https://github.com/Juanen100/JWB-Engine" + needVer);
		}
		else if (controls.ACCEPT)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}