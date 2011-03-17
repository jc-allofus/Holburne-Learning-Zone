package com.allofus.holburne.learningzone.events
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class ChapterMenuEvent extends Event
	{
		public static const CLOSE_CHAPTER:String = "chapterMenuEvent/CloseChapter";
		public static const ITEM_SELECTED:String = "chapterMenuEvent/ItemSelected";
		public static const ADD_MENU_ITEMS:String = "chapterMenuEvent/AddItems";
		
		public var menuItems:Vector.<MenuButtonVO>;
		
		public function ChapterMenuEvent(type : String, menuItems:Vector.<MenuButtonVO> = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			this.menuItems = menuItems;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ChapterMenuEvent(type, menuItems, bubbles, cancelable);
		}
		
		override public function toString():String
		{
			return "[ChapterMenuEvent]: " + type + ", menuItems: " + menuItems + ", bubbles: " + bubbles + ", cancelable: " + cancelable;
		}
	}
}
