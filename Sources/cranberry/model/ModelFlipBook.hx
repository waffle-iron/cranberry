package cranberry.model;

import cranberry.sprite.SpriteSubImage;

class ModelFlipBook extends Model
{
	public var sx :Float = 0;
	public var sy :Float = 0;
	public var frame :Int = 0;
	public var elapsed :Float = 0;
	public var speed :Float;
	public var frameWidth :Float;
	public var frameHeight :Float;
	public var columns :Int;
	public var rows :Int;

	public function new(speed :Float) : Void
	{
		super();
		this.speed = speed;
	}

	/** **/
	override public function onAdded(sprite :cranberry.sprite.Sprite) : Void
	{
		var spr = cast(sprite, SpriteSubImage);
		frameWidth = spr.width;
		frameHeight = spr.height;
		columns = Math.round(spr.image.width/frameWidth);
		rows = Math.round(spr.image.height/frameHeight);
	}

	/** **/
	override public function updateSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		cast(sprite, SpriteSubImage).setPos(sx,sy);
	}
}