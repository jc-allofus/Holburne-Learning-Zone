package com.allofus.holburne.learningzone.controller.startup
{
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class DoBootstrapFailCommand extends Command
	{
		override public function execute():void
		{
			logger.fatal("problem during bootstrap; check logs.");	
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "error during startup; please check logs"));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( DoBootstrapFailCommand );
	}
}
