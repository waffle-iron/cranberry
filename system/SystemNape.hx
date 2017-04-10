package cranberry.system;

import cranberry.system.System;
import cranberry.model.ModelNapeBodyCircle;
import cranberry.model.ModelNapeBodyRec;

import nape.geom.Vec2;
import nape.space.Space;


class SystemNape extends System
{
	public static var space :Space;

	public function new() : Void
	{
        super();
		space = new Space(new Vec2(0, 600));
		_modelBodyArra = this.getModel(ModelNapeBodyCircle);
		_modelBodyArra2 = this.getModel(ModelNapeBodyRec);
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

		for(body in _modelBodyArra2) {
			if(!body.hasBeenAdded) {
				body.hasBeenAdded = true;
				body.body.space = space;
			}
		}
	}

	private var _modelBodyArra :Array<ModelNapeBodyCircle>;
	private var _modelBodyArra2 :Array<ModelNapeBodyRec>;


}