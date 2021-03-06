package com.allofus.holburne.learningzone.view.chapter.chapter10
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
	public class Chapter10 extends AbstractChapterView
	{
		
		public function Chapter10(vo:ChapterVO)
		{
			_chapterVO = vo;
			
			oldSlides = new Vector.<AbstractSlide>();
			
			slides = new Dictionary();
			slides["10_1"] = Slide_10_1VC;
			slides["10_2_1"] = Slide_10_2_1VC;
			slides["10_3_1"] = Slide_10_3_1VC;
			slides["10_3_2"] = Slide_10_3_2VC;
			slides["10_4_1"] = Slide_10_4_1VC;
			slides["10_4_2"] = Slide_10_4_2VC;
			slides["10_4_3"] = Slide_10_4_3VC;
			slides["10_4_4"] = Slide_10_4_4VC;
			super();
		}
		
		override public function showFirstSlide() : void
		{
			_currentSelected = makeSlide("10_1");
			addChild(_currentSelected);
			_currentSelected.transitionInFromHomeScreen();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter10 );
	}
}
