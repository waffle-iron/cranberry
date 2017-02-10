package community.napeBerry.sprite;

import cranberry.sprite.Sprite;

import kha.Color;
import kha.graphics2.Graphics;
import kha.math.FastMatrix3;
import nape.constraint.Constraint;
import nape.constraint.PivotJoint;
import nape.dynamics.Arbiter;
import nape.dynamics.ArbiterList;
import nape.dynamics.CollisionArbiter;
import nape.dynamics.Contact;
import nape.geom.Vec2;
import nape.geom.Vec2List;
import nape.phys.Body;
import nape.phys.BodyList;
import nape.phys.Compound;
import nape.shape.Edge;
import nape.shape.EdgeList;
import nape.shape.Polygon;
import nape.shape.Shape;
import nape.shape.ShapeType;
import nape.space.Space;

using kha.graphics2.GraphicsExtension;


class SpriteNapeDebug extends Sprite
{

	public var space :Space;

	public function new(space :Space) : Void
	{
		super();
		this.space = space;
	}

	/** **/
	override public function render(framebuffer :kha.Framebuffer) : Void
	{
		if(space == null)
			return;

		for (body in space.bodies) {
			framebuffer.g2.color = kha.Color.Red;
			framebuffer.g2.drawRect(body.bounds.x, body.bounds.y, body.bounds.width, body.bounds.height);
			
			for (shape in body.shapes) {			
				// var shape:Shape = body.shapes.at(j);								
				framebuffer.g2.color = kha.Color.Magenta;
				if (shape.type == ShapeType.POLYGON) {			
					for (edge in shape.castPolygon.edges) {
						framebuffer.g2.drawLine(edge.worldVertex1.x, edge.worldVertex1.y, edge.worldVertex2.x, edge.worldVertex2.y);									
					}					
				} else {					
					framebuffer.g2.drawCircle(body.worldCOM.x, body.worldCOM.y, shape.castCircle.radius);
				}
				
				framebuffer.g2.color = kha.Color.Cyan;
				framebuffer.g2.fillCircle(body.worldCOM.x, body.worldCOM.y, 2);
			}
		}
	}
}