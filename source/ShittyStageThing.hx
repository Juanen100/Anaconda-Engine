package;

#if sys
import sys.io.File;
import sys.FileSystem;
import openfl.utils.Assets;
#end
import haxe.Json;
import haxe.format.JsonParser;
import Song;

using StringTools;

typedef StageFile = {
	var directory:String;
	var defaultZoom:Float;
	var isPixelStage:Bool;

	var boyfriend:Array<Dynamic>;
	var girlfriend:Array<Dynamic>;
	var opponent:Array<Dynamic>;
}

class ShittyStageThing {
	public static var forceNextDirectory:String = null;
	public static function loadDirectory(SONG:SwagSong) {
		var stage:String = '';
		if(SONG.stage != null) {
			stage = SONG.stage;
		} else if(SONG.song != null) {
			switch (SONG.song.toLowerCase().replace(' ', '-'))
			{
				case 'spookeez' | 'south' | 'monster':
					stage = 'spooky';
				case 'pico' | 'blammed' | 'philly' | 'philly-nice':
					stage = 'philly';
				case 'milf' | 'satin-panties' | 'high':
					stage = 'limo';
				case 'cocoa' | 'eggnog':
					stage = 'mall';
				case 'winter-horrorland':
					stage = 'mallEvil';
				case 'senpai' | 'roses':
					stage = 'school';
				case 'thorns':
					stage = 'schoolEvil';
				default:
					stage = 'stage';
			}
		} else {
			stage = 'stage';
		}

		forceNextDirectory = getStageFile(stage).directory;
	}

	public static function getStageFile(stage:String):StageFile {
		var rawJson:String = null;
		var path:String = Paths.getModsShit('custom_stages/' + PlayState.SONG.stage + '.json');

		var modPath:String = Paths.getModsShit('custom_stages/' + PlayState.SONG.stage + '.json');
		if(FileSystem.exists(modPath)) {
			rawJson = File.getContent(modPath);
		} else {
			rawJson = File.getContent(path);
		}
		return cast Json.parse(rawJson);
	}
}