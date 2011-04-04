package com.allofus.holburne.learningzone.view.homepage
{
	import com.allofus.holburne.learningzone.events.ChapterEvent;
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Mediator;

	import mx.logging.ILogger;

	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class HomePage1Mediator extends Mediator
	{
		[Inject] public var view:HomepageSingleClickVC;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ChapterMenuEvent.CLOSE_CHAPTER, handleChapterClosed);
			eventMap.mapListener(view, ChapterEvent.SELECTED, handleItemSelected);
			eventMap.mapListener(view, Event.COMPLETE, handleComplete);
		}
		
		protected function handleItemSelected(event:ChapterEvent):void
		{
			logger.info("dispatch to system that" + event.vo + "was selected" );
			dispatch(event);
		}
		
		protected function handleChapterClosed(event:ChapterMenuEvent):void
		{
			view.zoom(0.75);
		}
		
		protected function handleComplete(event:Event):void
		{
			dispatch(new ChapterEvent(ChapterEvent.CLEANUP));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HomePage1Mediator );
	}
}
