/*
 * Copyright (c) 2017 Jeremy Meltingtallow
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package cranberry.sprite;

import cranberry.sprite.Sprite;
import cranberry.system.SystemNape;
import nape.shape.ShapeType;
import cranberry.graphics.Framebuffer;
import cranberry.graphics.Color;

class SpriteNapeDebug extends Sprite
{


	public function new() : Void
	{
		super();
	}

	/** **/
	override public function render(framebuffer: Framebuffer) : Void
	{
		if(SystemNape.space == null)
			return;

		for (body in SystemNape.space.bodies) {
			framebuffer.g2.color = Color.White;
			framebuffer.g2.drawRect(body.bounds.x, body.bounds.y, body.bounds.width, body.bounds.height, 2);
			
			for (shape in body.shapes) {			
				framebuffer.g2.color = Color.White;
				if (shape.type == ShapeType.POLYGON) {			
					for (edge in shape.castPolygon.edges) {
						framebuffer.g2.drawLine(edge.worldVertex1.x, edge.worldVertex1.y, edge.worldVertex2.x, edge.worldVertex2.y, 2);									
					}					
				} else {					
					framebuffer.g2.drawCircle(body.worldCOM.x, body.worldCOM.y, shape.castCircle.radius, 2, 0);
				}
				
				framebuffer.g2.color = Color.White;
				framebuffer.g2.fillCircle(body.worldCOM.x, body.worldCOM.y, 10, 0);
			}
		}
	}
}