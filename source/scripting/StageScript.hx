package scripting;

class StageScript extends Script
{
	override public function new(stage:String, playState:PlayState)
	{
		super('stages/${stage ?? 'stage'}', 'StageScript(${stage ?? 'stage'})');
        set('game', playState);
	}
}
