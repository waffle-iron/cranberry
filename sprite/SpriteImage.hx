package cranberry.sprite;

import cranberry.graphics.Color;
import cranberry.graphics.Framebuffer;
import cranberry.graphics.Image;

/** **/
class SpriteImage extends Sprite
{
	public var image :Image;

	/** **/
	public function new(id :Int, image :Image) : Void
	{
		super(id);
		this.image = image;
	}

	/** **/
	override public function render(framebuffer :Framebuffer) : Void
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