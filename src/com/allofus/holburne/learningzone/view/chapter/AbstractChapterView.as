package com.allofus.holburne.learningzone.view.chapter
{
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class AbstractChapterView extends Sprite implements IChapter
	{
		protected var _chapterVO:ChapterVO;
		protected var _chapterDO:Vector.<AbstractSlide>;
		
		protected var _currentSelected:AbstractSlide;
		
		protected var oldSlides:Vector.<AbstractSlide>;
		
		public function AbstractChapterView()
		{
			if(!stage)
			{
				addEventListener(Event.ADDED_TO_STAGE, initChapter);
			}
			else
			{
				initChapter();
			}
		}

		protected function initChapter(event : Event = null) : void
		{
//			_currentSelected = _chapterDO[0];
//			_currentSelected.transitionIn();
		}
		
		public function doAction(actionName:String, paramString:String = null):void
		{
			logger.info("HAVENT IMPLEMENTED doAction: " + actionName + " params: " + paramString);
		}

		public function transitionIn() : void
		{
		}
		
		public function cleanupOldSlides(event:Event = null):void
		{
			var slide:AbstractSlide;
			for (var i : int = 0; i < oldSlides.length; i++) 
			{
				slide = oldSlides[i];
				logger.info("cleaning up: " + slide);
				slide.removeEventListener(Event.COMPLETE, cleanupOldSlides);
				slide.dispose();
				if(contains(slide))removeChild(slide);	
			}
			oldSlides.length = 0;
		}

		public function dispose() : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initChapter);
		}
		
		public function close():void
		{
			//implement in child
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( AbstractChapterView );
		
	}
}
