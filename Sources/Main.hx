package;

import cranberry.Cranberry;
import cranberry.sprite.Sprite;
import cranberry.sprite.SpriteFillRect;
import cranberry.sprite.SpriteFillCircle;
import cranberry.sprite.SpriteSubImage;
import cranberry.model.ModelFlipBook;
import cranberry.system.SystemFlipBook;

import shmup.model.ModelZIndex;

import shmup.system.SystemRotation;
import shmup.system.SystemZIndex;

import community.napeBerry.sprite.SpriteNapeDebug;
import community.napeBerry.model.ModelNapeBody;
import community.napeBerry.system.SystemNape;
import community.napeBerry.system.SystemNapeController;
import nape.phys.BodyType;

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
			.addSprite(buildWall(1024/2, 0, 1024, 10, napeSys))
			.addSprite(buildWall(1024/2, 768, 1024, 10, napeSys))
			.addSprite(buildWall(0, 768/2, 10, 768, napeSys))
			.addSprite(buildWall(1024, 768/2, 10, 768, napeSys))
			.addModel(new ModelZIndex()
				.addSystem(zIndexSys))
			// .addSprite(new SpriteNapeDebug(napeSys.space))
			.addSprite(new SpriteFillRect(kha.Color.Blue, 100, 100)
				.setXY(300, 300)
				.centerAnchor()
				.addModel(new ModelNapeBody(RECTANGLE(100, 100), BodyType.DYNAMIC)
					.addSystem(napeSys)))
			.addSprite(subSpr = new SpriteSubImage(kha.Assets.images.flip, 0, 0, 0, 0)
				.setXY(600, 300)
				.addModel(new ModelFlipBook(12, 6, 2)
					.addSystem(flipSys))
				.addModel(new ModelNapeBody(RECTANGLE(66, 101), BodyType.DYNAMIC)
					.addSystem(controllerSys)
					.addSystem(napeSys)))
			.addSprite(new SpriteFillCircle(kha.Color.Yellow, 50)
				.setXY(100, 300)
				.centerAnchor()
				.addModel(new ModelNapeBody(CIRCLE(50), BodyType.DYNAMIC)
					.addSystem(controllerSys)
					.addSystem(napeSys)));

		subSpr.centerAnchor();
	}

	private static function buildWall(x :Float, y :Float, width :Float, height :Float, napeSys :community.napeBerry.system.SystemNape) : Sprite
	{

		return new SpriteFillRect(kha.Color.Black, width, height)
			.setXY(x, y)
			.centerAnchor()
			.addModel(new ModelNapeBody(RECTANGLE(width, height), BodyType.STATIC)
				.addSystem(napeSys));
	}
}
