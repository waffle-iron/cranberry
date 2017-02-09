package shmup.logic;

import shmup.model.ModelSpin;

class LogicSpin extends cranberry.logic.Logic
{

	/** **/
	public function new() : Void
	{
		super();
	}

	/** **/
	override public function onAdded() : Void
	{
		_modelSpinArra = this.getModel(ModelSpin);
	}

	/** **/
	override public function onUpdate(dt :Float) : Void
	{
		for(modelSpin in _modelSpinArra) {
			modelSpin.rotation += dt * modelSpin.speed;
		}
	}

	private var _modelSpinArra :Array<ModelSpin>;
}