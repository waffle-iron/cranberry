package shmup.model;

import cranberry.model.Model;

class ModelSpin extends Model
{
	public var rotation :Float;
	public var speed :Float;

	public function new(rotation :Float, speed :Float) : Void
	{
		super();
		this.rotation = rotation;
		this.speed = speed;
	}

	/** **/
	override public function updateSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		sprite.rotation = rotation;
	}	
}