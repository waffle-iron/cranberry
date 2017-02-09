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
}