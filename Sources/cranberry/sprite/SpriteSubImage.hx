package cranberry.sprite;

/** **/
class SpriteSubImage extends Sprite
{
	public var image :kha.Image;
	public var width :Float;
	public var height :Float;
	public var sx :Float;
	public var sy :Float;

	/** **/
	public function new(image :kha.Image, sx :Float, sy :Float, width :Float, height :Float) : Void
	{
		super();
		this.image = image;
		this.sx = sx;
		this.sy = sy;
		this.width = width;
		this.height = height;
	}

	/** **/
	override public function render(framebuffer :kha.Framebuffer) : Void
	{
		framebuffer.g2.drawSubImage(image, 0, 0, sx, sy, width, height);
	}

	/** **/
	public function setPos(sx :Float, sy :Float) : SpriteSubImage
	{
		this.sx = sx;
		this.sy = sy;
		return this;
	}

	/** **/
	public function setDimensions(width :Float, height :Float) : SpriteSubImage
	{
		this.width = width;
		this.height = height;
		return this;
	}

	/** **/
	override public function centerAnchor() : Sprite
	{
		this.anchorX = width/2;
		this.anchorY = height/2;
		return this;
	}
}