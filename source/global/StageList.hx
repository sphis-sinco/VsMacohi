package global;

#if sys
import sys.FileSystem;
#end

using StringTools;

class StageList
{
	static var _cache:Array<String> = [];

	public static var get(get, never):Array<String>;

	static function get_get()
	{
		var returnData = [];

		returnData = CoolUtil.splitTextfileIntoArray('stageList'.txt());
		#if sys
		var stages = FileSystem.readDirectory('assets/scripts/stages/');

		if (_cache == stages)
			return _cache;

		for (stage in stages)
			if (!FileSystem.isDirectory('assets/scripts/stages/' + stage))
				if (!returnData.contains(stage.replace('.hxc', '')))
					returnData.push(stage.replace('.hxc', ''));
		#end

		for (stage in returnData)
		{
			if (!_cache.contains(stage))
			{
				trace('New stage found: ' + stage);
				_cache.push(stage);
			}
		}

		for (stage in _cache)
		{
			if (!returnData.contains(stage))
			{
				trace('Stage removed: ' + stage);
				_cache.remove(stage);
			}
		}

		return returnData;
	}
}
