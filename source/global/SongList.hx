package global;

import menus.storymode.data.WeekData;

class SongList
{
	static var _cache:Array<String> = [];

	public static var get(get, never):Array<String>;

	static function get_get()
	{
		var returnData = [];
		var returnDataWeekEquivilents = [];

		for (week in WeekList.get)
		{
			var weekData = new WeekData(week);

			for (song in weekData.songs)
				if (!returnData.contains(song))
				{
					returnData.push(song);
					returnDataWeekEquivilents.push(weekData.weekID);
				}
		}

		if (_cache == returnData)
			return _cache;

		for (song in returnData)
			if (!_cache.contains(song))
				trace('New song: ${song} from week: ${returnDataWeekEquivilents[returnData.indexOf(song)]}');

		for (song in _cache)
			if (!returnData.contains(song))
				trace('Removed song: ${song}');

		return returnData;
	}
}
