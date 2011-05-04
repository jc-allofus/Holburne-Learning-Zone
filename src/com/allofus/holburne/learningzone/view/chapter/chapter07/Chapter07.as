package com.allofus.holburne.learningzone.view.chapter.chapter07
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
	public class Chapter07 extends AbstractChapterView
	{
		
		public function Chapter07(vo:ChapterVO)
		{
			_chapterVO = vo;
			
			oldSlides = new Vector.<AbstractSlide>();
			
			slides = new Dictionary();
			slides["7_1"] = Slide_7_1VC;
			slides["7_2_1"] = Slide_7_2_1VC;
			slides["7_2_2"] = Slide_7_2_2VC;
			slides["7_3_1"] = Slide_7_3_1VC;
			slides["7_3_2"] = Slide_7_3_2VC;
			super();
		}
		
		override public function showFirstSlide() : void
		{
			_currentSelected = makeSlide("7_1");
			addChild(_currentSelected);
			_currentSelected.transitionInFromHomeScreen();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter07 );
	}
}
