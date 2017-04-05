/*
 * Copyright (c) 2017 Jeremy Meltingtallow
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package cranberry.sprite;

import cranberry.model.Model;
import cranberry.graphics.Framebuffer;
import cranberry.graphics.Color;
import cranberry.math.Matrix;

import cranberry.util.Maybe;

using cranberry.math.CMath;

/** **/
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
	public var active :Bool = true;
	public var locked :Bool = true;

	public var id (default, null):Int;
	

	/** **/
	public function new(id :Int) : Void
	{
		this.id = id;
	}

	/** **/
	public function render(framebuffer: Framebuffer) : Void
	{
	}

	/** **/
	@:final public function addModel(model :Model) : Sprite
	{
		_modelArra.push(model);
		model.onAddedToSprite(this);
		return this;
	}	

	/** **/
	@:final public function removeModel(model :Model) : Sprite
	{
		_modelArra.remove(model);
		model.onRemovedFromSprite(this);
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
	@:final public inline function getSprites() : Array<Sprite>
	{
		return _children;
	}

	/** **/
	@:final public function getSprite(id :Int) : Maybe<Sprite>
	{
		for(child in _children) {
			if(child.id == id)
				return Just(child);
		}
		return Nothing;
	}

	/** **/
	public function centerAnchor() : Sprite
	{
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
	@:allow(cranberry.Cranberry)
	@:final private function _render(framebuffer: Framebuffer): Void 
	{
		for(model in _modelArra)
			model.updateSprite(this);

		framebuffer.g2.color = Color.White;
		var sin = Math.sin(rotation.toRadians());
		var cos = Math.cos(rotation.toRadians());
		
		var gMatrix = framebuffer.g2.transformation.multmat(new Matrix(
			cos*scaleX, -sin*scaleY, x,
			sin*scaleX, cos*scaleY, y,
			0, 0, 1
		));
		framebuffer.g2.pushTransformation(gMatrix.multmat(Matrix.translation(-anchorX, -anchorY)));

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

	private var _children :Array<Sprite> = [];
	private var _modelArra :Array<Model> = []; //implement only unique models!
}