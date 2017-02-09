package cranberry.sprite;

/** **/
class SpriteImage extends Sprite
{
	public var image :kha.Image;

	/** **/
	public function new(image :kha.Image) : Void
	{
		super();
		this.image = image;
	}

	/** **/
	override public function render(framebuffer :kha.Framebuffer) : Void
	{
		framebuffer.g2.drawImage(image, 0, 0);
	}

	/** **/
	override public function centerAnchor() : Sprite
	{
		this.anchorX = this.image.width/2;
		this.anchorY = this.image.height/2;
		return this;
	}
}