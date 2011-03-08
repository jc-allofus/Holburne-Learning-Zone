package com.allofus.holburne.learningzone.controller.startup
{
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class PrepareFSMCommand extends Command
	{
		override public function execute():void
		{
			
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( PrepareFSMCommand );
	}
}
