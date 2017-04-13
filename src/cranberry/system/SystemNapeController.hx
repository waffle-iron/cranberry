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

package cranberry.system;

import cranberry.model.ModelNapeBodyCircle;
import cranberry.input.Keyboard;
import cranberry.input.Key;
import cranberry.model.ModelManager;

/** **/
class SystemNapeController extends cranberry.system.System
{
	/** **/
	public function new() : Void
	{
        super();
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	/** **/
	override public function updateSystem(dt :Float) : Void
	{
		for(model in ModelManager._.getModel(ModelNapeBodyCircle)) {
			if(_isLeft)
				model.body.velocity.x -= dt * VELO;
			if(_isRight)
				model.body.velocity.x += dt * VELO;
			if(_isDown)
				model.body.velocity.y += dt * VELO;
			if(_isUp)
				model.body.velocity.y -= dt * VELO;

			model = cast model.next;
		}
	}

	/** **/
	private function onKeyDown(key :Key, value :String) : Void
	{
		switch(key) {
			case Key.UP:
				_isDown = false;
				_isUp = true;
			case Key.DOWN:
				_isDown = true;
				_isUp = false;
			case Key.LEFT:
				_isLeft = true;
				_isRight = false;
			case Key.RIGHT:
				_isLeft = false;
				_isRight = true;
			case _:
		}
	}
	
	/** **/
	private function onKeyUp(key :Key, value :String) : Void
	{
		switch(key) {
			case Key.UP:
				_isUp = false;
			case Key.DOWN:
				_isDown = false;
			case Key.LEFT:
				_isLeft = false;
			case Key.RIGHT:
				_isRight = false;
			case _:
		}
	}

	private var _isLeft :Bool = false;
	private var _isRight :Bool = false;
	private var _isUp :Bool = false;
	private var _isDown :Bool = false;

	private static inline var VELO = 80000;
}