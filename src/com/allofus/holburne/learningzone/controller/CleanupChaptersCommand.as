package com.allofus.holburne.learningzone.controller
{
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterView;
	import com.allofus.holburne.learningzone.view.menu.ChapterMenu;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class CleanupChaptersCommand extends Command
	{
		override public function execute():void
		{
			logger.info("cleanup/dispose chapters.");
			var mainView:HolburneLearningZone = contextView as HolburneLearningZone;
			
			var chapter:AbstractChapterView;
			while(mainView.chapterLayer.numChildren > 0)
			{
				chapter = mainView.chapterLayer.getChildAt(0) as AbstractChapterView;
				chapter.dispose();
				mainView.chapterLayer.removeChildAt(0);
			}
			
			var menu:ChapterMenu;
			while(mainView.chapterMenuLayer.numChildren > 0)
			{
				menu = mainView.chapterMenuLayer.getChildAt(0) as ChapterMenu;
				menu.dispose();
				mainView.chapterMenuLayer.removeChildAt(0);
				
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( CleanupChaptersCommand );
	}
}
