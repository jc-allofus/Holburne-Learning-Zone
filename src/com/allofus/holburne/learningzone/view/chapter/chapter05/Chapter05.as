package com.allofus.holburne.learningzone.view.chapter.chapter05
{
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterView;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.utils.Dictionary;

	/**
	 * @author jc
	 */
	public class Chapter05 extends AbstractChapterView
	{
		
		public function Chapter05(vo:ChapterVO)
		{
			_chapterVO = vo;
			
			oldSlides = new Vector.<AbstractSlide>();
			
			slides = new Dictionary();
			slides["5_1"] = Slide_5_1VC;
			super();
		}
		
		override public function showFirstSlide() : void
		{
			_currentSelected = makeSlide("5_1");
			addChild(_currentSelected);
			_currentSelected.transitionInFromHomeScreen();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter05 );
	}
}
