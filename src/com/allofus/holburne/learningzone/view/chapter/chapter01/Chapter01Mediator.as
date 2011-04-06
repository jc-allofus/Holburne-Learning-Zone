package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.events.VoteEvent;
	import com.allofus.holburne.learningzone.model.Chapter01Model;
	import com.allofus.holburne.learningzone.model.ConfigProxy;
	import com.allofus.holburne.learningzone.model.vo.DidTheRightThingVO;
	import com.allofus.holburne.learningzone.service.XMLFeedService;
	import com.allofus.holburne.learningzone.service.events.XMLFeedEvent;
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
			eventMap.mapListener(eventDispatcher, VoteEvent.SEND_VOTE, sendVote);
			super.onRegister();
			dispatch(new ChapterMenuEvent(ChapterMenuEvent.ADD_MENU_ITEMS, null, model.menuItems));	
		}
		
		protected function sendVote(event:VoteEvent):void
		{
			eventMap.mapListener(eventDispatcher, XMLFeedEvent.FETCH_COMPLETED, recievedResults);
			eventMap.mapListener(eventDispatcher, XMLFeedEvent.FETCH_FAILED, recievedResults);
			rightThingVO = event.vo;
			var userVote:String = rightThingVO.userVotedYes ? "yes" : "no";
			var url:String = configProxy.apiBaseURL + "/didrightthing/" + userVote;
			xmlFeedService.retrieveFeed(url);
		}
		
		protected function recievedResults(event:XMLFeedEvent):void
		{
			eventMap.unmapListener(eventDispatcher, XMLFeedEvent.FETCH_COMPLETED, recievedResults);
			eventMap.unmapListener(eventDispatcher, XMLFeedEvent.FETCH_FAILED, recievedResults);
			
			var xml:XML = event.vo.data;
			rightThingVO.numVotesYes = int(xml.YesVotes);
			rightThingVO.numVotesNo = int(xml.NoVotes);
			
			logger.info("winning! " + rightThingVO);
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Chapter01Mediator );
		
	}
}
