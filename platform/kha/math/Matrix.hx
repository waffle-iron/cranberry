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

package cranberry.platform.kha.math;

import kha.math.FastMatrix3;
import kha.FastFloat;

@:forward(multmat)
abstract Matrix(FastMatrix3) to FastMatrix3 from FastMatrix3
{
	public function new(_00: Float, _10: Float, _20: Float, _01: Float, _11: Float, _21: Float, _02: Float, _12: Float, _22: Float) : Void
	{
		this = new FastMatrix3(_00, _10, _20, _01, _11, _21, _02, _12, _22);
	}


	public static inline function translation(x: FastFloat, y: FastFloat): Matrix 
	{
		return FastMatrix3.translation(x,y);
	}
}