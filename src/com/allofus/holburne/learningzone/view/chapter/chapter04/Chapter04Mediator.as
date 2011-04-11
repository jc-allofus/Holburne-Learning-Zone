package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.model.Chapter04Model;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterMediator;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	/**
	 * only if i need to do something specific w/ chapter1
	 * @author jc
	 */
	public class Chapter04Mediator extends AbstractChapterMediator
	{
		
		[Inject] public var model:Chapter04Model;
		
		override public function onRegister():void
		{
			super.onRegister();
			dispatch(new ChapterMenuEvent(ChapterMenuEvent.ADD_MENU_ITEMS, null, model.menuItems));	
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter04Mediator );
		
	}
}
