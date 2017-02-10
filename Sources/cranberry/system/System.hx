package cranberry.system;

import cranberry.model.Model;

/** **/
class System
{
	/** **/
	public function updateSystem(dt :Float) : Void
	{

	} 

	/** **/
	@:allow(cranberry.model.Model)
	@:final private function addModel(model :Model) : System
	{
		var modelArra = getModel(Type.getClass(model));
		modelArra.push(model);
		return this;
	}

	/** **/
	@:allow(cranberry.model.Model)
	@:final private function removeModel(model :Model) : System
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