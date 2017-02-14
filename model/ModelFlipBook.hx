package cranberry.model;

import cranberry.sprite.Sprite;
import cranberry.sprite.SpriteSubImage;

class ModelFlipBook extends Model
{
	public var sx :Float = 0;
	public var sy :Float = 0;
	public var frame :Int = 0;
	public var elapsed :Float = 0;
	public var speed :Float;
	public var columns :Int;
	public var rows :Int;
	public var frameWidth :Float;
	public var frameHeight :Float;

	public function new(speed :Float, columns :Int, rows :Int) : Void
	{
		this.speed = speed;
		this.columns = columns;
		this.rows = rows;
	}

	/** **/
	override public function onAddedToSprite(sprite :Sprite) : Void
	{
		var spr = cast(sprite, SpriteSubImage);
		frameWidth = spr.image.width/columns;
		frameHeight = spr.image.height/rows;
		spr.setDimensions(frameWidth, frameHeight);
	}

	/** **/
	override public function updateSprite(sprite :Sprite) : Void
	{
		cast(sprite, SpriteSubImage).setPos(sx,sy);
	}
}