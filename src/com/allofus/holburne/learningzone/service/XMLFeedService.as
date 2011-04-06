package com.allofus.holburne.learningzone.service
{
	import com.greensock.loading.data.XMLLoaderVars;
	import com.allofus.holburne.learningzone.model.IXMLProxy;
	import com.allofus.holburne.learningzone.service.events.XMLFeedEvent;
	import com.allofus.shared.logging.GetLogger;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.LoaderStatus;
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.data.LoaderMaxVars;

	import org.robotlegs.mvcs.Actor;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 * this will fetch xml from a remote server and push the result into a model(if specified)
	 */
	public class XMLFeedService extends Actor
	{
		
		protected var _loader:XMLLoader;
		protected var _vo:XMLFeedVO;
		
		public function XMLFeedService()
		{
		}
		
		public function retrieveFeed(url:String, targetModel:IXMLProxy = null):void
		{
			_vo = new XMLFeedVO();
			_vo.url = url;
			_vo.targetModel = targetModel;
			loadResult();
		}
		
		protected function loadResult():void
		{
			
			var lv:XMLLoaderVars = new XMLLoaderVars();
			lv.estimatedBytes = 350;
			lv.name = _vo.url;
			lv.onComplete = handleItemComplete;
			lv.onIOError = handleIOError;
			lv.onError = handleLoadError;
			lv.onFail = handleLoadFail;
			
			//lv.autoDispose = true;
			logger.info("do it." + _vo.url);
			_loader = new XMLLoader(_vo.url, lv);
			_loader.load();
		}
		
		
		protected function handleItemComplete(event:LoaderEvent):void
		{
			logger.debug("item complete: " + event);
			var xml:XML;
			xml = _loader.getContent(_vo.url) as XML;
			if(xml)
			{
				_vo.data = xml;
				_loader.dispose(true);
				
				if(_vo.targetModel)
					_vo.targetModel.data = _vo.data;
					
				dispatch(new XMLFeedEvent(XMLFeedEvent.FETCH_COMPLETED, _vo));
			}
		}
		
		protected function handleQueueComplete(event:LoaderEvent):void
		{
			logger.info("the whole queue is complete.");
		}
		
		protected function handleLoadError(event:LoaderEvent):void
		{
			logger.error("handleXMLFeedLoadError: " + event.target + " : " + event.text + " event: " + event);
			dispatch(new XMLFeedEvent(XMLFeedEvent.FETCH_FAILED));
		}
		
		protected function handleLoadFail(event:LoaderEvent):void
		{
			logger.error("handleXMLFeedLoadFail: " + event.target + " : " + event.text + " event: " + event);
			dispatch(new XMLFeedEvent(XMLFeedEvent.FETCH_FAILED));
		}
		
		protected function handleIOError(event:LoaderEvent):void
		{
			logger.error("handleXMLFeedIOError: " + event.target + " : " + event.text + " event: " + event);
			dispatch(new XMLFeedEvent(XMLFeedEvent.FETCH_FAILED));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( XMLFeedService );
	}
}
