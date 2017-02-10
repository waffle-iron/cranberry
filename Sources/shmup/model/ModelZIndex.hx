package shmup.model;

import cranberry.model.Model;
import cranberry.sprite.Sprite;

class ModelZIndex extends Model
{
	public var sprites :Array<Sprite>;

	public function new() : Void
	{
	}

	/** **/
	override public function onAddedToSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		sprites = sprite.getSprites();
	}
}