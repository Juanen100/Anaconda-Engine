package;

import flixel.*;

class Intro extends MusicBeatState
{
    public static var leftState:Bool = false;

    override function create() 
    {
        if(leftState == false)
        {
            var video:MP4Handler = new MP4Handler();
            video.playMP4(Paths.video('intro'), new TitleState(), false, false, false);
            leftState = true;
        }
        else
        {
            leftState = false;
        }
    }
}