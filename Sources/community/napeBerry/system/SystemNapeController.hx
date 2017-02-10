package community.napeBerry.system;

import community.napeBerry.model.ModelNapeBody;

/** **/
class SystemNapeController extends cranberry.system.System
{
	/** **/
	public function new() : Void
	{
		kha.input.Keyboard.get().notify(onKeyDown, onKeyUp);
		_modelBodyArra = this.getModel(ModelNapeBody);
	}

	/** **/
	override public function updateSystem(dt :Float) : Void
	{
		for(mBody in _modelBodyArra) {
			if(_isLeft)
				mBody.body.velocity.x -= dt * 100;
			if(_isRight)
				mBody.body.velocity.x += dt * 100;
			if(_isDown)
				mBody.body.velocity.y += dt * 100;
			if(_isUp)
				mBody.body.velocity.y -= dt * 100;
		}
	}

	/** **/
	private function onKeyDown(key :kha.Key, value :String) : Void
	{
		switch(key) {
			case kha.Key.UP:
				_isDown = false;
				_isUp = true;
			case kha.Key.DOWN:
				_isDown = true;
				_isUp = false;
			case kha.Key.LEFT:
				_isLeft = true;
				_isRight = false;
			case kha.Key.RIGHT:
				_isLeft = false;
				_isRight = true;
			case _:
		}
	}
	
	/** **/
	private function onKeyUp(key :kha.Key, value :String) : Void
	{
		switch(key) {
			case kha.Key.UP:
				_isUp = false;
			case kha.Key.DOWN:
				_isDown = false;
			case kha.Key.LEFT:
				_isLeft = false;
			case kha.Key.RIGHT:
				_isRight = false;
			case _:
		}
	}

	private var _modelBodyArra :Array<ModelNapeBody>;

	private var _isLeft :Bool = false;
	private var _isRight :Bool = false;
	private var _isUp :Bool = false;
	private var _isDown :Bool = false;
}