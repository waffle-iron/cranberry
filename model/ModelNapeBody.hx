package cranberry.model;


import cranberry.model.Model;

import nape.phys.Body;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.geom.Vec2;
import nape.phys.BodyType;

using cranberry.math.CMath;

class ModelNapeBody extends Model
{
	public var body :Body;
	public var hasBeenAdded :Bool;
	public var napeShape :NapeShape;
	public var bodyType :BodyType;
	public var isStatic (default, set) :Bool;

	/** **/
	override public function updateSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		sprite.x = body.position.x;
		sprite.y = body.position.y;
		sprite.rotation = body.rotation.toDegrees();
	}

	/** **/
	override public function onAddedToSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		body = new Body();
		var shape = switch napeShape {
			case RECTANGLE(width, height): new Polygon(Polygon.box(width, height));
			case CIRCLE(radius): new Circle(radius);
		};
		shape.material = nape.phys.Material.rubber();
		body.shapes.add(shape);
		body.type = bodyType;
		body.position = new Vec2(sprite.x, sprite.y);
	}

	/** **/
	override public function onRemovedFromSprite(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	private function set_isStatic(isStatic :Bool) : Bool
	{
		this.isStatic = isStatic;
		trace(isStatic);
		if(body != null) {
			body.type = isStatic ? BodyType.STATIC : BodyType.DYNAMIC;
		}
		return isStatic;
	}
}

enum NapeShape
{
	RECTANGLE(width :Float, height :Float);
	CIRCLE(radius :Float);
}