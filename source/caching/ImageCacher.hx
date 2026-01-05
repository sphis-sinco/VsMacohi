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
			'iconGrid',
			'logoBumpin',
			'menuBG',
			'menuBGBlue',
			'menuBGMagenta',
			'menuBGDesat',
			'NOTE_assets',
		])
			cacheImage(uiAsset);
	}

	public static function cacheImage(img:String)
	{
		trace('Caching $img');
		FlxG.bitmap.add('assets/images/$img.png');
	}
}
