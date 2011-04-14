package com.allofus.holburne.learningzone.view.chapter.chapter02
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
	public class Chapter02 extends AbstractChapterView
	{
		
		public function Chapter02(vo:ChapterVO)
		{
			_chapterVO = vo;
			
			oldSlides = new Vector.<AbstractSlide>();
			
			slides = new Dictionary();
			slides["2_1"] = Slide_2_1VC;
			slides["2_2_1"] = Slide_2_2_1VC;
			slides["2_2_2"] = Slide_2_2_2VC;
			slides["2_2_3"] = Slide_2_2_3VC;
			slides["2_3_1"] = Slide_2_3_1VC;
			slides["2_3_2"] = Slide_2_3_2VC;
			slides["2_3_3"] = Slide_2_3_3VC;
			slides["2_4_1"] = Slide_2_4_1VC;
			slides["2_4_2"] = Slide_2_4_2VC;
			slides["2_4_3"] = Slide_2_4_3VC;
			super();
		}
		
		override public function showFirstSlide() : void
		{
			_currentSelected = makeSlide("2_1");
			addChild(_currentSelected);
			_currentSelected.transitionInFromHomeScreen();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter02 );
	}
}