package;

#if sys
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class Paths
{
	inline public static var SOUND_EXT = #if web "mp3" #else "ogg" #end;

	static function getPath(file:String)
	{
		if (file.startsWith('assets/'))
			return file;

		#if TRACE_PATHS
		trace('assets/$file');
		#end
		return 'assets/$file';
	}

	inline static public function dataFile(key:String)
	{
		return getPath('data/$key');
	}

	inline static public function scriptFile(key:String)
	{
		return getPath('scripts/$key');
	}

	inline static public function hxc(key:String)
	{
		return scriptFile('$key.hxc');
	}

	inline static public function txt(key:String)
	{
		return dataFile('$key.txt');
	}

	inline static public function xml(key:String)
	{
		return dataFile('$key.xml');
	}

	inline static public function json(key:String)
	{
		return dataFile('$key.json');
	}

	inline static public function songJson(key:String, ?folder:String)
	{
		return json('songs/${folder ?? key}/$key');
	}

	static public function sound(key:String)
	{
		return getPath('sounds/$key.$SOUND_EXT');
	}

	inline static public function soundRandom(key:String, min:Int, max:Int)
	{
		return sound(key + FlxG.random.int(min, max));
	}

	inline static public function music(key:String)
	{
		return getPath('music/$key.$SOUND_EXT');
	}

	inline static public function voices(song:String)
	{
		return music('songs/${song.toLowerCase()}_Voices');
	}

	inline static public function inst(song:String)
	{
		return music('songs/${song.toLowerCase()}_Inst');
	}

	inline static public function image(key:String)
	{
		return getPath('images/$key.png');
	}

	inline static public function font(key:String)
	{
		return getPath('fonts/$key');
	}

	inline static public function getSparrowAtlas(key:String)
	{
		return FlxAtlasFrames.fromSparrow(image(key), getPath('images/$key.xml'));
	}

	inline static public function getPackerAtlas(key:String)
	{
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key), getPath('images/$key.txt'));
	}

	static public function getTextContent(path:String):String
	{
		#if sys
		return File.getContent(path);
		#end

		return Assets.getText(path);
	}

	static public function assetExists(path:String):Bool
	{
		#if sys
		return FileSystem.exists(path);
		#end

		return Assets.exists(path);
	}
}
