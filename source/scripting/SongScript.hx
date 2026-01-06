package scripting;

class SongScript extends Script
{
	override public function new(song:String)
	{
		super('songs/$song', 'SongScript($song)');
	}
}
