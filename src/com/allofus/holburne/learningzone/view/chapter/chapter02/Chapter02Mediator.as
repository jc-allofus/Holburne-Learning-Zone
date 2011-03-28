package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.model.Chapter02Model;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterMediator;

	/**
	 * @author jc
	 */
	public class Chapter02Mediator extends AbstractChapterMediator
	{
		[Inject] public var model:Chapter02Model;
		
		override public function onRegister():void
		{
			super.onRegister();
			dispatch(new ChapterMenuEvent(ChapterMenuEvent.ADD_MENU_ITEMS, null, model.menuItems));	
		}
	}
}
