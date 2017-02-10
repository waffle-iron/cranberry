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