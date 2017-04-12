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

import cranberry.system.System;
import cranberry.model.ModelNapeBodyCircle;
import cranberry.model.ModelNapeBodyRec;

import nape.geom.Vec2;
import nape.space.Space;


class SystemNape extends System
{
	public static var space :Space;

	public function new() : Void
	{
        super();
		space = new Space(new Vec2(0, 600));
		_modelBodyArra = this.getModel(ModelNapeBodyCircle);
		_modelBodyArra2 = this.getModel(ModelNapeBodyRec);
	}

	override public function updateSystem(dt :Float) : Void
	{
		if(dt > 0)
			space.step(dt);

		for(body in _modelBodyArra) {
			if(!body.hasBeenAdded) {
				body.hasBeenAdded = true;
				body.body.space = space;
			}
		}

		for(body in _modelBodyArra2) {
			if(!body.hasBeenAdded) {
				body.hasBeenAdded = true;
				body.body.space = space;
			}
		}
	}

	private var _modelBodyArra :Array<ModelNapeBodyCircle>;
	private var _modelBodyArra2 :Array<ModelNapeBodyRec>;


}