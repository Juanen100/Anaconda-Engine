package;

import flixel.FlxG;

class TheData 
{
    //This is the copy of the copy (The copy of Newb Engine, copied from Kade Engine, kade if u are seeing this dont kill me plz)
    public static function saveLoad() 
    {
        if(FlxG.save.data.dfjk == null)
            FlxG.save.data.dfjk = true;

        if(FlxG.save.data.newInput == null)
            FlxG.save.data.newInput = true;
    
        if(FlxG.save.data.downscroll == null)
            FlxG.save.data.downscroll = false;

        if(FlxG.save.data.cpuStrums == null)
            FlxG.save.data.cpuStrums = false;

        if(FlxG.save.data.colour == null)
            FlxG.save.data.colour = true;

        if(FlxG.save.data.watermark == null)
            FlxG.save.data.watermark = true;
    
        if(FlxG.save.data.betterIcons == null)
            FlxG.save.data.betterIcons = true;

        if(FlxG.save.data.flashing == null)
            FlxG.save.data.flashing = true;

        if(FlxG.save.data.health == null)
            FlxG.save.data.health = false;
    }

    public static function resetSave()
    {
        FlxG.save.data.dfjk = null;
        FlxG.save.data.newInput = null;
        FlxG.save.data.downscroll = null;
        FlxG.save.data.cpuStrums = null;
        FlxG.save.data.colour = null;
        FlxG.save.data.watermark = null;
        FlxG.save.data.betterIcons = null;
        FlxG.save.data.flashing = null;
        FlxG.save.data.health = null;

        saveLoad();
    }
}