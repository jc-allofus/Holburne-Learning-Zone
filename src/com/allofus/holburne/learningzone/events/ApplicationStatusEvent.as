package com.allofus.holburne.learningzone.events
{
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class ApplicationStatusEvent extends Event
	{
		public static const CHANGED:String = "ApplicationStatusEvent/Changed";
		
		protected var _message:String;
		
		public function ApplicationStatusEvent(type : String, message:String = "", bubbles : Boolean = false, cancelable : Boolean = false)
		{
			_message = message;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ApplicationStatusEvent(type, message, bubbles, cancelable);
		}

		public function get message() : String
		{
			return _message;
		}

		public function set message(value : String) : void
		{
			_message = value;
		}
		
	}
}
