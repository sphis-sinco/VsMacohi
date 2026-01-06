package scripting;

class StageScript extends Script
{
	override public function new(stage:String)
	{
		super('stages/$stage', 'StageScript($stage)');
	}
}
