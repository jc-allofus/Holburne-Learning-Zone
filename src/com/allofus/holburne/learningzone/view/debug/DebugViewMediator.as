package com.allofus.holburne.learningzone.view.debug
{
	import com.allofus.holburne.learningzone.events.DebugEvent;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author jc
	 */
	public class DebugViewMediator extends Mediator
	{
		[Inject] public var view:DebugVC;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, DebugEvent.TOGGLE, handleToggle);
		}
		
		protected function handleToggle(event:DebugEvent):void
		{
			view.toggleHideShow();
		}
	}
}
