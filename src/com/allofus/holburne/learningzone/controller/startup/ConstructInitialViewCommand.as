package com.allofus.holburne.learningzone.controller.startup
{
	import com.allofus.holburne.learningzone.view.frame.FrameVC;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.controller.FSMConstants;
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.holburne.learningzone.view.background.BackgroundVC;
	import com.allofus.holburne.learningzone.view.homepage.HomepageVC;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;

	import mx.logging.ILogger;

	import flash.geom.Rectangle;

	/**
	 * @author jc
	 */
	public class ConstructInitialViewCommand extends Command
	{
		override public function execute():void
		{
			logger.info("construct initial view");
			dispatch(new ApplicationStatusEvent(ApplicationStatusEvent.CHANGED, "constructing views..."));
			
			var mainView:HolburneLearningZone = contextView as HolburneLearningZone;
			
			var sRect:Rectangle = new Rectangle(0,0,AppGlobals.APP_WIDTH, AppGlobals.APP_HEIGHT);
			mainView.scrollRect = sRect;
			
			mainView.backgroundLayer.addChild(new BackgroundVC());
			mainView.homepageLayer.addChild(new HomepageVC());
			mainView.frameBorderLayer.addChild(new FrameVC());
			
			mainView.backgroundLayer.mouseEnabled = mainView.frameBorderLayer.mouseEnabled = false;
			mainView.backgroundLayer.mouseChildren = mainView.frameBorderLayer.mouseChildren = false;
						
			dispatch(new StateEvent(StateEvent.ACTION, FSMConstants.CONSTRUCTING_VIEW_COMPLETE));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ConstructInitialViewCommand );
	}
}
