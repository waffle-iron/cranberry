package cranberry.platform.kha.graphics;

abstract Framebuffer(kha.Framebuffer) to kha.Framebuffer from kha.Framebuffer
{
	public var g2(get, never): Graphics;

	private function get_g2(): Graphics{
		return this.g2;
	}
}