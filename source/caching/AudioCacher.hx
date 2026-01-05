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

		trace('Song caching : $song ' + '(${(Assets.exists(instPath)) ? 'inst' : 'no-inst'}/${(Assets.exists(voicesPath)) ? 'voices' : 'no-voices'})');

		if (instPath.assetExists())
			cacheAudio(instPath);
		if (voicesPath.assetExists())
			cacheAudio(voicesPath);
	}

	public static function cacheAudio(audio:String)
	{
		if (audio.assetExists())
		{
			trace('Audio caching : $audio');
			FlxG.sound.cache(audio);
		}
	}
}
