package cranberry.platform.empty.graphics;

import cranberry.platform.empty.math.Matrix;

class Graphics
{
	public var color :Color;
	public var opacity :Float;
	public var transformation: Matrix;

	public function begin(clear: Bool = true, clearColor: Color = null): Void {}
	public function end(): Void {}
	public function popTransformation(): Matrix {return null;}
	public function pushTransformation(transformation: Matrix): Void {}

	public function drawLine (x1:Float, y1:Float, x2:Float, y2:Float, ?strength:Float) :Void {}
	public function fillRect(x: Float, y: Float, width: Float, height: Float): Void {}
	public function drawRect (x:Float, y:Float, width:Float, height:Float, ?strength:Float): Void {}
	public function fillCircle(cx: Float, cy: Float, radius: Float, segments: Int = 0): Void {}
	public function drawCircle(cx: Float, cy: Float, radius: Float, strength: Float = 1, segments: Int = 0): Void {}
	public function drawSubImage(img: Image, x: Float, y: Float, sx: Float, sy: Float, sw: Float, sh: Float): Void {}
	public function drawImage(img: Image, x: Float, y: Float): Void {}
}