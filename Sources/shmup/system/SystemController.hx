package shmup.system;

import shmup.model.ModelController;

using cranberry.math.CMath;

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
		for(mCtrl in _modelControllerArra) {
			if(_isLeft)
				mCtrl.velocityX -= dt * mCtrl.acceleration;
			if(_isRight)
				mCtrl.velocityX += dt * mCtrl.acceleration;
			if(_isDown)
				mCtrl.velocityY += dt * mCtrl.acceleration;
			if(_isUp)
				mCtrl.velocityY -= dt * mCtrl.acceleration;

			mCtrl.x = (mCtrl.x + mCtrl.velocityX).clampFloat(0, 1024-100);
			mCtrl.y = (mCtrl.y + mCtrl.velocityY).clampFloat(0, 768-100);
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