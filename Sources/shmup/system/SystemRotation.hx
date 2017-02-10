package shmup.system;

import shmup.model.ModelRotation;

class SystemRotation extends cranberry.system.System
{

	/** **/
	public function new() : Void
	{
		_modelRotationArra = this.getModel(ModelRotation);
	}

	/** **/
	override public function updateSystem(dt :Float) : Void
	{
		for(modelRotation in _modelRotationArra)
			modelRotation.rotation += dt * modelRotation.speed;
	}

	private var _modelRotationArra :Array<ModelRotation>;
}