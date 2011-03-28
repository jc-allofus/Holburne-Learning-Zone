package com.allofus.holburne.learningzone.events
{
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class UtilEvent extends Event
	{
		public static const TAKE_SCREENSHOT : String = "utilEvent/TakeScreenshot";
		public static const TOGGLE_MOUSE_VISIBLE : String = "utilEvent/toggleMouseVisible";
		
		public function UtilEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}
