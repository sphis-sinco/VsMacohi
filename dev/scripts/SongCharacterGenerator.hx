package dev.scripts;

import haxe.Json;
import haxe.io.Path;
import sys.io.File;
import sys.FileSystem;

using StringTools;

// haxe -m dev.scripts.SongCharacterGenerator --interp

class Paths
{
	public static function getSparrowAtlas(path:String)
		return path;
}

class AnimationClass
{
	public var anims:Array<Dynamic> = [];

	public function new()
	{
	}

	public function getAnim(animName:String):Dynamic
	{
		for (anim in anims)
		{
			if (anim.name == animName)
				return anim;
		}

		return null;
	}

	public function addByPrefix(name:String, prefix:String, frameRate = 24.0, looped = true, flipX = false, flipY = false)
	{
		anims.push({
			type: 'prefix',
			name: name,
			prefix: prefix,
			frameRate: frameRate,
			looped: looped,
			flipX: flipX,
			flipY: flipY,
		});
	}

	public function addByIndices(Name:String, Prefix:String, Indices:Array<Int>, Postfix:String, FrameRate = 24.0, Looped:Bool = true, FlipX:Bool = false,
			FlipY:Bool = false)
	{
		anims.push({
			type: 'indices',
			name: Name,
			prefix: Prefix,
			postfix: Postfix,
			indices: Indices,
			frameRate: FrameRate,
			looped: Looped,
			flipX: FlipX,
			flipY: FlipY,
		});
	}

	public function play(urmom:String)
	{
	};
}

class Language
{
	public static function getString(s)
		return s;
}

class SongCharacterGenerator
{
	static var charsPath = 'assets/data/characters/';

	public static function main()
	{
		var animation:AnimationClass = new AnimationClass();
		animation.addByPrefix('name', 'prefix', 24, true, false, false);
		animation.addByIndices('name', 'prefix', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], '', 24, true, false, false);

		File.saveContent('dev/scripts/character_example.json', Json.stringify({
			notes: [
				'example character json',
				'prob gonna use this so I can use https://yal.cc/r/19/json2typedef/'
			],
			iconPath: 'none',
			atlasPath: 'atlasPath',

			flipX: false,
			flipY: false,

			animations: animation.anims
		}, '\t').trim());

		checkChar('bf');
		checkChar('gf');
		checkChar('dad');
	}

	static function checkChar(char:String)
	{
		var charName = char;
		var iconColor = 0xFFFFFFFF;

		var animation:AnimationClass = new AnimationClass();

		var addOffset = function(anim = '', ?x = 0.0, ?y = 0.0)
		{
			animation.getAnim(anim).offsets = [x, y];
		};
		var playAnim = function(a)
		{
		};
		var updateHitbox = function()
		{
		};

		var width = 1.0;
		var widthMultiplier = 1.0;
		var setGraphicSize = function(s = 0.0)
		{
			widthMultiplier = s / width;
		};

		var stdint = function(f)
		{
			return f;
		}

		var danceEveryNumBeat = 1.0;

		var flipX = false;
		var flipY = false;
		var singDuration = 4.0;
		var forceDance = false;

		var atlasPath = '';

		
		switch (char)
		{
			case 'gf':
				// GIRLFRIEND CODE
				var tex = 'GF_assets';
				atlasPath = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'dad':
				// DAD ANIMATION LOADING CODE
				var tex = 'DADDY_DEAREST';
				atlasPath = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				playAnim('idle');

			case 'bf':
				var tex = 'BOYFRIEND';
				atlasPath = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;
		}

		trace('Saving char : ' + char);

		if (animation.anims.length > 0)
			File.saveContent(charsPath + char + '.json', Json.stringify({
				notes: [],

				iconPath: getIconPath(char),
				atlasPath: atlasPath,

				flipX: flipX,
				flipY: flipY,

				animations: animation.anims
			}, '\t').trim());
		else
		{
			trace(char + ' is missin anims');
		}
	}

	public static function getIconPath(character:String):String
	{
		if (character.contains('bf'))
			return 'bf';
		
		return character;
	}
}