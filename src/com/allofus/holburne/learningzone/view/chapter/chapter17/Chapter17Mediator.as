package com.allofus.holburne.learningzone.view.chapter.chapter17
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.model.Chapter17Model;
	import com.allofus.holburne.learningzone.model.vo.DidTheRightThingVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterMediator;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class Chapter17Mediator extends AbstractChapterMediator
	{
		
		[Inject] public var model:Chapter17Model;
		
		
		protected var rightThingVO:DidTheRightThingVO;
		
		override public function onRegister():void
		{
			super.onRegister();
			dispatch(new ChapterMenuEvent(ChapterMenuEvent.ADD_MENU_ITEMS, null, model.menuItems));	
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter17Mediator );
		
	}
}
