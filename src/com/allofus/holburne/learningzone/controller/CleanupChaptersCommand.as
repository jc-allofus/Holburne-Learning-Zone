package com.allofus.holburne.learningzone.controller
{
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterView;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author jc
	 */
	public class CleanupChaptersCommand extends Command
	{
		override public function execute():void
		{
			var mainView:HolburneLearningZone = contextView as HolburneLearningZone;
			
			var chapter:AbstractChapterView;
			while(mainView.chapterLayer.numChildren > 0)
			{
				chapter = mainView.chapterLayer.getChildAt(0) as AbstractChapterView;
				chapter.dispose();
				mainView.chapterLayer.removeChildAt(0);
			}
		}
	}
}
