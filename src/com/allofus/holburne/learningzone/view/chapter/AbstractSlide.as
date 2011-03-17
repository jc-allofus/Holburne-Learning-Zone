package com.allofus.holburne.learningzone.view.chapter
{
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class AbstractSlide extends Sprite
	{
		public function AbstractSlide()
		{
		}
		
		public function transitionIn():void
		{
			
		}
		
		public function transitionOut():void
		{
			
		}
		
		protected function dispatchOut():void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function dispose():void
		{
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
		}
	}
}
