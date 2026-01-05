package;

import flixel.FlxSprite;

class StaticNote extends FlxSprite
{
	override public function new(y:Float, i:Int)
	{
		super();

		frames = 'NOTE_assets'.getSparrowAtlas();
		animation.addByPrefix('green', 'arrowUP');
		animation.addByPrefix('blue', 'arrowDOWN');
		animation.addByPrefix('purple', 'arrowLEFT');
		animation.addByPrefix('red', 'arrowRIGHT');

		antialiasing = true;
		setGraphicSize(Std.int(width * 0.7));

		switch (Math.abs(i))
		{
			case 0:
				x += Note.swagWidth * 0;
				animation.addByPrefix('static', 'arrowLEFT');
				animation.addByPrefix('pressed', 'left press', 24, false);
				animation.addByPrefix('confirm', 'left confirm', 24, false);
			case 1:
				x += Note.swagWidth * 1;
				animation.addByPrefix('static', 'arrowDOWN');
				animation.addByPrefix('pressed', 'down press', 24, false);
				animation.addByPrefix('confirm', 'down confirm', 24, false);
			case 2:
				x += Note.swagWidth * 2;
				animation.addByPrefix('static', 'arrowUP');
				animation.addByPrefix('pressed', 'up press', 24, false);
				animation.addByPrefix('confirm', 'up confirm', 24, false);
			case 3:
				x += Note.swagWidth * 3;
				animation.addByPrefix('static', 'arrowRIGHT');
				animation.addByPrefix('pressed', 'right press', 24, false);
				animation.addByPrefix('confirm', 'right confirm', 24, false);
		}

		updateHitbox();
		scrollFactor.set();

		ID = i;

		animation.play('static');
	}
}
