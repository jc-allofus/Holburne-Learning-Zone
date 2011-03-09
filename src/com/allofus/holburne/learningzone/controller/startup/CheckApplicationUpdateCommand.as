package com.allofus.holburne.learningzone.controller.startup
{
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.holburne.learningzone.controller.FSMConstants;
	import org.robotlegs.utilities.statemachine.StateEvent;
	import com.allofus.holburne.learningzone.model.ConfigProxy;
	import com.allofus.holburne.learningzone.service.ApplicationUpdaterService;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;

	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class CheckApplicationUpdateCommand extends Command
	{
		[Inject] public var configProxy:ConfigProxy;
		
		[Inject] public var updateService:ApplicationUpdaterService;
		
		override public function execute():void
		{
			logger.info("check for air update : " + configProxy.updateURL);
			addListeners();
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "checking for updates..."));
			updateService.checkForUpdate(configProxy.updateURL);
		}
		
		protected function handleComplete(event:Event):void
		{
			removeListeners();
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "most current update installed."));
			dispatch(new StateEvent(StateEvent.ACTION, FSMConstants.CHECKING_APP_UPDATE_SUCCESS));
		}
		
		protected function handleFail(event:Event):void
		{
			removeListeners();
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "errored out somewhere in update check."));
			dispatch(new StateEvent(StateEvent.ACTION, FSMConstants.CHECKING_APP_UPDATE_FAIL));
		}
		
		protected function addListeners():void
		{
			eventDispatcher.addEventListener(ApplicationUpdaterService.UPDATE_COMPLETE, handleComplete);
			eventDispatcher.addEventListener(ApplicationUpdaterService.UPDATE_FAIL, handleFail);
		}
		
		protected function removeListeners():void
		{
			eventDispatcher.removeEventListener(ApplicationUpdaterService.UPDATE_COMPLETE, handleComplete);
			eventDispatcher.removeEventListener(ApplicationUpdaterService.UPDATE_FAIL, handleFail);
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( CheckApplicationUpdateCommand );
		
		
	}
}
