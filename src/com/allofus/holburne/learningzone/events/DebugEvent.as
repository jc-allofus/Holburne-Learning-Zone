package com.allofus.holburne.learningzone.events
{
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class DebugEvent extends Event
	{
		public static const TOGGLE:String = "debugEvent/Toggle";
		
		public function DebugEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
