package com.allofus.holburne.learningzone.controller
{
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class ToggleMouseVisibleCommand extends Command
	{
		override public function execute():void
		{
			logger.info("toggle mouse visibility.");
			var mainView:HolburneLearningZone = contextView as HolburneLearningZone;
			mainView.mouseVisible = !mainView.mouseVisible; 
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ToggleMouseVisibleCommand );
	}
}
