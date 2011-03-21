package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.model.Chapter1Model;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterMediator;

	/**
	 * only if i need to do something specific w/ chapter1
	 * @author jc
	 */
	public class Chapter01Mediator extends AbstractChapterMediator
	{
		
		[Inject] public var model:Chapter1Model;
		
		override public function onRegister():void
		{
			super.onRegister();
			dispatch(new ChapterMenuEvent(ChapterMenuEvent.ADD_MENU_ITEMS, null, model.menuItems));	
		}
		
	}
}
