package com.allofus.holburne.learningzone.controller.startup
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.controller.FSMConstants;
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.holburne.learningzone.model.ConfigProxy;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;

	import mx.logging.ILogger;

	import flash.events.Event;
	/**
	 * @author jc
	 */
	public class LoadConfigCommand extends Command
	{
		[Inject] public var configProxy:ConfigProxy;
		
		override public function execute():void
		{
			logger.info("loading config.");
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "loading config..."));
			attachListeners();
			configProxy.loadConfigFile(AppGlobals.CONFIG_XML);
		}
		
		protected function attachListeners():void
		{
			eventDispatcher.addEventListener(ConfigProxy.LOAD_COMPLETE, handleComplete);
			eventDispatcher.addEventListener(ConfigProxy.LOAD_FAIL, handleFail);
		}
		
		protected function removeListeners():void
		{
			eventDispatcher.removeEventListener(ConfigProxy.LOAD_COMPLETE, handleComplete);
			eventDispatcher.removeEventListener(ConfigProxy.LOAD_FAIL, handleFail);
		}
		
		protected function handleComplete(event:Event):void
		{
			removeListeners();
			var msg:String = "config loaded...";
			logger.debug(msg);
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, msg));
			//move the state machine along.
			dispatch(new StateEvent(StateEvent.ACTION, FSMConstants.LOADING_CONFIG_SUCCESS));
		}
		
		protected function handleFail(event:Event):void
		{
			removeListeners();
			var msg:String = "config load failed... abort mission matey.";
			logger.debug(msg);
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, msg));
			//crap on the state machine.
			dispatch(new StateEvent(StateEvent.ACTION, FSMConstants.LOADING_CONFIG_FAILED));
		}
		private static const logger:ILogger = GetLogger.qualifiedName( LoadConfigCommand );
	}
}
