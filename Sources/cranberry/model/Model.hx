package cranberry.model;

import cranberry.system.System;

/** **/
class Model
{
	/** **/
	public function updateSprite(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	/** **/
	public function onAddedToSprite(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	/** **/
	public function onRemovedFromSprite(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	/** **/
	@:final public function addSystem(system :cranberry.system.System) : Model
	{
		system.addModel(this);
		return this;
	}

	/** **/
	@:final public function removeSystem(system :cranberry.system.System) : Model
	{
		system.removeModel(this);
		return this;
	}
}