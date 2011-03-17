package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Mediator;

	import mx.logging.ILogger;

	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class ChapterMenuMediator extends Mediator
	{
		[Inject] public var view:ChapterMenu;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ChapterMenuEvent.ITEM_SELECTED, handleItemSelected);
			eventMap.mapListener(view, Event.CLOSE, handleCloseClicked);
		}
		
		protected function handleItemSelected(event:ChapterMenuEvent):void
		{
			logger.fatal("AIIIIIIIIII I SEEEEEEEE IT!!!!");
		}
		
		protected function handleCloseClicked(e:Event):void
		{
			dispatch(new ChapterMenuEvent(ChapterMenuEvent.CLOSE_CHAPTER));
		}
		private static const logger:ILogger = GetLogger.qualifiedName( ChapterMenuMediator );
	}
}
