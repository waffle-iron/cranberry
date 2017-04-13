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

import cranberry.model.Model;
import cranberry.util.Disposable;

/** **/
@:allow(cranberry.Cranberry)
class System implements Disposable
{
	public var locked :Bool = false;
	public var running :Bool = true;
	public var owner (default, null) :Cranberry;
	public var next (default, null) :System = null;

	public function new() : Void
	{
	}

	public function updateSystem(dt :Float) : Void
	{
	} 

	public function dispose() : Void
	{
		if(owner != null)
			owner.removeSystem(this);
	}

	private function _updateSystem(dt :Float) : Void
	{
		if(running) {
			updateSystem(dt);
		}
	} 
}