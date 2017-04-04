package cranberry;

import cranberry.graphics.Framebuffer;
import cranberry.util.Scheduler;
import cranberry.platform.Platform;

import cranberry.sprite.Sprite;
import cranberry.system.System;

/** **/
class Cranberry
{
	/** **/
	public var root :Sprite;

	public static function init(title :String, width :Int, height :Int, cb :Cranberry -> Void) : Void
	{
		if(_hasInit)
			return;
		_hasInit = true;

		Platform.init({title: title, width: width, height: height}, function () {
			cb(new Cranberry());
		});
	}
	
	/** **/
	private function new() : Void
	{
		Platform.notifyOnRender(renderSprites);
		Scheduler.addTimeTask(updateSystems, 0, 1 / 60);

		root = new Sprite(-1);
		_systemArra = new Array<System>();
	}

	/** **/
	public function addSystem(system :System) : Cranberry
	{
		_systemArra.push(system);
		return this;
	}

	/** **/
	public function removeSystem(system :System) : Cranberry
	{
		_systemArra.remove(system);
		return this;
	}

	/** **/
	private function updateSystems() : Void 
	{
		var currentTime = Scheduler.time();
		_deltaTime = currentTime - _lastTime;
		_lastTime = currentTime;
		for(sys in _systemArra)
			sys.updateSystem(_deltaTime);
	}

	/** **/
	private function renderSprites(framebuffer: Framebuffer) : Void 
	{
		framebuffer.g2.begin();
		root._render(framebuffer);
		framebuffer.g2.end();
	}

	private var _deltaTime :Float = 0;
	private var _lastTime :Float = 0;
	private var _systemArra :Array<System>;

	private static var _hasInit :Bool = false;
}