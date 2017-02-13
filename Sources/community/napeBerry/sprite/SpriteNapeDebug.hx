package community.napeBerry.sprite;

import cranberry.sprite.Sprite;

import nape.shape.ShapeType;
import nape.space.Space;

import cranberry.graphics.Framebuffer;
import cranberry.graphics.Color;

class SpriteNapeDebug extends Sprite
{

	public var space :Space;

	public function new(space :Space) : Void
	{
		super();
		this.space = space;
	}

	/** **/
	override public function render(framebuffer: Framebuffer) : Void
	{
		for (body in space.bodies) {
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