package com.allofus.holburne.learningzone.view.chapter
{
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class AbstractChapterView extends Sprite implements IChapter
	{
		protected var _chapterVO:ChapterVO;
		protected var _chapterDO:Vector.<AbstractSlide>;
		
		protected var _currentSelected:AbstractSlide;
		
		public function AbstractChapterView()
		{
			if(!stage)
			{
				addEventListener(Event.ADDED_TO_STAGE, initChapter);
			}
			else
			{
				initChapter();
			}
		}

		protected function initChapter(event : Event = null) : void
		{
			_currentSelected = _chapterDO[0];
			_currentSelected.transitionIn();
		}
		
		

		public function transitionIn() : void
		{
		}

		public function dispose() : void
		{
		}
		
		public function close():void
		{
			//implement in child
		}
		
	}
}
