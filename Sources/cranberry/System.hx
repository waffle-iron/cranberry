package cranberry;

import kha.Framebuffer;
import kha.Scheduler;

import cranberry.sprite.Sprite;
import cranberry.logic.Logic;

/** **/
class System
{
	/** **/
	public var root :Sprite;

	public static function init(title :String, width :Int, height :Int, cb :System -> Void) : Void
	{
		if(_hasInit)
			return;
		_hasInit = true;

		kha.System.init({title: title, width: width, height: height}, function () {
			cb(new System());
		});
	}
	
	/** **/
	private function new() : Void
	{
		kha.System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		root = new Sprite();
		_logicArra = new Array<Logic>();
	}

	/** **/
	public function addLogic(logic :Logic) : System
	{
		_logicArra.push(logic);
		return this;
	}

	/** **/
	public function removeLogic(logic :Logic) : System
	{
		_logicArra.remove(logic);
		return this;
	}

	/** **/
	private function update(): Void {
		var currentTime = kha.Scheduler.time();
		_deltaTime = currentTime - _lastTime;
		_lastTime = currentTime;
		for(sys in _logicArra)
			sys.onUpdate(_deltaTime);
	}

	/** **/
	private function render(framebuffer: Framebuffer): Void {
		framebuffer.g2.begin();
		root._render(framebuffer);
		framebuffer.g2.end();
	}

	private var _deltaTime :Float = 0;
	private var _lastTime :Float = 0;
	private var _logicArra :Array<Logic>;

	private static var _hasInit :Bool = false;
}