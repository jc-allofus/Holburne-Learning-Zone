package com.allofus.holburne.learningzone.model.vo
{
	import flash.display.MovieClip;
	/**
	 * @author jc
	 */
	public class ThumbnailVO
	{
		public var thumbnail:MovieClip;
		public var largeImageClassRef:Class;
		public var caption:String;
		public var additionalText:String;
		
		public function ThumbnailVO(thumbnail:MovieClip, largeImageClassRef:Class, caption:String, additionalText:String = null)
		{
			this.thumbnail = thumbnail;
			this.largeImageClassRef = largeImageClassRef;
			this.caption = caption;
			this.additionalText = additionalText;
		}
	}
}
