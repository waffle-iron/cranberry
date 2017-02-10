package community.napeBerry.system;

import cranberry.system.System;
import community.napeBerry.model.ModelNapeBody;

import nape.geom.Vec2;
import nape.space.Space;


class SystemNape extends System
{
	public var space :Space;

	public function new() : Void
	{
		space = new Space(new Vec2(0, 600));
		_modelBodyArra = this.getModel(ModelNapeBody);
	}

	override public function updateSystem(dt :Float) : Void
	{
		if(dt > 0)
			space.step(dt);

		for(body in _modelBodyArra) {
			if(!body.hasBeenAdded) {
				body.hasBeenAdded = true;
				body.body.space = space;
			}
		}
	}

	private var _modelBodyArra :Array<ModelNapeBody>;

}