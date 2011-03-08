package
{
	import com.allofus.holburne.learningzone.controller.startup.PrepareFSMCommand;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import mx.logging.ILogger;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author jc
	 */
	public class HolburneLearningZoneContext extends Context
	{
		public function HolburneLearningZoneContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			//model
			
			//view
			
			//controller
			commandMap.mapEvent(ContextEvent.STARTUP, PrepareFSMCommand);
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HolburneLearningZoneContext );
	}
}
