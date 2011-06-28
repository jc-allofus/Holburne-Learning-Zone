package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.events.VoteEvent;
	import com.allofus.holburne.learningzone.model.ConfigProxy;
	import com.allofus.holburne.learningzone.model.vo.DidTheRightThingVO;
	import com.allofus.holburne.learningzone.service.XMLFeedService;
	import com.allofus.holburne.learningzone.service.events.XMLFeedEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Mediator;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class Slide_4_4_3VCMediator extends Mediator
	{
		[Inject] public var view:Slide_4_4_3VC;
		
		//for voting if the museum did the right thing
		[Inject] public var xmlFeedService:XMLFeedService;
		[Inject] public var configProxy:ConfigProxy;
		
		protected var rightThingVO:DidTheRightThingVO;
		
		override public function onRegister():void
		{
			eventMap.mapListener(view, VoteEvent.SEND_VOTE, sendVote);
		}
		
		protected function sendVote(event:VoteEvent):void
		{
			logger.info("i will send vote" + event);
			eventMap.mapListener(eventDispatcher, XMLFeedEvent.FETCH_COMPLETED, recievedResults);
			eventMap.mapListener(eventDispatcher, XMLFeedEvent.FETCH_FAILED, failed);
			rightThingVO = event.vo;
			var userVote:String = rightThingVO.userVotedYes ? "yes" : "no";
			var url:String = configProxy.didRightThingURL + "/didrightthing/" + userVote;
			xmlFeedService.retrieveFeed(url);
		}
		
		protected function recievedResults(event:XMLFeedEvent):void
		{
			logger.info("winning! " + rightThingVO);
			eventMap.unmapListener(eventDispatcher, XMLFeedEvent.FETCH_COMPLETED, recievedResults);
			eventMap.unmapListener(eventDispatcher, XMLFeedEvent.FETCH_FAILED, failed);
			
			var xml:XML = event.vo.data;
			rightThingVO.numVotesYes = int(xml.YesVotes);
			rightThingVO.numVotesNo = int(xml.NoVotes);
			
			view.showResults(rightThingVO);
			
		}
		
		protected function failed(event:XMLFeedEvent):void
		{
			logger.warn("fetching results failed");
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_4_4_3VCMediator );
	}
}
