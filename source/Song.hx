package;

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

	var songChartVersion:Float;
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
		var rawJson = Assets.getText(('songs/' + folder.toLowerCase() + '/' + jsonInput.toLowerCase()).json()).trim();

		while (!rawJson.endsWith("}"))
			rawJson = rawJson.substr(0, rawJson.length - 1);

		return parseJSONshit(rawJson);
	}

	public static function parseJSONshit(rawJson:String):SwagSong
	{
		var swagShit:SwagSong = cast Json.parse(rawJson).song;
		swagShit.validScore = true;

		convertChart(swagShit);

		return swagShit;
	}

	public static function convertChart(swagShit:SwagSong)
	{
		if (swagShit.songChartVersion == 1.0)
			swagShit.stage = 'stage';

		swagShit.songChartVersion = songChartVersion;
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
