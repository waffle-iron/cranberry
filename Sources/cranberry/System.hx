package cranberry;

import kha.Framebuffer;
import kha.Scheduler;

import cranberry.sprite.Sprite;
import cranberry.logic.LogicSystem;

class System
{

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
	

	private function new() : Void
	{
		kha.System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		root = new Sprite();
		_logicSystemsArra = new Array<LogicSystem>();
	}

	public function addLogicSystem(logicSys :LogicSystem) : System
	{
		_logicSystemsArra.push(logicSys);
		return this;
	}

	public function removeLogicSystem(logicSys :LogicSystem) : System
	{
		_logicSystemsArra.remove(logicSys);
		return this;
	}


	private function update(): Void {
		var currentTime = kha.Scheduler.time();
		_deltaTime = currentTime - _lastTime;
		_lastTime = currentTime;
		for(sys in _logicSystemsArra)
			sys.onUpdate(_deltaTime);
		root._runLogic(_deltaTime);
	}

	private function render(framebuffer: Framebuffer): Void {
		framebuffer.g2.begin();
		root._render(framebuffer);
		framebuffer.g2.end();
	}

	private var _deltaTime :Float = 0;
	private var _lastTime :Float = 0;
	private var _logicSystemsArra :Array<LogicSystem>;

	private static var _hasInit :Bool = false;
}