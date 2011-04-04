package com.allofus.holburne.learningzone.events
{
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class VideoSeekEvent extends Event
	{
		public static const SEEK_DRAG_STARTED : String = "videoSeekEvent/seekDragStarted";
		public static const SEEK_TO_PERCENT : String = "videoSeekEvent/seekToPercent";
		public static const SEEK_DRAG_COMPLETE : String = "videoSeekEvent/seekDragComplete";
		
		public var percent:Number;
		
		public function VideoSeekEvent(type : String, percent:Number, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			this.percent = percent;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new VideoSeekEvent(type, percent, bubbles, cancelable);
		}
	}
}
