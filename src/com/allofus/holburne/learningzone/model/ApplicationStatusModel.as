package com.allofus.holburne.learningzone.model
{
	import flash.events.Event;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author jc
	 */
	public class ApplicationStatusModel extends Actor
	{
		public static const CHANGED:String = "ApplicationStatusModel/Changed";
		
		protected var _status:String = "Initializing...";
		
		public function ApplicationStatusModel()
		{
		}

		public function get status() : String
		{
			return _status;
		}

		public function set status(status : String) : void
		{
			_status = status;
			dispatch(new Event(CHANGED));
		}
	}
}
