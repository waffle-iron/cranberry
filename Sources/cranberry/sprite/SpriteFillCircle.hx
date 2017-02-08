package cranberry.sprite;

using kha.graphics2.GraphicsExtension;

class SpriteFillCircle extends Sprite
{
	public var color :kha.Color;
	public var radius :Float;

	public function new(color :kha.Color, radius :Float) : Void
	{
		super();
		this.color = color;
		this.radius = radius;
	}

	override public function render(framebuffer :kha.Framebuffer) : Void
	{
		framebuffer.g2.color = this.color;
		framebuffer.g2.fillCircle(0, 0, radius);
	}
}