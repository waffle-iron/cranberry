package cranberry.platform.kha.input;

import cranberry.input.Key;

abstract Keyboard(kha.input.Keyboard) from kha.input.Keyboard to kha.input.Keyboard
{
	public static function get(?num:Int) :Keyboard
	{
		return kha.input.Keyboard.get(num);
	}

	public function notify(downListener:Key -> String -> Void, upListener:Key -> String -> Void) :Void
	{
		this.notify(downListener, upListener);
	}
}