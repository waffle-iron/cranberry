package cranberry.sprite;

/** **/
class SpriteFillRect extends Sprite
{
	public var color :kha.Color;
	public var width :Float;
	public var height :Float;

	/** **/
	public function new(color :kha.Color, width :Float, height :Float) : Void
	{
		super();
		this.color = color;
		this.width = width;
		this.height = height;
	}

	/** **/
	override public function render(framebuffer :kha.Framebuffer) : Void
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