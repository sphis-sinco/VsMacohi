package characters;

class CharacterTagManager
{
	public static function getTag(tags:Array<CharacterTag>, name:String):CharacterTag
	{
		if (tags == null)
			return null;

		for (t in tags)
			if (t.name == name)
				return t;

		return null;
	}
}