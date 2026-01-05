package caching;

import global.SongList;
import flixel.FlxG;
import lime.utils.Assets;

class AudioCacher
{
	public static function cacheSongs()
	{
		var songs = SongList.get;
		for (song in songs)
			cacheSong(song);
	}

	public static function cacheSong(song:String)
	{
		var instPath = song.inst();
		var voicesPath = song.voices();

		trace('Caching... $song ' + '(${(Assets.exists(instPath)) ? 'inst' : 'no-inst'}/${(Assets.exists(voicesPath)) ? 'voices' : 'no-voices'})');

		if (Assets.exists(instPath))
		{
            FlxG.sound.cache(instPath);
			Assets.loadAudioBuffer(instPath);
		}
		if (Assets.exists(voicesPath))
		{
            FlxG.sound.cache(voicesPath);
			Assets.loadAudioBuffer(voicesPath);
		}
	}
}
