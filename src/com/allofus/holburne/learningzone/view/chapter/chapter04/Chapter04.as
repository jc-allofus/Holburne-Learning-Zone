package com.allofus.holburne.learningzone.view.chapter.chapter04
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
	public class Chapter04 extends AbstractChapterView
	{
		
		public function Chapter04(vo:ChapterVO)
		{
			_chapterVO = vo;
			
			oldSlides = new Vector.<AbstractSlide>();
			
			slides = new Dictionary();
			slides["4_1"] = Slide_4_1VC;
			slides["4_2_1"] = Slide_4_2_1VC;
			slides["4_3_1"] = Slide_4_3_1VC;
			slides["4_3_2"] = Slide_4_3_2VC;
			slides["4_3_3"] = Slide_4_3_3VC;
			
			slides["4_4_3"] = Slide_4_4_3VC;
			super();
		}
		
		override public function showFirstSlide() : void
		{
			_currentSelected = makeSlide("4_1");
			addChild(_currentSelected);
			_currentSelected.transitionInFromHomeScreen();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter04 );
	}
}
