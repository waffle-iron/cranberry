package cranberry.graphics;

typedef Image =
#if empty_platform
	cranberry.platform.empty.graphics.Image;
#else
	cranberry.platform.kha.graphics.Image;
#end