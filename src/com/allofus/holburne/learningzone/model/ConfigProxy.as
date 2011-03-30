package com.allofus.holburne.learningzone.model
{
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.CSSLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.XMLLoader;

	import org.robotlegs.mvcs.Actor;

	import mx.logging.ILogger;

	import flash.events.Event;
	import flash.text.StyleSheet;

	/**
	 * @author jc
	 */
	public class ConfigProxy extends Actor
	{
		//event strings
		public static const LOAD_COMPLETE:String = "ConfigProxy/LoadSuccess";
		public static const LOAD_FAIL:String = "ConfigProxy/LoadFail";
		
		private static const LOADER_ID:String = "ConfigProxyLoader";
		private static const FILE_ID:String = "configXML";
		private static const ESTIMATED_BYTES:int = 1024;
		
		private static const CSS_ID:String = "locale-css"; //css loader id from <LoaderMax> node in config.xml
		
		protected var loader : LoaderMax;
		
		protected var _updateURL : String;
		
		public function ConfigProxy()
		{
		}

		public function loadConfigFile(url : String) : void
		{
			logger.debug("load config file from url: " + url);
			loader = getLoader();
			loader.append(new XMLLoader(url, {name:FILE_ID, estimatedBytes:ESTIMATED_BYTES}));
			loader.load();
		}
		
		protected function getLoader():LoaderMax
		{
			if(!loader)
			{
				LoaderMax.activate([CSSLoader, SWFLoader]);//allows XMLLoader to recognize ImageLoader nodes inside the XML
				loader = new LoaderMax({name:LOADER_ID, onProgress:handleProgress, onComplete:handleLoadConfigSuccess, onError:handleError});
			}
			return loader;
		}
		
		protected function handleProgress(event:LoaderEvent):void
		{
			//logger.debug("loading progress: " + event);
		}
		
		protected function handleError(event:LoaderEvent):void
		{
			logger.error("could not load config file: " + event.target + " : " + event.text);
			dispatch(new Event(ConfigProxy.LOAD_FAIL));
		}
		
		protected function handleLoadConfigSuccess(event:LoaderEvent):void
		{
			//setup css
			var css:StyleSheet = loader.getContent(CSS_ID) as StyleSheet;
			if(css)FontManager.css = css;
			
			//config xml
			var result:XML = loader.getContent(FILE_ID) as XML;
			//ogger.debug("result: " + result);
			if(result)
			{
				_updateURL = result.UpdateURL.@path;
				logger.info("update url: " + _updateURL);
				success();
			}
			else
			{
				fail();
			}
		}
		
		protected function success():void
		{
			dispatch(new Event(ConfigProxy.LOAD_COMPLETE));
		}
		
		protected function fail():void
		{
			dispatch(new Event(ConfigProxy.LOAD_FAIL));
		}
		
		public function get updateURL() : String
		{
			return _updateURL;
		}

		private static const logger : ILogger = GetLogger.qualifiedName(ConfigProxy);
	}
}
