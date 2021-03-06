package com.allofus.holburne.learningzone.view.chapter
{
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;

	/**
	 * @author jc
	 */
	public class AbstractChapterView extends Sprite implements IChapter
	{
		protected var _chapterVO:ChapterVO;
		
		protected var _currentSelected:AbstractSlide;
		
		protected var slides:Dictionary;
		
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
		
		public function showFirstSlide() : void
		{
			logger.warn("implement in concrete chapters");
		}
		
		protected function makeSlide(id:String):AbstractSlide
		{
			var abs:AbstractSlide;
			var clazz:Class = slides[id];
			if(clazz)
			{
				abs = new clazz() as AbstractSlide;
				oldSlides.push(abs);
			}
			else
			{
				//logger.warn("did not have entry for slide: " + id + " in our dictionary");
			}
			return abs;
		}

		protected function initChapter(event : Event = null) : void
		{
			//hook for anything else to init once we have a stage reference
		}
		
		public function doAction(actionName:String, paramString:String = null):void
		{
			switch(actionName)
			{
				case ButtonVO.SHOW_SLIDE:
					showSlide(paramString);
					break;
			}
		}
		
		protected function showSlide(slideId:String):void
		{
			//logger.info("showSlide: " + slideId);
			
			//if we already have a slide visible, transition him out 
			if(_currentSelected)
			{
				_currentSelected.addEventListener(Event.COMPLETE, cleanupOldSlides);
				_currentSelected.transitionOut();
				_currentSelected = null;
			}
			
			var slide:AbstractSlide = makeSlide(slideId);
			if(slide)
			{
				_currentSelected = slide;
				addChild(_currentSelected);
				_currentSelected.transitionIn();
			}
			else
			{
				logger.warn("no entry for " + slideId + " in slides dictionary");
			}
		}
		
		public function cleanupOldSlides(event:Event = null):void
		{
			var slide:AbstractSlide;
			
			for (var i : int = 0; i < oldSlides.length; i++) 
			{
				slide = oldSlides[i];
				if(slide == _currentSelected)
					continue;
				slide.removeEventListener(Event.COMPLETE, cleanupOldSlides);
				slide.dispose();
				if(contains(slide))removeChild(slide);
				oldSlides[i] = null;
				oldSlides.splice(i, 1);
				i--;
			}
		}

		public function dispose() : void
		{
			_chapterVO = null;
			_currentSelected = null;
			removeEventListener(Event.ADDED_TO_STAGE, initChapter);
			cleanupOldSlides();
			
			for (var key:String in slides)
			{
				slides[key] = null;
				delete slides[key];
			}
			slides = null;
			
			if(oldSlides)
				oldSlides.length = 0;
			
			oldSlides = null;
		}
		
		public function close():void
		{
			if(_currentSelected)
				_currentSelected.transitionOut();
		}
		
		private static const logger : ILogger = GetLogger.qualifiedName(AbstractChapterView);

	}
}
