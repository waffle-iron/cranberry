package cranberry.logic;

import cranberry.model.Model;

/** **/
class Logic
{
	/** **/
	public function new() : Void
	{
	}

	/** **/
	public function onAdded() : Void
	{

	}

	/** **/
	public function onRemoved() : Void
	{

	}

	/** **/
	public function onUpdate(dt :Float) : Void
	{

	} 

	/** **/
	@:allow(cranberry.model.Model)
	@:final private function addModel(model :Model) : Logic
	{
		var modelArra = getModel(Type.getClass(model));
		modelArra.push(model);
		return this;
	}

	/** **/
	@:allow(cranberry.model.Model)
	@:final private function removeModel(model :Model) : Logic
	{
		var modelArra = getModel(Type.getClass(model));
		modelArra.remove(model);
		return this;
	}

	/** **/
	@:final public function getModel<T>(classType :Class<T>) :Array<T>
	{
		var className :String = Type.getClassName(classType);
		var modelArra = _modelMap.get(className);
		if(modelArra == null) {
			modelArra = new Array<Any>();
			_modelMap.set(className, modelArra);
		}

		return cast modelArra;
	}

	private var _modelMap :Map<String, Array<Any>> = new Map<String, Array<Any>>();
}