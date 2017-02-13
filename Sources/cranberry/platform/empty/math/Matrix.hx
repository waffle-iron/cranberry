package cranberry.platform.empty.math;

class Matrix
{
	public function new(_00: Float, _10: Float, _20: Float, _01: Float, _11: Float, _21: Float, _02: Float, _12: Float, _22: Float) {}
	public function multmat(m: Matrix): Matrix {return null;}


	public static inline function translation(x: Float, y: Float): Matrix {return null;}
}