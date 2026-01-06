package scripting;

class CharacterScript extends Script
{
	override public function new(character:String)
	{
		super('characters/$character', 'CharacterScript($character)');
	}
}
