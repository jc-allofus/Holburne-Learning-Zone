package com.allofus.holburne.learningzone.view.frame
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.events.ChapterEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Mediator;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class BlankOutMediator extends Mediator
	{
		
		[Inject] public var view:BlankOutVC;
		
		public function BlankOutMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ChapterEvent.SELECTED, handleChapterSelected);
			eventMap.mapListener(eventDispatcher, ChapterMenuEvent.CLOSE_CHAPTER, handleCloseChapter);
		}
		
		protected function handleChapterSelected(event:ChapterEvent):void
		{
			view.show();
		}
		
		protected function handleCloseChapter(event:ChapterMenuEvent):void
		{
			view.hide();
		}
		
		
		private static const logger:ILogger = GetLogger.qualifiedName( BlankOutMediator );
	}
}
