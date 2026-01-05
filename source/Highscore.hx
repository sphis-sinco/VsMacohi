package;

import flixel.FlxG;

using StringTools;

class Highscore
{
	public static var songScores:Map<String, Int> = [];

	public static function saveScore(song:String, score:Int = 0, ?diff:Int = 0):Void
	{
		var daSong:String = formatSong(song, diff);

		if (songScores.exists(daSong))
			if (songScores.get(daSong) < score)
				setScore(daSong, score);
			else
				setScore(daSong, score);
	}

	public static function saveWeekScore(week:Int = 1, score:Int = 0, ?diff:Int = 0):Void
	{
		var daWeek:String = formatSong('week' + week, diff);

		if (songScores.exists(daWeek))
			if (songScores.get(daWeek) < score)
				setScore(daWeek, score);
			else
				setScore(daWeek, score);
	}

	/**
	 * YOU SHOULD FORMAT SONG WITH formatSong() BEFORE TOSSING IN SONG VARIABLE
	 */
	static function setScore(song:String, score:Int):Void
	{
		// Reminder that I don't need to format this song, it should come formatted!
		songScores.set(song, score);
		FlxG.save.data.songScores = songScores;
		FlxG.save.flush();
	}

	static var diffs:Array<String> = ['-easy', '', '-hard'];

	public static function formatSong(song:String, diff:Int):String
	{
		var daSong:String = song;

		daSong += (diffs[diff] ?? '');

		return daSong;
	}

	public static function unformatSong(song:String):String
	{
		var daSong:String = song;

		for (diff in diffs)
			if (daSong.endsWith(diff))
			{
				daSong.replace(diff, '');
				break;
			}

		trace(daSong);
		return daSong;
	}

	public static function getScore(song:String, diff:Int):Int
	{
		if (!songScores.exists(formatSong(song, diff)))
			setScore(formatSong(song, diff), 0);

		return songScores.get(formatSong(song, diff));
	}

	public static function getWeekScore(week:Int, diff:Int):Int
	{
		if (!songScores.exists(formatSong('week' + week, diff)))
			setScore(formatSong('week' + week, diff), 0);

		return songScores.get(formatSong('week' + week, diff));
	}

	public static function load():Void
	{
		if (FlxG.save.data.songScores != null)
		{
			songScores = FlxG.save.data.songScores;
		}
	}
}
