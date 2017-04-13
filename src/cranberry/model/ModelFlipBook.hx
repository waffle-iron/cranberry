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

import cranberry.sprite.Sprite;
import cranberry.sprite.SpriteSubImage;

class ModelFlipBook extends Model
{
	public var sx :Float = 0;
	public var sy :Float = 0;
	public var frame :Int = 0;
	public var elapsed :Float = 0;
	public var speed :Float;
	public var columns :Int;
	public var rows :Int;
	public var frameWidth :Float;
	public var frameHeight :Float;

	public function new(speed :Float, columns :Int, rows :Int) : Void
	{
		super();
		this.speed = speed;
		this.columns = columns;
		this.rows = rows;
	}

	/** **/
	override public function onAddedToSprite(sprite :Sprite) : Void
	{
		// var spr = cast(sprite, SpriteSubImage);
		// frameWidth = spr.image.width/columns;
		// frameHeight = spr.image.height/rows;
		// spr.setDimensions(frameWidth, frameHeight);
	}

	/** **/
	override public function updateSprite(sprite :Sprite) : Void
	{
		// cast(sprite, SpriteSubImage).setPos(sx,sy);
	}
}