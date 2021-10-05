package;

import flixel.group.FlxGroup;
import haxe.Exception;
import openfl.geom.Matrix;
import openfl.display.BitmapData;
import flixel.system.FlxSound;
import flixel.util.FlxAxes;
import flixel.FlxSubState;
import OptionsMenu.Option;
import flixel.input.FlxInput;
import flixel.input.keyboard.FlxKey;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import lime.app.Application;
import lime.utils.Assets;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.input.FlxKeyManager;


class DaResult extends MusicBeatState
{
    public var text:FlxText;
    public var comboText:FlxText;

    //var daTextGrup:FlxTypedGroup<FlxText>; test ¯\_(ツ)_/¯

    override function create() 
    {
        var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image("main_menu/menuDesat"));

		menuBG.color = 0xFFEA00F9;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

        if(!FlxG.sound.music.playing)
        {
            if(FlxG.save.data.remix)
                {
                    FlxG.sound.playMusic(Paths.music('freakyMenuRemix'), 0);
                }
                else
                    FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);    
        }

        text = new FlxText(10, 0, 0,"Song Finished!");
        text.size = 34;
        text.setFormat("assets/fonts/Funkin.otf", 42, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        text.color = FlxColor.WHITE;
        //text.screenCenter(X);
       // text.screenCenter(Y);
        text.scrollFactor.set();
        add(text);

        var sicks = PlayState.sicks;
        var goods = PlayState.goods;
        var bads = PlayState.bads;
        var shits = PlayState.shits;
        var accuracy = PlayState.accuracy;

        comboText = new FlxText(0,75,0,'Sicks - ${sicks}\nGoods - ${goods}\nBads - ${bads}\n\nShits: ${(shits)}\nMisses: ${(PlayState.misses)}\nScore: ${PlayState.songScore} \nAccuracy: ${truncateFloat(accuracy, 2)}%\nRanking: ${Ranks.generateLetterRank()}
        ');
        comboText.size = 28;
        comboText.setFormat("assets/fonts/Funkin.otf", 36, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        comboText.color = FlxColor.WHITE;
        comboText.scrollFactor.set();
        add(comboText);

        var score = PlayState.songScore;
        if (PlayState.isStoryMode)
        {
            score = PlayState.campaignScore;
            text.text = "Week Finished!";
        }    
    }

    function truncateFloat( number : Float, precision : Int): Float {
		var num = number;
		num = num * Math.pow(10, precision);
		num = Math.round( num ) / Math.pow(10, precision);
		return num;
		} //Just so it doesn't show a REALLY big number on the accuracy

    override function update(elapsed:Float)
    {
        if(controls.ACCEPT)
        {
            if(PlayState.isStoryMode)
            {
                trace("Going to story");
                FlxG.switchState(new StoryMenuState());
            }
            else
            {
                trace("Going to freplay");
                FlxG.switchState(new FreeplayState());
            }
        }

        if(controls.BACK) //Just the same thing as the accept controls LOL
            {
                if(PlayState.isStoryMode)
                {
                    trace("Going to story");
                    FlxG.switchState(new StoryMenuState());
                }
                else
                {
                    trace("Going to freplay");
                    FlxG.switchState(new FreeplayState());
                }
            }
    }
}