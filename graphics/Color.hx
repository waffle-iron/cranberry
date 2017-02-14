package cranberry.graphics;

typedef Color =
#if empty_platform
	cranberry.platform.empty.graphics.Color;
#else
	cranberry.platform.kha.graphics.Color;
#end
