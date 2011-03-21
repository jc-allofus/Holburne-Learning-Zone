package com.allofus.holburne.learningzone
{
	import com.allofus.holburne.learningzone.events.DebugEvent;
	import com.allofus.holburne.learningzone.events.UtilEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Mediator;

	import mx.logging.ILogger;

	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	/**
	 * @author jc
	 */
	public class ApplicationMediator extends Mediator
	{
		[Inject] public var view:HolburneLearningZone;
		
		override public function onRegister():void
		{
			eventMap.mapListener(view.stage, KeyboardEvent.KEY_DOWN, handleKeyDown);	
		}
		
		private function handleKeyDown(event : KeyboardEvent) : void
		{
			switch (event.keyCode)
			{
				case Keyboard.D:
					dispatch(new DebugEvent(DebugEvent.TOGGLE));
					break;
				
				case Keyboard.F:
					toggleFullscreen();
					break;
					
				case Keyboard.C:
					dispatch(new Event(Event.CLEAR));
					
				case Keyboard.S:
					//take screenshot
					dispatch(new UtilEvent(UtilEvent.TAKE_SCREENSHOT));
					
				default:
					break;
			}
		}
		
		protected function toggleFullscreen():void
		{
			view.stage.displayState = (view.stage.displayState == StageDisplayState.NORMAL) ? StageDisplayState.FULL_SCREEN_INTERACTIVE : StageDisplayState.NORMAL; 
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ApplicationMediator );
	}
}
