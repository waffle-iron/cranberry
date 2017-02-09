package;

import cranberry.System;
import cranberry.sprite.SpriteFillRect;
import cranberry.sprite.SpriteSubImage;
import cranberry.model.ModelFlipBook;
import cranberry.logic.LogicFlipBook;

import shmup.model.ModelSpin;
import shmup.model.ModelController;

import shmup.logic.LogicSpin;
import shmup.logic.LogicController;


class Main {
	public static function main() {
		System.init("BoomHouse", 1024, 768, function(system :System) {
			kha.Assets.loadEverything(function() {
				startgame(system);
			});
		});
	}

	public static function startgame(system :System) : Void
	{
		var controllerSys = new LogicController();
		var spinSys = new LogicSpin();
		var flipSys = new LogicFlipBook();
		system
			.addLogic(controllerSys)
			.addLogic(spinSys)
			.addLogic(flipSys);

		system.root
			.addSprite(new SpriteFillRect(kha.Color.Blue, 100, 100)
				.setXY(300, 300)
				.centerAnchor()
				.addModel(new ModelSpin(20, 10)
					.addLogic(spinSys)))
			.addSprite(new SpriteSubImage(kha.Assets.images.flip, 0, 0, 400/6, 203/2)
				.setXY(600, 300)
				.centerAnchor()
				.addModel(new ModelSpin(20, 10)
					.addLogic(spinSys))
				.addModel(new ModelFlipBook(6)
					.addLogic(flipSys)))
			.addSprite(new SpriteFillRect(kha.Color.Yellow, 100, 100)
				.setXY(100, 300)
				.addModel(new ModelController(5)
					.addLogic(controllerSys)));
	}
}
