package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
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
			eventMap.mapListener(eventDispatcher, ChapterMenuEvent.ADD_MENU_ITEMS, handleAddItems);
			eventMap.mapListener(view, ChapterMenuEvent.ITEM_SELECTED, relayToSystem);
			eventMap.mapListener(view, ChapterMenuEvent.SUBMENU_ITEM_SELECTED, relayToSystem);
			eventMap.mapListener(view, Event.CLOSE, handleCloseClicked);
		}
		
		protected function relayToSystem(event:ChapterMenuEvent):void
		{
			dispatch(event);
		}
		
		protected function handleAddItems(event:ChapterMenuEvent):void
		{
			var itemVOs:Vector.<ButtonVO> = event.menuItems;
			if(itemVOs && itemVOs.length > 1)
			{
				view.addItems(itemVOs);
			}
		}
		
		protected function handleCloseClicked(e:Event):void
		{
			dispatch(new ChapterMenuEvent(ChapterMenuEvent.CLOSE_CHAPTER));
		}
		private static const logger:ILogger = GetLogger.qualifiedName( ChapterMenuMediator );
	}
}
