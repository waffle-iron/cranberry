package shmup.system;

import shmup.model.ModelController;

/** **/
class SystemController extends cranberry.system.System
{
	/** **/
	public function new() : Void
	{
		kha.input.Keyboard.get().notify(onKeyDown, onKeyUp);
		_modelControllerArra = this.getModel(ModelController);
	}

	/** **/
	override public function updateSystem(dt :Float) : Void
	{
		for(model in _modelControllerArra) {
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

	private var _modelControllerArra :Array<ModelController>;

	private var _isLeft :Bool = false;
	private var _isRight :Bool = false;
	private var _isUp :Bool = false;
	private var _isDown :Bool = false;
}