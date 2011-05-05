package com.allofus.holburne.learningzone.view.chapter.chapter08
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
	public class Chapter08 extends AbstractChapterView
	{
		
		public function Chapter08(vo:ChapterVO)
		{
			_chapterVO = vo;
			
			oldSlides = new Vector.<AbstractSlide>();
			
			slides = new Dictionary();
			slides["8_1"] = Slide_8_1VC;
			slides["8_2_1"] = Slide_8_2_1VC;
			slides["8_2_2"] = Slide_8_2_2VC;
			slides["8_3_1"] = Slide_8_3_1VC;
			slides["8_3_2"] = Slide_8_3_2VC;
			slides["8_3_3"] = Slide_8_3_3VC;
			slides["8_3_4"] = Slide_8_3_4VC;
			super();
		}
		
		override public function showFirstSlide() : void
		{
			_currentSelected = makeSlide("8_1");
			addChild(_currentSelected);
			_currentSelected.transitionInFromHomeScreen();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter08 );
	}
}
