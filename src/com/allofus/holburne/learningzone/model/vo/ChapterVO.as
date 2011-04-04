package com.allofus.holburne.learningzone.model.vo
{
	import flash.display.MovieClip;
	/**
	 * @author jc
	 */
	public class ChapterVO
	{
		public var thumbnail:MovieClip;
		public var id:String;
		
		
		public function ChapterVO(id:String = null, thumbnail:MovieClip = null)
		{
			this.id = id;
			this.thumbnail = thumbnail;
		}
		
		
		public function toString():String
		{
			return "[ChapterVO]: " + id + " thumbnail: " + thumbnail;
		}
	}
}
