package characters;

import sys.io.File;
import haxe.Json;

using StringTools;

class Character extends CharacterBase
{
	public static var characters:Map<String, CharacterData> = [];

	public var character_data(get, never):CharacterData;

	function get_character_data():CharacterData
	{
		return getCharacterData(curCharacter);
	}

	override public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y, character, isPlayer);

		if (isPlayer)
			flipX = !flipX;

		if ((isPlayer && (getTag('as_player_flip_sideways_singing_directions')?.value ?? true))
			|| (!isPlayer && (getTag('as_opponent_flip_sideways_singing_directions')?.value ?? false)))
		{
			// var animArray
			var oldRight = animation.getByName('singRIGHT').frames;
			animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
			animation.getByName('singLEFT').frames = oldRight;

			// IF THEY HAVE MISS ANIMATIONS??
			if (animation.getByName('singRIGHTmiss') != null)
			{
				var oldMiss = animation.getByName('singRIGHTmiss').frames;
				animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
				animation.getByName('singLEFTmiss').frames = oldMiss;
			}
		}
	}

	public static var templateCharacterData:CharacterData = {
		iconPath: 'none',
		atlasPath: 'chart_quant',
		animations: [
			{name: 'idle', prefix: 'chart_quant0004', type: 'prefix'},
			{name: 'singLEFT', prefix: 'chart_quant0002', type: 'prefix'},
			{name: 'singDOWN', prefix: 'chart_quant0007', type: 'prefix'},
			{name: 'singUP', prefix: 'chart_quant0008', type: 'prefix'},
			{name: 'singRIGHT', prefix: 'chart_quant0000', type: 'prefix'},
		]
	};

	public static function getCharacterData(char:String):CharacterData
	{
		if (characters.exists(char))
			return characters.get(char);

		try
		{
			var cd = Json.parse(File.getContent(('characters/' + char).json()));
			characters.set(char, cd);

			return cd;
		}
		catch (_)
		{
		}

		characters.set(char, templateCharacterData);
		return templateCharacterData;
	}

	public static function getIconPath(char:String)
	{
		var charData:CharacterData = getCharacterData(char);
		if (charData.iconPath != null)
			return charData.iconPath;

		return char;
	}

	override function initChar(char:String)
	{
		super.initChar(char);

		var keepGoing:Bool = true;

		for (field in ['atlasPath', 'animations'])
		{
			if (!Reflect.fields(character_data).contains(field))
			{
				keepGoing = false;
				throw char + ' JSON missing "' + field + '" field';
			}
		}

		if (!keepGoing)
			return;

		trace('makin char: ' + char);

		this.flipX = character_data?.flipX ?? false;
		this.flipY = character_data?.flipY ?? false;

		// this.iconPath = character_data?.iconPath ?? 'none';
		// this.iconColor = FlxColor.fromString(character_data?.iconColor) ?? 0xFFFFFF;

		frames = Paths.getSparrowAtlas(character_data.atlasPath);

		this.antialiasing = character_data?.antialiasing ?? false;

		for (a in character_data.animations)
		{
			switch (a.type)
			{
				case 'prefix':
					trace(' * prefix anim: ' + a.name);
					animation.addByPrefix(a.name, a.prefix, a?.frameRate ?? 24, a?.looped ?? false, a?.flipX ?? false, a?.flipY ?? false);

				case 'indices':
					trace(' * indices anim: ' + a.name);
					animation.addByIndices(a.name, a.prefix, a.indices, a?.postfix ?? '', a?.frameRate ?? 24, a?.looped ?? false, a?.flipX ?? false,
						a?.flipY ?? false);
			}

			if (a.offsets != null)
				addOffset(a.name, a.offsets[0], a.offsets[1]);
		}

		animation.play('idle');
	}

	public var curAnim(get, never):String;

	function get_curAnim():String
	{
		return animation.curAnim.name;
	}

	public function getTag(tag:String):CharacterTag
	{
		return CharacterTagManager.getTag(character_data.tags, tag);
	}

	override function dance()
	{
		if (getTag('dance_idle') != null)
		{
			var tag_dont_diasw:String = getTag('dont_dance_if_animation_startsWith')?.value ?? null;
			var tag_do_diasw:String = getTag('do_dance_if_animation_startsWith')?.value ?? null;

			var tag_dont_diaew:String = getTag('dont_dance_if_animation_endsWith')?.value ?? null;
			var tag_do_diaew:String = getTag('do_dance_if_animation_endsWith')?.value ?? null;

			if (tag_dont_diasw != null || tag_dont_diaew != null)
				if (curAnim.startsWith(tag_dont_diasw) || curAnim.startsWith(tag_dont_diaew))
					return;
			if (tag_do_diasw != null || tag_do_diasw != null)
				if (!curAnim.endsWith(tag_do_diasw) || !curAnim.endsWith(tag_do_diaew))
					return;

			danced = !danced;
			if (danced)
				playAnim('danceRight');
			else
				playAnim('danceLeft');
		}
		else
			super.dance();
	}
}
