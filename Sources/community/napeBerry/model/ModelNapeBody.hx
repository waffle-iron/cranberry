package community.napeBerry.model;

import cranberry.model.Model;

import nape.phys.Body;
import nape.shape.Circle;
import nape.geom.Vec2;

class ModelNapeBody extends Model
{
	public var body :Body;
	public var hasBeenAdded :Bool;

	public function new() : Void
	{
		hasBeenAdded = false;
	}

	/** **/
	override public function updateSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		sprite.x = body.position.x;
		sprite.y = body.position.y;
	}

	/** **/
	override public function onAddedToSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		body = new Body();
		body.shapes.add(new Circle(50));
		body.position = new Vec2(sprite.x, sprite.y);
	}

	/** **/
	override public function onRemovedFromSprite(sprite :cranberry.sprite.Sprite) : Void
	{
	}
}