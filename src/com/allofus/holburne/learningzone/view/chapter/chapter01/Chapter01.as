package com.allofus.holburne.learningzone.view.chapter.chapter01
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
	public class Chapter01 extends AbstractChapterView
	{
		
		public function Chapter01(vo:ChapterVO)
		{
			_chapterVO = vo;
			
			oldSlides = new Vector.<AbstractSlide>();
			
			slides = new Dictionary();
			slides["1_1"] = Slide_1_1VC;
			
			slides["1_2_1"] = Slide_1_2_1VC;
			slides["1_2_2"] = Slide_1_2_2VC;
			slides["1_2_3"] = Slide_1_2_3VC;
			slides["1_2_4"] = Slide_1_2_4VC;
			
			slides["1_3"] = Slide_1_3_1VC;
			
			slides["1_4_1"] = Slide_1_4_1VC;
			slides["1_4_2"] = Slide_1_4_2VC;
			slides["1_4_3"] = Slide_1_4_3VC;
			super();
		}
		
		override public function showFirstSlide() : void
		{
			_currentSelected = makeSlide("1_1");
			addChild(_currentSelected);
			_currentSelected.transitionInFromHomeScreen();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter01 );
	}
}
