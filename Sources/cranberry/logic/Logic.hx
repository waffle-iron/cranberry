package cranberry.logic;

class Logic
{
	/** **/
	public function new() : Void
	{
	}

	/** **/
	public function addLogicSystem(logicSys :cranberry.logic.LogicSystem) : Logic
	{
		_logicSystem = JUST(logicSys);
		logicSys.onAdded();
		return this;
	}	

	/** **/
	public function onUpdate(dt :Float, sprite :cranberry.sprite.Sprite) : Void
	{
	}

	/** **/
	public function onAdded(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	/** **/
	public function onRemoved(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	/** **/
	@:final public function destroy() : Void
	{
		_willDestroy = true;
	}	

	/** **/
	@:allow(cranberry.sprite.Sprite)
	@:final private function _onUpdate(dt :Float, sprite :cranberry.sprite.Sprite) : Void
	{
		if(_willDestroy)
			sprite.removeLogic(this);
		else
			onUpdate(dt, sprite);
	}

	/** **/
	@:allow(cranberry.sprite.Sprite)
	@:final private function _onAdded(sprite :cranberry.sprite.Sprite) : Void
	{
		switch _logicSystem {
			case NOTHING:
			case JUST(sys): sys.addLogic(this);
		}
		onAdded(sprite);
	}

	/** **/
	@:allow(cranberry.sprite.Sprite)
	@:final private function _onRemoved(sprite :cranberry.sprite.Sprite) : Void
	{
		switch _logicSystem {
			case NOTHING:
			case JUST(sys): sys.removeLogic(this);
		}
		onRemoved(sprite);
	}

	private var _hasStarted :Bool = false;
	private var _willDestroy :Bool = false;
	private var _logicSystem :cranberry.util.Maybe<LogicSystem> = NOTHING;
}