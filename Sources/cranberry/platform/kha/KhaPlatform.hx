package cranberry.platform.kha;

import cranberry.platform.kha.graphics.Framebuffer;

class KhaPlatform
{
	public static function notifyOnRender(listener: Framebuffer -> Void, id: Int = 0): Void 
	{
		kha.System.notifyOnRender(listener, id);
	}

	public static function init(options: Dynamic, callback: Void -> Void): Void
	{
		kha.System.init(options, callback);
	}
}