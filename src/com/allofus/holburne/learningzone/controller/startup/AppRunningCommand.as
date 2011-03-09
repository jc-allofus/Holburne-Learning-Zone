package com.allofus.holburne.learningzone.controller.startup
{
	import flash.display.StageDisplayState;
	import com.allofus.holburne.learningzone.view.splash.SplashScreen;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;

	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class AppRunningCommand extends Command
	{
		override public function execute():void
		{
			logger.info("app running...");
			
			//take down splash screen
			dispatch(new Event(SplashScreen.CLOSE));
			
			//go fullscreen
			contextView.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
						
		}
		private static const logger:ILogger = GetLogger.qualifiedName( AppRunningCommand );
	}
}
