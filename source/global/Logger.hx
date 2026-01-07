package global;

import haxe.PosInfos;
import crowplexus.iris.Iris;

class Logger
{
	public static function print(x:Dynamic, ?pos:PosInfos)
		Iris.print(Std.string('' + x), pos);

	public static function fatal(x:Dynamic, ?pos:PosInfos)
		Iris.fatal(Std.string('' + x), pos);

	public static function error(x:Dynamic, ?pos:PosInfos)
		Iris.error(Std.string('' + x), pos);

	public static function warn(x:Dynamic, ?pos:PosInfos)
		Iris.warn(Std.string('' + x), pos);

	public static function notice(x:Dynamic, ?pos:PosInfos)
		Iris.logLevel(NOTICE, Std.string(x), pos);
}
