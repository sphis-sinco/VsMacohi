package characters;

import characters.CharacterTag;

typedef CharacterData =
{
	?flipX:Bool,
	?flipY:Bool,

    ?antialiasing:Bool,

	atlasPath:String,
	iconPath:String,

    ?tags:Array<CharacterTag>,
	
    animations:Array<
		{
			?flipX:Bool,
			?flipY:Bool,

			prefix:String,
			name:String,

			?looped:Bool,
			
            type:String,
			
            ?frameRate:Int,
			
            ?postfix:String,
			?indices:Array<Int>,

            ?offsets:Array<Float>
		}>
}
