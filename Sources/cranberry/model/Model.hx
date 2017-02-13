package cranberry.model;

import cranberry.sprite.Sprite;
import cranberry.system.System;

/** **/
class Model
{
	/** **/
	public function updateSprite(sprite :Sprite) : Void
	{
	}

	/** **/
	public function onAddedToSprite(sprite :Sprite) : Void
	{
	}

	/** **/
	public function onRemovedFromSprite(sprite :Sprite) : Void
	{
	}

	/** **/
	@:final public function addSystem(system :System) : Model
	{
		system.addModel(this);
		return this;
	}

	/** **/
	@:final public function removeSystem(system :System) : Model
	{
		system.removeModel(this);
		return this;
	}
}