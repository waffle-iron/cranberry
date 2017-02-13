package cranberry.graphics;

typedef Graphics =
#if empty_platform
	cranberry.platform.empty.graphics.Graphics;
#else
	cranberry.platform.kha.graphics.Graphics;
#end