package com.allofus.holburne.learningzone.events
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class ChapterMenuEvent extends Event
	{
		public static const CLOSE_CHAPTER:String = "chapterMenuEvent/CloseChapter";
		public static const ITEM_SELECTED:String = "chapterMenuEvent/ItemSelected";
		public static const SUBMENU_ITEM_SELECTED:String = "chapterMenuEvent/SubmenuItemSelected";
		public static const ADD_MENU_ITEMS:String = "chapterMenuEvent/AddItems";
		
		public var selectedVO:ButtonVO;
		public var menuItems:Vector.<ButtonVO>;
		
		public function ChapterMenuEvent(type : String, selectedVO:ButtonVO = null, menuItems:Vector.<ButtonVO> = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			this.selectedVO = selectedVO;
			this.menuItems = menuItems;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ChapterMenuEvent(type, selectedVO, menuItems, bubbles, cancelable);
		}
		
		override public function toString():String
		{
			return "[ChapterMenuEvent]: " + type + ", menuItems: " + menuItems + ", bubbles: " + bubbles + ", cancelable: " + cancelable;
		}
	}
}
