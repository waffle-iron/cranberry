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

package cranberry.model;

import cranberry.model.Model;
import nape.phys.Body;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.geom.Vec2;
import nape.phys.BodyType;

using cranberry.math.CMath;

class ModelNapeBody extends Model
{
	public var body :Body;
	public var hasBeenAdded :Bool;
	public var napeShape :NapeShape;
	public var bodyType :BodyType;
	public var isStatic (default, set) :Bool;

	/** **/
	override public function updateSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		sprite.x = body.position.x;
		sprite.y = body.position.y;
		sprite.rotation = body.rotation.toDegrees();
	}

	/** **/
	override public function onAddedToSprite(sprite :cranberry.sprite.Sprite) : Void
	{
		body = new Body();
		var shape = switch napeShape {
			case RECTANGLE(width, height): new Polygon(Polygon.box(width, height));
			case CIRCLE(radius): new Circle(radius);
		};
		shape.material = nape.phys.Material.rubber();
		body.shapes.add(shape);
		body.type = bodyType;
		body.position = new Vec2(sprite.x, sprite.y);
	}

	/** **/
	override public function onRemovedFromSprite(sprite :cranberry.sprite.Sprite) : Void
	{
	}

	private function set_isStatic(isStatic :Bool) : Bool
	{
		this.isStatic = isStatic;
		if(body != null) {
			body.type = isStatic ? BodyType.STATIC : BodyType.DYNAMIC;
		}
		return isStatic;
	}
}

enum NapeShape
{
	RECTANGLE(width :Float, height :Float);
	CIRCLE(radius :Float);
}