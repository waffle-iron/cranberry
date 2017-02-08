package cranberry.logic;

class LogicSystem
{
	/** **/
	public function new() : Void
	{
	}

	public function onAdded() : Void
	{

	}

	public function onUpdate(dt :Float) : Void
	{

	} 

	/** **/
	@:allow(cranberry.logic.Logic)
	@:final private function addLogic(logic :Logic) : LogicSystem
	{
		var logicArra = getLogic(Type.getClass(logic));
		logicArra.push(logic);
		return this;
	}

	/** **/
	@:allow(cranberry.logic.Logic)
	@:final private function removeLogic(logic :Logic) : LogicSystem
	{
		var logicArra = getLogic(Type.getClass(logic));
		logicArra.remove(logic);
		return this;
	}

	/** **/
	@:final public function getLogic<T>(classType :Class<T>) :Array<T>
	{
		var className :String = Type.getClassName(classType);
		var logicArray = _logicMap.get(className);
		if(logicArray == null) {
			logicArray = new Array<Any>();
			_logicMap.set(className, logicArray);
		}

		return cast logicArray;
	}

	private var _logicMap :Map<String, Array<Any>> = new Map<String, Array<Any>>();
}