package shmup.system;

import shmup.model.ModelZIndex;

class SystemZIndex extends cranberry.system.System
{

	/** **/
	public function new() : Void
	{
		_modelZIndexArra = this.getModel(ModelZIndex);
	}

	/** **/
	override public function updateSystem(dt :Float) : Void
	{
		for(modelZIndex in _modelZIndexArra)
			modelZIndex.sprites.sort(function(spr :cranberry.sprite.Sprite, otherSpr :cranberry.sprite.Sprite) {
				return Std.int(spr.y - otherSpr.y);
			});
	}

	private var _modelZIndexArra :Array<ModelZIndex>;
}