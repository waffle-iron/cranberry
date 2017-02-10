package;

import cranberry.Cranberry;
import cranberry.sprite.SpriteFillRect;
import cranberry.sprite.SpriteSubImage;
import cranberry.model.ModelFlipBook;
import cranberry.system.SystemFlipBook;

import shmup.model.ModelSpin;
import shmup.model.ModelController;

import shmup.system.SystemSpin;
import shmup.system.SystemController;


class Main {
	public static function main() {
		Cranberry.init("BoomHouse", 1024, 768, function(cranberry :Cranberry) {
			kha.Assets.loadEverything(function() {
				startgame(cranberry);
			});
		});
	}

	public static function startgame(cranberry :Cranberry) : Void
	{
		var controllerSys = new SystemController();
		var spinSys = new SystemSpin();
		var flipSys = new SystemFlipBook();
		cranberry
			.addSystem(controllerSys)
			.addSystem(spinSys)
			.addSystem(flipSys);

		cranberry.root
			.addSprite(new SpriteFillRect(kha.Color.Blue, 100, 100)
				.setXY(300, 300)
				.centerAnchor()
				.addModel(new ModelSpin(0, 10)
					.addSystem(spinSys)))
			.addSprite(new SpriteSubImage(kha.Assets.images.flip, 0, 0, 0, 0)
				.setXY(600, 300)
				.addModel(new ModelFlipBook(3, 6, 2)
					.addSystem(flipSys))
				.addModel(new ModelController(2)
					.addSystem(controllerSys)))
			.addSprite(new SpriteFillRect(kha.Color.Yellow, 100, 100)
				.setXY(100, 300)
				.addModel(new ModelController(5)
					.addSystem(controllerSys)));
	}
}
