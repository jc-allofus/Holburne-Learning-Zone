package com.allofus.holburne.learningzone.view.chapter
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Mediator;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class AbstractChapterMediator extends Mediator
	{
		[Inject] public var view:AbstractChapterView;
		
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ChapterMenuEvent.CLOSE_CHAPTER, closeChapter);
		}
		
		protected function closeChapter(event:ChapterMenuEvent):void
		{
			view.close();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( AbstractChapterMediator );
	}
}
