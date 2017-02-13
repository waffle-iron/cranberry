package cranberry.graphics;

typedef Framebuffer =
#if empty_platform
	cranberry.platform.empty.graphics.Framebuffer;
#else
	cranberry.platform.kha.graphics.Framebuffer;
#end