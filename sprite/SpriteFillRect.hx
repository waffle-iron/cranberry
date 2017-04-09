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

/** **/
@:keep
class SpriteFillRect extends Sprite
{
	public var color :Color;
	public var width :Float;
	public var height :Float;

	/** **/
	public function new(color :Color, width :Float, height :Float) : Void
	{
		super();
		this.color = color;
		this.width = width;
		this.height = height;
	}

	/** **/
	override public function render(framebuffer :Framebuffer) : Void
	{
		framebuffer.g2.color = 0xFF000000 + this.color;
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