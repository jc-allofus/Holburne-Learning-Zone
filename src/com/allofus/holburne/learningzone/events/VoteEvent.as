package com.allofus.holburne.learningzone.events
{
	import com.allofus.holburne.learningzone.model.vo.DidTheRightThingVO;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class VoteEvent extends Event
	{
		public static const SEND_VOTE:String = "didtherightthingevent/sendVote";
		public static const RECIEVED_RESULTS:String = "didtherightthingevent/recievedResults";
		
		public var vo:DidTheRightThingVO;
		
		public function VoteEvent(type : String, vo:DidTheRightThingVO, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			this.vo = vo;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new VoteEvent(type, vo, bubbles, cancelable);
		}
		
		override public function toString():String
		{
			return "[DidtheRightThingEvent]: " + type + ", " + vo;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( VoteEvent );
	}
}
