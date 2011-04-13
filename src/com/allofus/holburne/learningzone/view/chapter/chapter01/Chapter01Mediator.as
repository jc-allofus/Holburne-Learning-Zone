package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.model.Chapter01Model;
	import com.allofus.holburne.learningzone.model.ConfigProxy;
	import com.allofus.holburne.learningzone.model.vo.DidTheRightThingVO;
	import com.allofus.holburne.learningzone.service.XMLFeedService;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterMediator;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	/**
	 * only if i need to do something specific w/ chapter1
	 * @author jc
	 */
	public class Chapter01Mediator extends AbstractChapterMediator
	{
		
		[Inject] public var model:Chapter01Model;
		
		//for voting if the museum did the right thing
		[Inject] public var xmlFeedService:XMLFeedService;
		[Inject] public var configProxy:ConfigProxy;
		
		protected var rightThingVO:DidTheRightThingVO;
		
		override public function onRegister():void
		{
			super.onRegister();
			dispatch(new ChapterMenuEvent(ChapterMenuEvent.ADD_MENU_ITEMS, null, model.menuItems));	
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter01Mediator );
		
	}
}
