package cranberry.platform;

typedef Platform = 
#if empty_platform
	cranberry.platform.empty.EmptyPlatform;
#else
	cranberry.platform.kha.KhaPlatform;
#end
