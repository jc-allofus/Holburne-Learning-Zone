package com.allofus.holburne.learningzone.controller.startup
{
	import com.allofus.holburne.learningzone.controller.FSMConstants;
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.holburne.learningzone.events.InternetConnectionEvent;
	import com.allofus.holburne.learningzone.model.ConfigProxy;
	import com.allofus.holburne.learningzone.model.InternetConnectionProxy;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class DetectInternetConnectionCommand extends Command
	{
		[Inject] public var inetConnectionProxy:InternetConnectionProxy;
		
		[Inject] public var configProxy:ConfigProxy;
		
		
		public override function execute():void
		{
			logger.info(inetConnectionProxy + " will be detecting internet connection to URL from" + configProxy);
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "checking network..."));
			eventDispatcher.addEventListener(InternetConnectionEvent.STATUS, handleStatusObtained);
			inetConnectionProxy.detectConnectionTo(configProxy.updateURL);
		}

		protected function handleStatusObtained(event : InternetConnectionEvent) : void
		{
			eventDispatcher.removeEventListener(InternetConnectionEvent.STATUS, handleStatusObtained);
			if(event.isConnected)
			{
				dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "found update site."));
				dispatch(new StateEvent(StateEvent.ACTION, FSMConstants.INITIAL_CONNECTION_ON));
			}
			else
			{
				dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "no update site."));
				dispatch(new StateEvent(StateEvent.ACTION, FSMConstants.INITIAL_CONNECTION_OFF));
			}
		}
		private static const logger:ILogger = GetLogger.qualifiedName( DetectInternetConnectionCommand );
	}
}
