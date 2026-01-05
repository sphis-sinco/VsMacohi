package menus.storymode.data;

class WeekProp
{
	public var charID:String;
	public var charPosID:Int;
	public var offsets:Array<Float>;

	public function toString():String
	{
		return 'Prop(id: ${charID}, posID: ${charPosID})';
	}
}
