package cranberry.sprite;

import cranberry.graphics.Color;
import cranberry.graphics.Framebuffer;

/** **/
class SpriteFillRect extends Sprite
{
	public var color :Color;
	public var width :Float;
	public var height :Float;

	/** **/
	public function new(id :Int, color :Color, width :Float, height :Float) : Void
	{
		super(id);
		this.color = color;
		this.width = width;
		this.height = height;
	}

	/** **/
	override public function render(framebuffer :Framebuffer) : Void
	{
		framebuffer.g2.color = this.color;
		framebuffer.g2.fillRect(0, 0, width, height);
	}

	/** **/
	override public function centerAnchor() : Sprite
	{
		this.anchorX = this.width/2;
		this.anchorY = this.height/2;
		return this;
	}
}