package com.allofus.holburne.learningzone.service
{
	import com.allofus.holburne.learningzone.model.IXMLProxy;
	/**
	 * @author jc
	 */
	public class XMLFeedVO
	{
		public var url:String;
		public var targetModel:IXMLProxy;
		public var data:XML;
		
		public function toString():String
		{
			return "[XMLFeedVO]: " 
			+ "  url: " + url
			+ ", targetModel: " + targetModel
			+ ", data: " + data.toString();
		}
	}
}
