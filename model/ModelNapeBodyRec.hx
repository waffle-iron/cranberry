package cranberry.model;


import cranberry.model.Model;

import nape.phys.Body;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.geom.Vec2;
import nape.phys.BodyType;

using cranberry.math.CMath;

class ModelNapeBodyRec extends ModelNapeBody
{
	public function new(id :Int, width :Float, height :Float, isStatic :Bool) : Void
	{
        super(id);
		this.napeShape = RECTANGLE(width, height);
		this.bodyType = isStatic ? BodyType.STATIC : BodyType.DYNAMIC;
		this.isStatic = isStatic;
		hasBeenAdded = false;

		trace("new ModelNapeBodyRec!!");
	}
}
