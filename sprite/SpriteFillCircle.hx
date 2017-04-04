package cranberry.sprite;

import cranberry.graphics.Color;
import cranberry.graphics.Framebuffer;

/** **/
class SpriteFillCircle extends Sprite
{
	public var color :Color;
	public var radius :Float;

	/** **/
	public function new(id :Int, color :Color, radius :Float) : Void
	{
		super(id);
		this.color = color;
		this.radius = radius;
	}

	/** **/
	override public function render(framebuffer :Framebuffer) : Void
	{
		framebuffer.g2.color = this.color;
		framebuffer.g2.fillCircle(0, 0, radius);
	}
}