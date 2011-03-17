package com.allofus.holburne.learningzone.events
{
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;

	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class ChapterEvent extends Event
	{
		public static const SELECTED:String = "chapterEvent/Selected";
		public static const CLEANUP:String = "chapterEvent/Cleanup";
		
		public var vo:ChapterVO;
		
		public function ChapterEvent(type : String, vo:ChapterVO = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			this.vo = vo;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ChapterEvent(type, vo, bubbles, cancelable);
		}
		
		override public function toString():String
		{
			return "[ChapterSelectedEvent]: " + vo ;
		}
	}
}
