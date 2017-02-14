package cranberry.platform.kha.assets;

abstract Assets(kha.Assets)
{
	public static function loadEverything(callback: Void -> Void): Void {
		kha.Assets.loadEverything(callback);
	}

}