package;

import lime.utils.Assets;

using StringTools;

class CoolUtil
{
	public static inline function getMacroAbstractClass(className:String)
	{
		return Type.resolveClass('${className}_HSC');
	}

	public static function splitTextfileIntoArray(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}
}
