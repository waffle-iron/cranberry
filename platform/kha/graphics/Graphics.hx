package cranberry.platform.kha.graphics;

import kha.graphics2.GraphicsExtension;

@:forward(color, opacity, transformation, begin, end, popTransformation, pushTransformation, fillRect, drawSubImage, drawImage, drawRect, drawLine)
abstract Graphics(kha.graphics2.Graphics) to kha.graphics2.Graphics from kha.graphics2.Graphics
{
	public function fillCircle(cx: Float, cy: Float, radius: Float, segments: Int = 0): Void
	{
		GraphicsExtension.fillCircle(this, cx, cy, radius, segments);
	}

	public function drawCircle(cx: Float, cy: Float, radius: Float, strength: Float = 1, segments: Int = 0): Void
	{
		GraphicsExtension.drawCircle(this, cx, cy, radius, strength, segments);
	}
}