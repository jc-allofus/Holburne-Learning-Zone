package com.allofus.holburne.learningzone.view.chapter.chapter19
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.model.Chapter19Model;
	import com.allofus.holburne.learningzone.model.vo.DidTheRightThingVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterMediator;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class Chapter19Mediator extends AbstractChapterMediator
	{
		
		[Inject] public var model:Chapter19Model;
		
		
		protected var rightThingVO:DidTheRightThingVO;
		
		override public function onRegister():void
		{
			super.onRegister();
			dispatch(new ChapterMenuEvent(ChapterMenuEvent.ADD_MENU_ITEMS, null, model.menuItems));	
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter19Mediator );
		
	}
}
