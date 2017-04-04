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

import cranberry.graphics.Color;
import cranberry.graphics.Framebuffer;
import cranberry.graphics.Image;

/** **/
class SpriteSubImage extends Sprite
{
	public var image :Image;
	public var width :Float;
	public var height :Float;
	public var sx :Float;
	public var sy :Float;

	/** **/
	public function new(id :Int, image :Image, sx :Float, sy :Float, width :Float, height :Float) : Void
	{
		super(id);
		this.image = image;
		this.sx = sx;
		this.sy = sy;
		this.width = width;
		this.height = height;
	}

	/** **/
	override public function render(framebuffer :Framebuffer) : Void
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