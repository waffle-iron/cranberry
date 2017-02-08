package shmup.logic;

import cranberry.logic.LogicSystem;

import shmup.logic.LogicSpin;
import shmup.logic.LogicController;

class LogicSystemClam extends LogicSystem
{
	/** **/
	public function new() : Void
	{
		super();
	}

	override public function onAdded() : Void
	{
		logicSpinArra = this.getLogic(LogicSpin);
		logicContollerArra = this.getLogic(LogicController);
	}

	override public function onUpdate(dt :Float) : Void
	{
		var fItem = logicContollerArra[0];
		for(spin in logicSpinArra) {
			if(fItem != null) {
				spin.speed = fItem.initialX;
			}
			spin.speed += dt*20;
		}
	} 

	private var logicSpinArra :Array<LogicSpin>;
	private var logicContollerArra :Array<LogicController>;
}