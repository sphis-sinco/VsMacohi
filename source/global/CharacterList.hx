package global;

#if sys
import sys.FileSystem;
#end

using StringTools;

class CharacterList
{
	static var _cache:Array<String> = [];

	public static var get(get, never):Array<String>;

	static function get_get()
	{
		var returnData = [];

		returnData = CoolUtil.splitTextfileIntoArray('characterList'.txt());
		#if sys
		var characters = FileSystem.readDirectory("assets/data/characters/");

		if (_cache == characters)
			return _cache;

		for (character in characters)
			if (!FileSystem.isDirectory("assets/data/characters/" + character))
				if (!returnData.contains(character.replace('.json', '')))
					returnData.push(character.replace('.json', ''));
		#end

		for (character in returnData)
		{
			if (!_cache.contains(character))
			{
				trace('New character found: ' + character);
				_cache.push(character);
			}
		}

		for (character in _cache)
		{
			if (!returnData.contains(character))
			{
				trace('Character removed: ' + character);
				_cache.remove(character);
			}
		}

		return returnData;
	}
}
