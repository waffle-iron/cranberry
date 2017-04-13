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

package cranberry.platform.empty.graphics;

import cranberry.platform.empty.math.Matrix;

class Graphics
{
	public var color :Color;
	public var opacity :Float;
	public var transformation: Matrix;

	public function begin(clear: Bool = true, clearColor: Color = null): Void {}
	public function end(): Void {}
	public function popTransformation(): Matrix {return null;}
	public function pushTransformation(transformation: Matrix): Void {}

	public function drawLine (x1:Float, y1:Float, x2:Float, y2:Float, ?strength:Float) :Void {}
	public function fillRect(x: Float, y: Float, width: Float, height: Float): Void {}
	public function drawRect (x:Float, y:Float, width:Float, height:Float, ?strength:Float): Void {}
	public function fillCircle(cx: Float, cy: Float, radius: Float, segments: Int = 0): Void {}
	public function drawCircle(cx: Float, cy: Float, radius: Float, strength: Float = 1, segments: Int = 0): Void {}
	public function drawSubImage(img: Image, x: Float, y: Float, sx: Float, sy: Float, sw: Float, sh: Float): Void {}
	public function drawImage(img: Image, x: Float, y: Float): Void {}
}