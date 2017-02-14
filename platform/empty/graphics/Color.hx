package cranberry.platform.empty.graphics;

abstract Color(Int) from Int from UInt to Int to UInt {
	public static inline var White: Color = 0xffffffff;
	public static inline var Black: Color = 0xff000000;

	public static function rgba(r: Int, g: Int, b: Int, a: Int = 255): Color {
		return new Color((a << 24) | (r << 16) | (g << 8) | b);
	}

	private function new(value: Int) {
		this = value;
	}
}