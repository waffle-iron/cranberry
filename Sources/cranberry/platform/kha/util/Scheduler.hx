package cranberry.platform.kha.util;

class Scheduler
{
	public static inline function addTimeTask(task: Void -> Void, start: Float, period: Float = 0, duration: Float = 0): Int
	{
		return kha.Scheduler.addTimeTask(task, start, period, duration);
	}

	public static inline function time(): Float
	{
		return kha.Scheduler.time();
	}
}