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
			super();
		}
		
		override public function showFirstSlide() : void
		{
//			_currentSelected = makeSlide("x_1");
//			addChild(_currentSelected);
//			_currentSelected.transitionInFromHomeScreen();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter10 );
	}
}
