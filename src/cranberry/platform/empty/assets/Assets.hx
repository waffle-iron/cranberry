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

package cranberry.platform.empty.assets;

class Assets
{
	public static var images: ImageList = new ImageList();
	public static var sounds: SoundList = new SoundList();
	public static var blobs: BlobList = new BlobList();
	public static var fonts: FontList = new FontList();
	public static var videos: VideoList = new VideoList();

	public static function loadEverything(callback: Void -> Void): Void {}
}

private class ImageList {
	public function new() {
		
	}
}

private class SoundList {
	public function new() {
		
	}
}

private class BlobList {
	public function new() {
		
	}
}

private class FontList {
	public function new() {
		
	}
}

private class VideoList {
	public function new() {
		
	}
}