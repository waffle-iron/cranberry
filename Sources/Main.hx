package;

import cranberry.System;
import shmup.model.ModelSpin;
import shmup.model.ModelController;

import shmup.logic.LogicSpin;
import shmup.logic.LogicController;


class Main {
	public static function main() {
		System.init("BoomHouse", 1024, 768, function(system :System) {
			var controllerSys = new LogicController();
			var spinSys = new LogicSpin();
			system
				.addLogic(controllerSys)
				.addLogic(spinSys);

			system.root
				.addSprite(new cranberry.sprite.SpriteFillRect(kha.Color.Blue, 100, 100)
					.setXY(300, 300)
					.centerAnchor()
					.addModel(new ModelSpin(20, 10)
						.addLogic(spinSys)))
				.addSprite(new cranberry.sprite.SpriteFillRect(kha.Color.Green, 100, 100)
					.setXY(600, 300)
					.centerAnchor()
					.addModel(new ModelSpin(20, 1000)
						.addLogic(spinSys)))
				.addSprite(new cranberry.sprite.SpriteFillRect(kha.Color.Magenta, 40, 40)
					.setXY(600, 500)
					.centerAnchor()
					.addModel(new ModelSpin(20, 10)
						.addLogic(spinSys)))
				.addSprite(new cranberry.sprite.SpriteFillRect(kha.Color.Yellow, 100, 100)
					.setXY(100, 300)
					.centerAnchor()
					.addModel(new ModelController(5)
						.addLogic(controllerSys)));
		});
	}
}
