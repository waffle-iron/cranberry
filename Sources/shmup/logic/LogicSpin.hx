package shmup.logic;

import cranberry.logic.Logic;

class LogicSpin extends Logic
{
	public var speed :Float;

	public function new(speed :Float) : Void
	{
		super();
		this.speed = speed;
	}

	/** **/
	override public function onUpdate(dt :Float, sprite :cranberry.sprite.Sprite) : Void
	{
		sprite.rotation += dt * speed;
	}	
}