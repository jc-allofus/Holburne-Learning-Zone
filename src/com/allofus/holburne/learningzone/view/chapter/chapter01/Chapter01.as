package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterView;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.events.Event;
	import flash.utils.Dictionary;

	/**
	 * @author jc
	 */
	public class Chapter01 extends AbstractChapterView
	{
		
		protected var chapterSlides:Dictionary;
		
		public function Chapter01(vo:ChapterVO)
		{
			_chapterVO = vo;
			
			oldSlides = new Vector.<AbstractSlide>();
			
			chapterSlides = new Dictionary();
			chapterSlides["1_1"] = Slide_1_1;
			super();
		}
		
		override public function doAction(actionName:String, paramString:String = null):void
		{
			switch(actionName)
			{
				case MenuButtonVO.SHOW_SLIDE:
					showSlide(paramString);
					break;
			}
		}
		
		protected function showSlide(slideId:String):void
		{
			//if we already have a slide visible, transition him out & add him to old slides array
			if(_currentSelected)
			{
				_currentSelected.addEventListener(Event.COMPLETE, cleanupOldSlides);
				_currentSelected.transitionOut();
				oldSlides.push(_currentSelected);
				_currentSelected = null;
			}
			
			var clazz:Class = chapterSlides[slideId];
			if(clazz)
			{
				var inst:AbstractSlide = new clazz();
				_currentSelected = inst;
				addChild(_currentSelected);
				_currentSelected.transitionIn();
			}
		}
		
		override public function close():void
		{
			_currentSelected.transitionOut();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter01 );
	}
}
