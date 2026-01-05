package global;

#if sys
import sys.FileSystem;
#end

using StringTools;

class WeekList
{
	static var _cache:Array<String> = [];

	public static var get(get, never):Array<String>;

	static function get_get()
	{
		var returnData = [];

		returnData = ["tutorial"];
		#if sys
		var weeks = FileSystem.readDirectory("assets/data/weeks/");

		if (_cache == weeks)
			return _cache;

		for (week in weeks)
			if (!FileSystem.isDirectory("assets/data/weeks/" + week))
				if (!returnData.contains(week.replace('.json', '')))
					returnData.push(week.replace('.json', ''));
		#end

		for (week in returnData)
		{
			if (!_cache.contains(week))
			{
				trace('New week found: ' + week);
				_cache.push(week);
			}
		}

		for (week in _cache)
		{
			if (!returnData.contains(week))
			{
				trace('Week removed: ' + week);
				_cache.remove(week);
			}
		}

		return returnData;
	}
}
