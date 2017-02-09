package shmup.model;

import cranberry.model.Model;

class ModelController extends Model
{
	public var velocityX :Float = 0;
	public var velocityY :Float = 0;
	public var x :Float = 0;
	public var y :Float = 0;
	public var acceleration :Float;

	/** **/
	public function new(acceleration :Float) : Void
	{
		super();
		this.acceleration = acceleration;
	}

	/** **/
	override public function onAdded(sprite :cranberry.sprite.Sprite) : Void
	{
		x = sprite.x;
		y = sprite.y;
	}

	/** **/
	override public function updateSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		sprite.x = x;
		sprite.y = y;
	}
}