package cranberry.model;

import cranberry.logic.Logic;

/** **/
class Model
{
	/** **/
	public function new() : Void
	{
	}

	/** **/
	public function updateSprite(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	/** **/
	public function onAdded(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	/** **/
	public function onRemoved(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	/** **/
	@:final public function addLogic(logic :cranberry.logic.Logic) : Model
	{
		logic.addModel(this);
		logic.onAdded();
		return this;
	}

	/** **/
	@:final public function removeLogic(logic :cranberry.logic.Logic) : Model
	{
		logic.removeModel(this);
		logic.onRemoved();
		return this;
	}
}