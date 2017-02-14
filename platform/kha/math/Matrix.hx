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