package cranberry.input;

typedef Keyboard =
#if empty_platform
	cranberry.platform.empty.input.Keyboard;
#else
	cranberry.platform.kha.input.Keyboard;
#end
