package cranberry.platform.empty.input;

class Keyboard
{
	public static function get(?num:Int) :Keyboard {return null;}
	public function notify(downListener:Key -> String -> Void, upListener:Key -> String -> Void) :Void {}
}