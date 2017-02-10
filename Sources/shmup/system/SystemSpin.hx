package shmup.system;

import shmup.model.ModelSpin;

class SystemSpin extends cranberry.system.System
{

	/** **/
	public function new() : Void
	{
		_modelSpinArra = this.getModel(ModelSpin);
	}

	/** **/
	override public function updateSystem(dt :Float) : Void
	{
		for(modelSpin in _modelSpinArra)
			modelSpin.rotation += dt * modelSpin.speed;
	}

	private var _modelSpinArra :Array<ModelSpin>;
}