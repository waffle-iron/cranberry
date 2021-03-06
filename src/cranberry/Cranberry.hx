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

package cranberry;

import cranberry.graphics.Framebuffer;
import cranberry.util.Scheduler;
import cranberry.platform.Platform;

import cranberry.sprite.Sprite;
import cranberry.system.System;

class Cranberry
{
	public var root :Sprite;
	public var firstSystem (default, null) :System = null;
	public var running :Bool;

	public static function init(title :String, width :Int, height :Int, cb :Cranberry -> Void) : Void
	{
		if(_hasInit)
			return;
		_hasInit = true;

		Platform.init({title: title, width: width, height: height}, function () {
			cb(new Cranberry());
		});
	}
	
	private function new() : Void
	{
		Platform.notifyOnRender(renderSprites);
		Scheduler.addTimeTask(updateSystems, 0, 1 / 60);
		running = true;

		root = new Sprite();
	}

	public function addSystem(system :System) : Cranberry
	{
		if (system.owner != null)
			system.owner.removeSystem(system);

		var tail = null, p = firstSystem;
		while (p != null) {
			tail = p;
			p = p.next;
		}
		if (tail != null)
			tail.next = system;
		else
			firstSystem = system;

		system.owner = this;
		system.next = null;

		return this;
	}

	public function removeSystem(system :System) : Bool
	{
		var prev :System = null, p = firstSystem;
        while (p != null) {
            var next = p.next;
            if (p == system) {
                if (prev == null) {
                    firstSystem = next;
                } else {
                    prev.owner = this;
                    prev.next = next;
                }

                p.owner = null;
                p.next = null;
                return true;
            }
            prev = p;
            p = next;
        }

		return false;
	}

	private function updateSystems() : Void 
	{
		var currentTime = Scheduler.time();
		_deltaTime = currentTime - _lastTime;
		_lastTime = currentTime;
		if(_deltaTime < 0)
			_deltaTime = 0;

		if(!running)
			return;

		var sys = firstSystem;
		while(sys != null) {
			sys._updateSystem(_deltaTime);
			sys = sys.next;
		}
		updateSprite(root);
	}

	private function updateSprite(sprite :Sprite) : Void
	{
		var model = sprite.firstModel;
		while(model != null) {
			model.updateSprite(sprite);
			model = model.next;
		}
		var p = sprite.firstChild;
        while (p != null) {
            var next = p.next;
            updateSprite(p);
            p = next;
        }
	} 

	private function renderSprites(framebuffer: Framebuffer) : Void 
	{
		framebuffer.g2.begin();
		root._render(framebuffer);
		framebuffer.g2.end();
	}

	private var _deltaTime :Float = 0;
	private var _lastTime :Float = 0;

	private static var _hasInit :Bool = false;
}