package com.allofus.holburne.learningzone.view.background
{
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author jc
	 */
	public class BackgroundVCMediator extends Mediator
	{
		[Inject] public var view:BackgroundVC;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, KeyboardEvent.KEY_DOWN, handleKeyDown);	
		}
		
		protected function handleKeyDown(event:KeyboardEvent):void
		{
			switch (event.keyCode)
			{
				case Keyboard.NUMBER_0:
					view.switchBackgroundTexture(0);
					break;
				
				case Keyboard.NUMBER_1:
					view.switchBackgroundTexture(1);
					break;
					
				case Keyboard.NUMBER_2:
					view.switchBackgroundTexture(2);
					break;
					
				case Keyboard.NUMBER_3:
					view.switchBackgroundTexture(3);
					break;
					
				case Keyboard.NUMBER_4:
					view.switchBackgroundTexture(4);
					break;
					
				case Keyboard.NUMBER_5:
					view.switchBackgroundTexture(5);
					break;
					
				case Keyboard.NUMBER_6:
					view.switchBackgroundTexture(6);
					break;
					
				case Keyboard.NUMBER_7:
					view.switchBackgroundTexture(7);
					break;
					
				case Keyboard.NUMBER_8:
					view.switchBackgroundTexture(8);
					break;
			}
		}
	}
}
