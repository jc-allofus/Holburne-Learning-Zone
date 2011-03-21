package com.allofus.holburne.learningzone.view.chapter
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Mediator;

	import mx.logging.ILogger;

	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class AbstractChapterMediator extends Mediator
	{
		[Inject] public var view:AbstractChapterView;
		
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ChapterMenuEvent.ITEM_SELECTED, handleItemSelected);
			eventMap.mapListener(eventDispatcher, ChapterMenuEvent.SUBMENU_ITEM_SELECTED, handleItemSelected);
			eventMap.mapListener(eventDispatcher, ChapterMenuEvent.CLOSE_CHAPTER, closeChapter);
			eventMap.mapListener(eventDispatcher, Event.CLEAR, cleanupOldSlides);
		}
		
		protected function handleItemSelected(event:ChapterMenuEvent):void
		{
			if(event.selectedVO && event.selectedVO.action)
			{
				view.doAction(event.selectedVO.action, event.selectedVO.actionParams);
			}
		}
		
		protected function closeChapter(event:ChapterMenuEvent):void
		{
			view.close();
		}
		
		protected function cleanupOldSlides(event:Event):void
		{
			view.cleanupOldSlides();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( AbstractChapterMediator );
	}
}
