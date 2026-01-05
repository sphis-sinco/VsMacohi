package;

import flixel.graphics.frames.FlxFrame;
import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		frames = 'icons/$char'.getSparrowAtlas();
		if (frames == null)
			frames = 'icons/none'.getSparrowAtlas();

		animation.addByPrefix('normal', 'normal', 24, true);
		animation.addByPrefix('lose', 'lose', 24, true);
		animation.addByPrefix('win', 'win', 24, true);

		flipX = isPlayer;

		antialiasing = true;
		scrollFactor.set();
	}

	public function playAnim(anim:HealthIconAnims)
	{
		if (this.animation.exists(anim))
			this.animation.play(anim);
	}
}

enum abstract HealthIconAnims(String) from String to String
{
	var NORMAL = 'normal';
	var LOSE = 'lose';
	var WIN = 'win';
}
