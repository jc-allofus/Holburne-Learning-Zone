package com.allofus.holburne.learningzone.controller.startup
{
	import com.allofus.holburne.learningzone.controller.FSMConstants;
	import org.robotlegs.utilities.statemachine.StateEvent;
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class PrepareModelCommand extends Command
	{
		override public function execute():void
		{
			//this is really just placeholder for now in case i need proper model later; 
			//the majority of this app is view and its gonna ba a hackathon!
			logger.info("prepare models");
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "prepare models.."));
			dispatch(new StateEvent(StateEvent.ACTION, FSMConstants.PREPARE_MODELS_SUCCESS));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( PrepareModelCommand );
	}
}
