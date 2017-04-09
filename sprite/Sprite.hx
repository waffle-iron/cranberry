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
import cranberry.util.Disposable;

using cranberry.math.CMath;

/** **/
@:keep
class Sprite implements Disposable
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
	public var locked :Bool = false;

	public var id (default, null):Int;
	
	public var parent (default, null):Sprite = null;
	public var firstChild (default, null):Sprite = null;
	public var next (default, null):Sprite = null;
	public var firstModel (default, null) :Model = null;

	public function new(id :Int) : Void
	{
		this.id = id;
	}

	public function render(framebuffer: Framebuffer) : Void
	{
	}

	@:final public function addSprite(child :Sprite) : Sprite
	{
		if (child.parent != null)
			child.parent.removeSprite(child);
		child.parent = this;

		var tail = null, p = firstChild;
		while (p != null) {
			tail = p;
			p = p.next;
		}
		if (tail != null)
			tail.next = child;
		else
			firstChild = child;

		return this;
	}	

	@:final public function removeSprite(child :Sprite) : Void
	{
		var prev :Sprite = null, p = firstChild;
        while (p != null) {
            var next = p.next;
            if (p == child) {
                if (prev == null) {
                    firstChild = next;
                } else {
                    prev.next = next;
                }
                p.parent = null;
                p.next = null;
                return;
            }
            prev = p;
            p = next;
        }
	}

	@:final public function addModel(model :Model) : Sprite
	{
		if (model.owner != null)
			model.owner.removeModel(model);

		var tail = null, p = firstModel;
		while (p != null) {
			tail = p;
			p = p.next;
		}
		if (tail != null)
			tail.next = model;
		else
			firstModel = model;

		model.owner = this;
		model.next = null;
		model.onAddedToSprite(this);

		return this;
	}

	@:final public function removeModel(model :Model) : Bool
	{
		var prev :Model = null, p = firstModel;
        while (p != null) {
            var next = p.next;
            if (p == model) {
                if (prev == null) {
                    firstModel = next;
                } else {
                    prev.owner = this;
                    prev.next = next;
                }

				model.onRemovedFromSprite(this);
                p.owner = null;
                p.next = null;
                return true;
            }
            prev = p;
            p = next;
        }

		return false;
	}

	public function centerAnchor() : Sprite
	{
		return this;
	}

	@:final public function setXY(x :Float, y :Float) : Sprite
	{
		this.x = x;
		this.y = y;
		return this;
	}

	@:final public function setAnchorXY(x :Float, y :Float) : Sprite
	{
		this.anchorX = x;
		this.anchorY = y;
		return this;
	}

	@:final public function setRotation(degrees :Float) : Sprite
	{
		this.rotation = degrees;
		return this;
	}

	@:final public function setAlpha(alpha :Float) : Sprite
	{
		this.alpha = alpha;
		return this;
	}

	@:final public function setScaleXY(scaleX :Float, scaleY :Float) : Sprite
	{
		this.scaleX = scaleX;
		this.scaleY = scaleY;
		return this;
	}

	public function disposeChildren ()
    {
        while (firstChild != null) {
            firstChild.dispose();
        }
    }

	public function dispose ()
    {
        if (parent != null) {
            parent.removeSprite(this);
        }

        while (firstModel != null) {
            firstModel.dispose();
        }
        disposeChildren();
    }

	@:allow(cranberry.Cranberry)
	@:final private function _render(framebuffer: Framebuffer): Void 
	{
		var model = this.firstModel;
		while(model != null) {
			model.updateSprite(this);
			model = model.next;
		}

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
			var p = firstChild;
			while(p != null) {
				p._render(framebuffer);
				p = p.next;
			}
		}

		framebuffer.g2.opacity = 1;
		framebuffer.g2.popTransformation();
	}
}