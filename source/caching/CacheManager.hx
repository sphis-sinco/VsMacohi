package caching;

import openfl.system.System;
import lime.utils.Assets;
import flixel.FlxG;

class CacheManager
{
	/**
		yoinked from ocrpg hehehehe
	**/
	public static function bitmapDumpCache() @:privateAccess
	{
		#if !web
		for (key in FlxG.bitmap._cache.keys())
		{
			var obj = FlxG.bitmap._cache.get(key);
			if (obj != null && obj.canBeRefreshed)
				obj.refresh();
		}
		#end
	}

	public static function freeMemory():Void
	{
		trace('free memory');

		// bitmapDumpCache();

		FlxG.bitmap.clearCache();
		FlxG.bitmap.clearUnused();
		Assets.cache.clear();
		freeUnusedMemory();
	}

	public static function freeUnusedMemory():Void
	{
		System.gc();
	}
}
