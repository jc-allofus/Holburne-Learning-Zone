package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterView;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class Chapter01 extends AbstractChapterView
	{
		
		protected var chapterSlideClasses:Array = [Slide_1_1];
		
		
		public function Chapter01(vo:ChapterVO)
		{
			_chapterVO = vo;
			_chapterDO = new Vector.<AbstractSlide>();
			//make all slides
			var clazz:Class;
			var instance:AbstractSlide;
			for (var i : int = 0; i < chapterSlideClasses.length; i++) 
			{
				clazz = chapterSlideClasses[i] as Class;
				instance = new clazz();
				_chapterDO.push(instance);
				addChild(instance);
			}
			super();
		}
		
		override public function close():void
		{
			_currentSelected.transitionOut();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter01 );
	}
}
