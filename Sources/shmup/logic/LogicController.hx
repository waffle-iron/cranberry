package shmup.logic;

import cranberry.logic.Logic;

class LogicController extends Logic
{

	public var velocityX :Float = 0;
	public var velocityY :Float = 0;
	public var acceleration :Float;

	public var initialX :Float;
	public var initialY :Float;

	/** **/
	public function new(acceleration :Float) : Void
	{
		super();
		this.acceleration = acceleration;
		kha.input.Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	/** **/
	override public function onAdded(sprite :cranberry.sprite.Sprite) : Void
	{
		initialX = sprite.x;
		initialY = sprite.y;
	}

	/** **/
	override public function onRemoved(sprite :cranberry.sprite.Sprite) : Void
	{
		sprite.alpha = 0.2;
	}

	/** **/
	override public function onUpdate(dt :Float, sprite :cranberry.sprite.Sprite) : Void
	{
		if(_isLeft)
			velocityX -= dt * acceleration;
		if(_isRight)
			velocityX += dt * acceleration;
		if(_isDown)
			velocityY += dt * acceleration;
		if(_isUp)
			velocityY -= dt * acceleration;

		sprite.x += velocityX;
		sprite.y += velocityY;

		initialX = sprite.x;
	}

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
			case kha.Key.SHIFT:
				this.destroy();
			case _:
		}
	}

	private var _isLeft :Bool = false;
	private var _isRight :Bool = false;
	private var _isUp :Bool = false;
	private var _isDown :Bool = false;
}