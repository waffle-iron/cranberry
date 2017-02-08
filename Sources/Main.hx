package;

import cranberry.System;
import shmup.logic.LogicSpin;
import shmup.logic.LogicController;
import shmup.logic.LogicSystemClam;


class Main {
	public static function main() {
		System.init("BoomHouse", 1024, 768, function(system :System) {
			var clamSys = new LogicSystemClam();
			system
				.addLogicSystem(clamSys);

			system.root
				.addSprite(new cranberry.sprite.SpriteFillRect(kha.Color.Blue, 100, 100)
					.setXY(300, 300)
					.centerAnchor()
					.addLogic(new LogicSpin(20)
						.addLogicSystem(clamSys)))
				.addSprite(new cranberry.sprite.SpriteFillRect(kha.Color.Blue, 100, 100)
					.setXY(100, 300)
					.centerAnchor()
					.addLogic(new LogicController(5)
						.addLogicSystem(clamSys)));
		});
	}
}
