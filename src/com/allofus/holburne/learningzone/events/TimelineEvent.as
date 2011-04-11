package com.allofus.holburne.learningzone.events
{
	import com.allofus.holburne.learningzone.view.component.button.TimelineButton;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class TimelineEvent extends Event
	{
		public static const SELECTED:String = "timelineEvent/buttonSelected";
		
		public var button:TimelineButton;
		
		public function TimelineEvent(type : String, btn:TimelineButton, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			this.button = btn;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new TimelineEvent(type, button, bubbles, cancelable);
		}
	}
}
