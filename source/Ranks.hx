import flixel.FlxG;

class Ranks
{
    public static var ranking:String = "NA";
    public static function generateLetterRank() // generate a letter ranking
    {
		if(FlxG.save.data.botplay)
			ranking = "BotPlay";

        if (PlayState.misses == 0 && PlayState.bads == 0 && PlayState.shits == 0 && PlayState.goods == 0) // Marvelous (SICK) Full Combo
            ranking = "(MFC)";
        else if (PlayState.misses == 0 && PlayState.bads == 0 && PlayState.shits == 0 && PlayState.goods >= 1) // Good Full Combo (Nothing but Goods & Sicks)
            ranking = "(GFC)";
        else if (PlayState.misses == 0) // Regular FC
            ranking = "(FC)";
        else if (PlayState.misses < 10) // Single Digit Combo Breaks
            ranking = "(SDCB)";
        else
            ranking = "(Clear)";

        // WIFE TIME :)))) (based on Wife3)

        var wifeConditions:Array<Bool> = [
            PlayState.accuracy >= 99.9935, // P
			PlayState.accuracy >= 99.980, // X
			PlayState.accuracy >= 99.950, // X-
			PlayState.accuracy >= 99.90, // SS+
			PlayState.accuracy >= 99.80, // SS
			PlayState.accuracy >= 99.70, // SS-
			PlayState.accuracy >= 99.50, // S+
			PlayState.accuracy >= 99, // S
			PlayState.accuracy >= 96.50, // S-
			PlayState.accuracy >= 93, // A+
			PlayState.accuracy >= 90, // A
			PlayState.accuracy >= 85, // A-
			PlayState.accuracy >= 80, // B
			PlayState.accuracy >= 70, // C
			PlayState.accuracy >= 60, // D
			PlayState.accuracy < 60 // E
        ];

        for(i in 0...wifeConditions.length)
        {
            var b = wifeConditions[i];
            if (b)
            {
                switch(i) //I'll change it later
                {
                    case 0:
						ranking = "P";
					case 1:
						ranking = "X";
					case 2:
						ranking = "X-";
					case 3:
						ranking = "SS+";
					case 4:
						ranking = "SS";
					case 5:
						ranking = "SS-";
					case 6:
						ranking = "S+";
					case 7:
						ranking = "S";
					case 8:
						ranking = "S-";
					case 9:
						ranking = "A+";
					case 10:
						ranking = "A";
					case 11:
						ranking = "A-";
					case 12:
						ranking = "B";
					case 13:
						ranking = "C";
					case 14:
						ranking = "D";
					case 15:
						ranking = "E";
                }
                break;
            }
        }

        if (PlayState.accuracy == 0)
            ranking = "NA";
		else if(FlxG.save.data.botplay)
			ranking = "BotPlay";

        return ranking;
    }
    
    public static function CalculateRating(noteDiff:Float, ?customSafeZone:Float):String // Generate a judgement through some timing shit
    {

        var customTimeScale = Conductor.timeScale;

        if (customSafeZone != null)
            customTimeScale = customSafeZone / 166;
	    
        if (noteDiff > 166 * customTimeScale) // so god damn early its a miss
            return "miss";
        if (noteDiff > 135 * customTimeScale) // way early
            return "shit";
        else if (noteDiff > 90 * customTimeScale) // early
            return "bad";
        else if (noteDiff > 45 * customTimeScale) // your kinda there
            return "good";
        else if (noteDiff < -45 * customTimeScale) // little late
            return "good";
        else if (noteDiff < -90 * customTimeScale) // late
            return "bad";
        else if (noteDiff < -135 * customTimeScale) // late as fuck
            return "shit";
        else if (noteDiff < -166 * customTimeScale) // so god damn late its a miss
            return "miss";
        return "sick";
    }
}