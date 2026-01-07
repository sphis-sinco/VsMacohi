package global;

import haxe.PosInfos;
import crowplexus.iris.Iris;

class Logger
{
	public static function print(x:String, ?pos:PosInfos)
		Iris.print(x, pos);

	public static function fatal(x:String, ?pos:PosInfos)
		Iris.fatal(x, pos);

	public static function error(x:String, ?pos:PosInfos)
		Iris.error(x, pos);

	public static function warn(x:String, ?pos:PosInfos)
		Iris.warn(x, pos);

	public static function notice(x:String, ?pos:PosInfos)
		Iris.logLevel(NOTICE, x, pos);
}
