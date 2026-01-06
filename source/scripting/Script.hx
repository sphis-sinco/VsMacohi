package scripting;

import scripting.classAlts.ScriptedStd;
import haxe.Log;
import crowplexus.iris.Iris;

class Script extends Iris
{
	override public function new(path:String, scriptName:String)
	{
		if (!path.hxc().assetExists())
			trace('Cannot find script: ' + path.hxc());

		super(((path.hxc().assetExists()) ? path.hxc().getTextContent() : 'function create() { trace("couldnt find script : ${path.hxc()}"); }'), {
			name: scriptName
		});

		initVars();
	}

	public static function getDefaultVariables():Map<String, Dynamic>
	{
		return [
			// Haxe related stuff
			"Std" => ScriptedStd,
			"Math" => Math,
			"Reflect" => Reflect,
			"StringTools" => StringTools,
			"Json" => haxe.Json,

			// OpenFL & Lime related stuff
			"Assets" => openfl.utils.Assets,
			"Application" => lime.app.Application,
			"Main" => Main,
			"window" => lime.app.Application.current.window,

			#if !hscriptPos
			'trace' => Iris.print,
			#end

			// Flixel related stuff
			"FlxG" => flixel.FlxG,
			"FlxSprite" => flixel.FlxSprite,
			"FlxBasic" => flixel.FlxBasic,
			"FlxCamera" => flixel.FlxCamera,
			"state" => flixel.FlxG.state,
			"FlxEase" => flixel.tweens.FlxEase,
			"FlxTween" => flixel.tweens.FlxTween,
			"FlxSound" => flixel.sound.FlxSound,
			"FlxAssets" => flixel.system.FlxAssets,
			"FlxMath" => flixel.math.FlxMath,
			"FlxGroup" => flixel.group.FlxGroup,
			"FlxTypedGroup" => flixel.group.FlxGroup.FlxTypedGroup,
			"FlxSpriteGroup" => flixel.group.FlxSpriteGroup,
			"FlxTypeText" => flixel.addons.text.FlxTypeText,
			"FlxText" => flixel.text.FlxText,
			"FlxTimer" => flixel.util.FlxTimer,
			"FlxPoint" => CoolUtil.getMacroAbstractClass("flixel.math.FlxPoint"),
			"FlxAxes" => CoolUtil.getMacroAbstractClass("flixel.util.FlxAxes"),
			"FlxColor" => CoolUtil.getMacroAbstractClass("flixel.util.FlxColor"),

			// Engine related stuff

			"PlayState" => PlayState,
			"HealthIcon" => HealthIcon,

			"Note" => Note,
			"StaticNote" => StaticNote,

			"CharacterBase" => characters.CharacterBase,
			"Character" => characters.Character,
			"Boyfriend" => characters.Boyfriend,

			"PauseSubstate" => PauseSubState,
			"FreeplayState" => FreeplayState,
			"MainMenuState" => MainMenuState,
			"PauseSubState" => PauseSubState,
			"StoryMenuState" => menus.storymode.StoryMenuState,
			"TitleState" => TitleState,
			"Paths" => Paths,
			"Conductor" => Conductor,

			"CoolUtil" => CoolUtil,
		];
	}

	public function initVars()
	{
		for (key => value in getDefaultVariables())
			set(key, value);
	}

	override function call(fun:String, ?args:Array<Dynamic>):IrisCall
	{
		if (interp != null)
		{
			var method:Dynamic = interp.variables.get(fun); // function signature

			if (!Reflect.isFunction(method) || method == null)
				return null;
		}

		return super.call(fun, args);
	}
}
