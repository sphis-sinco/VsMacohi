package caching;

import lime.utils.Assets;

class AudioCacher
{
	public static function cacheSongs()
	{
		var songs = CoolUtil.coolTextFile('assets/data/freeplaySonglist.txt');
		for (song in songs)
			cacheSong(song);
	}

	public static function cacheSong(song:String)
	{
		var instPath = 'assets/music/${song}_Inst' + TitleState.soundExt;
		var voicesPath = 'assets/music/${song}_Voices' + TitleState.soundExt;

		trace('Caching... $song ' + '(${(Assets.exists(instPath)) ? 'inst' : 'no-inst'}/${(Assets.exists(voicesPath)) ? 'voices' : 'no-voices'})');

		if (Assets.exists(instPath))
			Assets.loadAudioBuffer(instPath);
		if (Assets.exists(voicesPath))
			Assets.loadAudioBuffer(voicesPath);
	}
}
