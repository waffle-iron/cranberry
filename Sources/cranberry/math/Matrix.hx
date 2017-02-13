package cranberry.math;

/** **/
typedef Matrix =
#if empty_platform
	cranberry.platform.empty.math.Matrix;
#else
	cranberry.platform.kha.math.Matrix;
#end