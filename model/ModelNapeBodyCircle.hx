package cranberry.model;


import cranberry.model.Model;

import nape.phys.Body;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.geom.Vec2;
import nape.phys.BodyType;

using cranberry.math.CMath;

class ModelNapeBodyCircle extends ModelNapeBody
{
	public function new(radius :Float, isStatic :Bool) : Void
	{
		this.napeShape = CIRCLE(radius);
		this.bodyType = isStatic ? BodyType.STATIC : BodyType.DYNAMIC;
		this.isStatic = isStatic;
		hasBeenAdded = false;
	}

}