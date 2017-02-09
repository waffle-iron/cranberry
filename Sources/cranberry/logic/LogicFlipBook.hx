package cranberry.logic;

import cranberry.model.ModelFlipBook;

/** **/
class LogicFlipBook extends Logic
{
	/** **/
	public function new() : Void
	{
		super();
	}

	override public function onAdded() : Void
	{
		_modelBookArra = this.getModel(ModelFlipBook);
	}

	override public function onUpdate(dt :Float) : Void
	{
		for(model in _modelBookArra) {
			model.elapsed = (model.elapsed + dt*model.speed)%(model.rows*model.columns);
			model.frame = Math.floor(model.elapsed);
			model.sx = (model.frame%model.columns) * model.frameWidth;
			model.sy = (Math.floor(model.frame/model.columns)) * model.frameHeight;
		}
	}

	private var _modelBookArra :Array<ModelFlipBook>;
}