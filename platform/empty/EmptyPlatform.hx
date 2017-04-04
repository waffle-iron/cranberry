package cranberry.platform.empty;

import cranberry.platform.empty.graphics.Framebuffer;

class EmptyPlatform
{
	public static function notifyOnRender(listener: Framebuffer -> Void, id: Int = 0): Void {}
	public static function init(options: Dynamic, callback: Void -> Void): Void 
	{
		callback();
	}
}