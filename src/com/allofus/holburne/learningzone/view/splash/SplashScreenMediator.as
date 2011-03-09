package com.allofus.holburne.learningzone.view.splash
{
	import com.allofus.holburne.learningzone.model.ApplicationStatusModel;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class SplashScreenMediator extends Mediator
	{
		[Inject] public var view:SplashScreen;
		
		[Inject] public var model:ApplicationStatusModel;
		
		override public function onRegister():void
		{
			showSplash();
			eventMap.mapListener(eventDispatcher, ApplicationStatusModel.CHANGED, updateStatus);
			eventMap.mapListener(eventDispatcher, SplashScreen.CLOSE, close);
		}
		
		protected function showSplash():void
		{
			updateStatus();
			view.show();
		}
		
		protected function close(event:Event):void
		{
			view.dispose();
			var mainView:HolburneLearningZone = contextView as HolburneLearningZone;
			mainView.clearLayer(mainView.splashScreenLayer);
		}
		
		protected function updateStatus(event:Event = null):void
		{
			view.status = model.status;
		}
	}
}
