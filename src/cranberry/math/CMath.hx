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

package cranberry.math;

/** **/
class CMath
{
	/** **/
	public static inline function clampInt(val :Int, min :Int, max :Int) : Int
	{
		return Std.int(clampFloat(val, min, max));
	}

	/** **/
	public static inline function clampFloat(val :Float, min :Float, max :Float) : Float
	{
		return Math.min(Math.max(val, min), max);
	}

	/** **/
	public static inline function toDegrees(radians :Float) : Float
	{
		return radians * (180/Math.PI);
	}	

	/** **/
	public static inline function toRadians(degrees :Float) : Float
	{
		return degrees * (Math.PI/180);
	}	
}