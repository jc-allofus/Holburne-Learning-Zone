package com.allofus.holburne.learningzone.model.vo
{
	import flash.display.MovieClip;
	/**
	 * @author jc
	 */
	public class ThumbnailClickedVO
	{
		public var thumbnail:MovieClip;
		public var largeImageClassRef:Class;
		public var caption:String;
		
		public function ThumbnailClickedVO(thumbnail:MovieClip, largeImageClassRef:Class, caption:String)
		{
			this.thumbnail = thumbnail;
			this.largeImageClassRef = largeImageClassRef;
			this.caption = caption;
		}
	}
}
