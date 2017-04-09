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
import cranberry.system.System;
import cranberry.util.Disposable;


/** **/
@:allow(cranberry.sprite.Sprite)
class Model implements Disposable
{
	public var owner (default, null) :Sprite = null;
	public var next (default, null) :Model = null;

	/** **/
	public function new() : Void
	{
	}

	/** **/
	public function updateSprite(sprite :Sprite) : Void
	{
	}

	/** **/
	public function onAddedToSprite(sprite :Sprite) : Void
	{
	}

	/** **/
	public function onRemovedFromSprite(sprite :Sprite) : Void
	{
	}

	/** **/
	@:final public function addSystem(system :System) : Model
	{
		system.addModel(this);
		return this;
	}

	/** **/
	@:final public function removeSystem(system :System) : Model
	{
		system.removeModel(this);
		return this;
	}

	public function dispose ()
    {
        if (owner != null) {
            owner.removeModel(this);
        }
    }
}