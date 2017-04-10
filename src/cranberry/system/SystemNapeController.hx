package cranberry.system;

import cranberry.model.ModelNapeBodyCircle;
import cranberry.input.Keyboard;
import cranberry.input.Key;

/** **/
class SystemNapeController extends cranberry.system.System
{
	/** **/
	public function new() : Void
	{
        super();
		Keyboard.get().notify(onKeyDown, onKeyUp);
		_modelBodyArra = this.getModel(ModelNapeBodyCircle);
	}

	/** **/
	override public function updateSystem(dt :Float) : Void
	{
		for(mBody in _modelBodyArra) {
			if(_isLeft)
				mBody.body.velocity.x -= dt * 1000;
			if(_isRight)
				mBody.body.velocity.x += dt * 1000;
			if(_isDown)
				mBody.body.velocity.y += dt * 1000;
			if(_isUp)
				mBody.body.velocity.y -= dt * 1000;
		}
	}

	/** **/
	private function onKeyDown(key :Key, value :String) : Void
	{
		switch(key) {
			case Key.UP:
				_isDown = false;
				_isUp = true;
			case Key.DOWN:
				_isDown = true;
				_isUp = false;
			case Key.LEFT:
				_isLeft = true;
				_isRight = false;
			case Key.RIGHT:
				_isLeft = false;
				_isRight = true;
			case _:
		}
	}
	
	/** **/
	private function onKeyUp(key :Key, value :String) : Void
	{
		switch(key) {
			case Key.UP:
				_isUp = false;
			case Key.DOWN:
				_isDown = false;
			case Key.LEFT:
				_isLeft = false;
			case Key.RIGHT:
				_isRight = false;
			case _:
		}
	}

	private var _modelBodyArra :Array<ModelNapeBodyCircle>;

	private var _isLeft :Bool = false;
	private var _isRight :Bool = false;
	private var _isUp :Bool = false;
	private var _isDown :Bool = false;
}