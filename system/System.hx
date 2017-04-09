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

/** **/
class System
{
	public function updateSystem(dt :Float) : Void
	{
	} 

	@:final public function getModel<M>(classType :Class<M>) :Array<M>
	{
		var className :String = Type.getClassName(classType);
		var modelArra = _modelMap.get(className);
		if(modelArra == null) {
			modelArra = new Array<Any>();
			_modelMap.set(className, modelArra);
		}

		return cast modelArra;
	}

	@:allow(cranberry.model.Model)
	@:final private function addModel(model :Model) : System
	{
		var modelArra = getModel(Type.getClass(model));
		modelArra.push(model);
		return this;
	}

	@:allow(cranberry.model.Model)
	@:final private function removeModel(model :Model) : System
	{
		var modelArra = getModel(Type.getClass(model));
		modelArra.remove(model);
		return this;
	}

	private var _modelMap :Map<String, Array<Any>> = new Map<String, Array<Any>>();
}