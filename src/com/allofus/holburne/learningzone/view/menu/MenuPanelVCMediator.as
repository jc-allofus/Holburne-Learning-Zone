package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Mediator;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class MenuPanelVCMediator extends Mediator
	{
		[Inject] public var view:MenuPanelVC;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ChapterMenuEvent.ITEM_SELECTED, mainMenuButtonSelected);
			eventMap.mapListener(view, ChapterMenuEvent.SUBMENU_ITEM_SELECTED, handleSubMenuButtonSelected);
		}
		
		protected function mainMenuButtonSelected(event:ChapterMenuEvent):void
		{
			logger.fatal("i see one of the buttons was clicked." + event.currentTarget);
			if(event.selectedVO == view.triggeredBy)
			{
				logger.fatal("i should open, its my due");
				view.open();
			}
			else
			{
				view.close();
				logger.fatal("close");
			}
		}
		
		
		protected function handleSubMenuButtonSelected(event:ChapterMenuEvent):void
		{
			//redispatch to system
			dispatch(event);
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( MenuPanelVCMediator );
	}
}
