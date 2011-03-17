package com.allofus.holburne.learningzone.controller
{
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class CloseChapterCommand extends Command
	{
		override public function execute():void
		{
			logger.info("close chapter.");	
		}
		private static const logger:ILogger = GetLogger.qualifiedName( CloseChapterCommand );
	}
}
