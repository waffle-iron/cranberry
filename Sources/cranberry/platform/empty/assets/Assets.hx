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