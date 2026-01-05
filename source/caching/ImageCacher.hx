package caching;

import flixel.FlxG;

class ImageCacher
{
	public static function cacheUI()
	{
		for (uiAsset in [
			'alphabet',
			'campaign_menu_UI_assets',
			'campaign_menu_UI_characters',
			'FNF_main_menu_assets',
			'healthBar',
			'logoBumpin',
			'menuBG',
			'menuBGBlue',
			'menuBGMagenta',
			'menuDesat',
			'NOTE_assets',
		])
			cacheImage(uiAsset);
	}

	public static function cacheImage(img:String)
	{
		if (img.image().assetExists())
		{
			trace('Image caching : ${img.image()}');
			FlxG.bitmap.add(img.image());
		}
	}
}
