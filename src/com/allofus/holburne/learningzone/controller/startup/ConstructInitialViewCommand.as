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
	public class ConstructInitialViewCommand extends Command
	{
		override public function execute():void
		{
			logger.info("construct initial view");
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "constructing views..."));
			
			//var bg:
			
			
			
			
			
			dispatch(new StateEvent(StateEvent.ACTION, FSMConstants.CONSTRUCTING_VIEW_COMPLETE));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ConstructInitialViewCommand );
	}
}
