package;

#if sys
import sys.io.File;
#end
import Section.SwagSection;
import haxe.Json;
import haxe.format.JsonParser;
import lime.utils.Assets;

using StringTools;

typedef SwagSong =
{
	var stage:String;

	var song:String;
	var notes:Array<SwagSection>;
	var bpm:Float;
	var needsVoices:Bool;
	var speed:Float;

	var player1:String;
	var player2:String;
	var validScore:Bool;

	var songChartVersion:Null<Float>;
}

class Song
{
	public var song:String;
	public var notes:Array<SwagSection>;
	public var bpm:Float;
	public var needsVoices:Bool = true;
	public var speed:Float = 1;

	public var player1:String = 'bf';
	public var player2:String = 'dad';

	public function new(song, notes, bpm)
	{
		this.song = song;
		this.notes = notes;
		this.bpm = bpm;
	}

	public static function loadFromJson(jsonInput:String, ?folder:String):SwagSong
	{
		var path = ('songs/' + folder.toLowerCase() + '/' + jsonInput.toLowerCase()).json();

		var rawJson = path.getTextContent().trim();

		while (!rawJson.endsWith("}"))
			rawJson = rawJson.substr(0, rawJson.length - 1);

		return parseJSONshit(rawJson, path);
	}

	public static function parseJSONshit(rawJson:String, ?path:String):SwagSong
	{
		var rawJsonJson = Json.parse(rawJson);
		var swagShit:SwagSong = (!Std.isOfType(cast(rawJsonJson).song, String)) ? cast(rawJsonJson).song : cast(rawJsonJson);
		swagShit.validScore = true;

		convertChart(swagShit, path);

		return swagShit;
	}

	public static function convertChart(swagShit:SwagSong, ?path:String)
	{
		try
		{
			trace('converting ${swagShit.song} from SCV${swagShit.songChartVersion} to SCV${songChartVersion}');
		}
		catch (e)
		{
			trace(swagShit);
		}

		if (swagShit.songChartVersion == 1.0 || swagShit.songChartVersion == null)
			swagShit.stage = 'stage';

		swagShit.songChartVersion = songChartVersion;

		#if sys
		if (path != null && path.assetExists())
		{
			trace('saving to $path');
			File.saveContent(path, Json.stringify({song: swagShit}, '\t'));
		}
		#end
		trace('converted');
	}

	public static var songChartVersion:Float = 1.1;
	public static var defaultSongChart:SwagSong = {
		song: 'Test',
		stage: 'stage',
		notes: [],
		bpm: 150,
		needsVoices: true,
		player1: 'bf',
		player2: 'dad',
		speed: 1,
		validScore: false,
		songChartVersion: songChartVersion
	};
}
