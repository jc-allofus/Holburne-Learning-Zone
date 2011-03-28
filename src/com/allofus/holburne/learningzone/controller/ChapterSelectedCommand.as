package com.allofus.holburne.learningzone.controller
{
	import com.allofus.holburne.learningzone.events.ChapterEvent;
	import com.allofus.holburne.learningzone.model.ChapterIDs;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterView;
	import com.allofus.holburne.learningzone.view.chapter.chapter01.Chapter01;
	import com.allofus.holburne.learningzone.view.chapter.chapter02.Chapter02;
	import com.allofus.holburne.learningzone.view.menu.ChapterMenu;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;




	/**
	 * @author jc
	 */
	public class ChapterSelectedCommand extends Command
	{
		[Inject] public var event:ChapterEvent;
		
		override public function execute():void
		{
			logger.info("create " + event.vo.id);
			var mainView:HolburneLearningZone = contextView as HolburneLearningZone;
			var chapter:AbstractChapterView;
			switch(event.vo.id)
			{
				case ChapterIDs.CHAPTER_01:
					chapter = new Chapter01(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_02:
					chapter = new Chapter02(event.vo);
					break;
			}
			
			if(chapter)
			{
				mainView.chapterMenuLayer.addChild(new ChapterMenu());
				mainView.chapterLayer.addChild(chapter as AbstractChapterView);
				chapter.showFirstSlide();
			}
			else
			{
				logger.warn("noting implemented for: " + event.vo.id);
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ChapterSelectedCommand );
	}
}
