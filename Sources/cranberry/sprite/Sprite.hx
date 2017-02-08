package cranberry.sprite;

import kha.Framebuffer;
import kha.Color;

class Sprite
{
	public var x :Float = 0;
	public var y :Float = 0;
	public var anchorX :Float = 0;
	public var anchorY :Float = 0;
	public var scaleX :Float = 1;
	public var scaleY :Float = 1;
	public var rotation :Float = 0;
	public var alpha :Float = 1;
	public var visible :Bool = true;

	/** **/
	public function new() : Void
	{
	}

	/** **/
	public function render(framebuffer: Framebuffer) : Void
	{
	}

	/** **/
	public function centerAnchor() : Sprite
	{
		return this;
	}

	/** **/
	@:final public function addLogic(logic :cranberry.logic.Logic) : Sprite
	{
		_logicArra.push(logic);
		logic._onAdded(this);
		return this;
	}	

	/** **/
	@:final public function removeLogic(logic :cranberry.logic.Logic) : Sprite
	{
		_logicArra.remove(logic);
		logic._onRemoved(this);
		return this;
	}

	/** **/
	@:final public function addSprite(child :Sprite) : Sprite
	{
		_children.push(child);
		return this;
	}	

	/** **/
	@:final public function removeSprite(child :Sprite) : Sprite
	{
		_children.remove(child);
		return this;
	}	

	/** **/
	@:final public function setXY(x :Float, y :Float) : Sprite
	{
		this.x = x;
		this.y = y;
		return this;
	}

	/** **/
	@:final public function setAnchorXY(x :Float, y :Float) : Sprite
	{
		this.anchorX = x;
		this.anchorY = y;
		return this;
	}

	/** **/
	@:final public function setRotation(degrees :Float) : Sprite
	{
		this.rotation = degrees;
		return this;
	}

	/** **/
	@:final public function setAlpha(alpha :Float) : Sprite
	{
		this.alpha = alpha;
		return this;
	}

	/** **/
	@:final public function setScaleXY(scaleX :Float, scaleY :Float) : Sprite
	{
		this.scaleX = scaleX;
		this.scaleY = scaleY;
		return this;
	}

	/** **/
	@:allow(cranberry.System)
	@:final private function _render(framebuffer: Framebuffer): Void 
	{
		framebuffer.g2.color = Color.White;
		var sin = Math.sin(toRadians(rotation));
        var cos = Math.cos(toRadians(rotation));
		
		var gMatrix = framebuffer.g2.transformation.multmat(new kha.math.FastMatrix3(
			cos*scaleX, -sin*scaleY, x,
			sin*scaleX, cos*scaleY, y,
			0, 0, 1
		));
		framebuffer.g2.pushTransformation(gMatrix.multmat(kha.math.FastMatrix3.translation(-anchorX, -anchorY)));

		if(alpha < 1)
			framebuffer.g2.opacity *= this.alpha;

		if(visible && alpha > 0) {
			render(framebuffer);
			for(child in _children)
				child._render(framebuffer);
		}

		framebuffer.g2.opacity = 1;
		framebuffer.g2.popTransformation();
	}

	/** **/
	@:allow(cranberry.System)
	@:final private function _runLogic(dt: Float): Void 
	{
		for(logic in _logicArra)
			logic._onUpdate(dt, this);
		for(child in _children)
			child._runLogic(dt);
	}

	private inline function toRadians (degrees :Float) : Float
	{
		return degrees * (Math.PI/180);
	}

	private var _children :Array<Sprite> = [];
	private var _logicArra :Array<cranberry.logic.Logic> = [];
}