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

package cranberry.platform.kha.graphics;

import kha.graphics2.GraphicsExtension;

@:forward(color, opacity, transformation, begin, end, popTransformation, pushTransformation, fillRect, drawSubImage, drawImage, drawRect, drawLine)
abstract Graphics(kha.graphics2.Graphics) to kha.graphics2.Graphics from kha.graphics2.Graphics
{
	public function fillCircle(cx: Float, cy: Float, radius: Float, segments: Int = 0): Void
	{
		GraphicsExtension.fillCircle(this, cx, cy, radius, segments);
	}

	public function drawCircle(cx: Float, cy: Float, radius: Float, strength: Float = 1, segments: Int = 0): Void
	{
		GraphicsExtension.drawCircle(this, cx, cy, radius, strength, segments);
	}
}