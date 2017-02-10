package community.napeBerry.system;

import cranberry.system.System;
import community.napeBerry.model.ModelNapeBody;

import nape.geom.Vec2;
import nape.space.Space;


class SystemNape extends System
{

	public function new() : Void
	{
		_space = new Space(new Vec2(0, 0));
		_modelBodyArra = this.getModel(ModelNapeBody);
	}

	override public function updateSystem(dt :Float) : Void
	{
		if(dt > 0)
			_space.step(dt);

		for(body in _modelBodyArra) {
			if(!body.hasBeenAdded) {
				body.body.space = _space;
			}
		}
	}

	private var _space :Space;
	private var _modelBodyArra :Array<ModelNapeBody>;

}