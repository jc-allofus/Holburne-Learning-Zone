package com.allofus.holburne.learningzone.model.vo
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	/**
	 * @author jc
	 */
	public class ThumbnailClickedVO
	{
		public var thumbnail:MovieClip;
		public var largeImageClassRef:Class;
		
		public function ThumbnailClickedVO(thumbnail:MovieClip, largeImageClassRef:Class)
		{
			this.thumbnail = thumbnail;
			this.largeImageClassRef = largeImageClassRef;
		}
	}
}
