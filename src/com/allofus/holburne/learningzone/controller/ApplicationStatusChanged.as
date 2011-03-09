package com.allofus.holburne.learningzone.controller
{
	import com.allofus.holburne.learningzone.model.ApplicationStatusModel;
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class ApplicationStatusChanged extends Command
	{
		[Inject] public var event:ApplicationStatusEvent;
		
		[Inject] public var model:ApplicationStatusModel;
		
		override public function execute():void
		{
			model.status = event.message;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ApplicationStatusChanged );
	}
}
