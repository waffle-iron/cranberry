package cranberry.assets;

typedef Assets =
#if empty_platform
	cranberry.platform.empty.assets.Assets;
#else
	cranberry.platform.kha.assets.Assets;
#end
