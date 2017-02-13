package cranberry.input;

typedef Key =
#if empty_platform
	cranberry.platform.empty.input.Key;
#else
	kha.Key;
#end
