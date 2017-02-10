package;

import cranberry.Cranberry;
import cranberry.sprite.Sprite;
import cranberry.sprite.SpriteFillRect;
import cranberry.sprite.SpriteFillCircle;
import cranberry.sprite.SpriteSubImage;
import cranberry.model.ModelFlipBook;
import cranberry.system.SystemFlipBook;

import shmup.model.ModelRotation;
import shmup.model.ModelController;
import shmup.model.ModelZIndex;

import shmup.system.SystemRotation;
import shmup.system.SystemZIndex;

import community.napeBerry.model.ModelNapeBody;
import community.napeBerry.system.SystemNape;
import community.napeBerry.system.SystemNapeController;

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
		var controllerSys = new SystemNapeController();
		var spinSys = new SystemRotation();
		var flipSys = new SystemFlipBook();
		var zIndexSys = new SystemZIndex();
		var napeSys = new SystemNape();

		cranberry
			.addSystem(controllerSys)
			.addSystem(spinSys)
			.addSystem(flipSys)
			.addSystem(zIndexSys)
			.addSystem(napeSys);

		var subSpr :Sprite;

		cranberry.root
			.addModel(new ModelZIndex()
				.addSystem(zIndexSys))
			.addSprite(new SpriteFillRect(kha.Color.Blue, 100, 100)
				.setXY(300, 300)
				.centerAnchor()
				.addModel(new ModelRotation(0, 10)
					.addSystem(spinSys))
				.addModel(new ModelNapeBody()
					.addSystem(napeSys)))
			.addSprite(subSpr = new SpriteSubImage(kha.Assets.images.flip, 0, 0, 0, 0)
				.setXY(600, 300)
				.addModel(new ModelRotation(0, -100)
					.addSystem(spinSys))
				.addModel(new ModelFlipBook(12, 6, 2)
					.addSystem(flipSys))
				.addModel(new ModelController(2)
					.addSystem(controllerSys))
				.addModel(new ModelNapeBody()
					.addSystem(napeSys)))
			.addSprite(new SpriteFillCircle(kha.Color.Yellow, 50)
				.setXY(100, 300)
				.centerAnchor()
				.addModel(new ModelNapeBody()
					.addSystem(controllerSys)
					.addSystem(napeSys)));

		subSpr.centerAnchor();
	}
}
