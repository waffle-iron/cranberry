package cranberry.util;

/** **/
typedef Scheduler =
#if empty_platform
	cranberry.platform.empty.util.Scheduler;
#else
	cranberry.platform.kha.util.Scheduler;
#end