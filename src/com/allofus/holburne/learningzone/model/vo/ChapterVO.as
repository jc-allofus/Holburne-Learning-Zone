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
		
		public function toString():String
		{
			return "[ChapterVO]: " + id + " thumbnail: " + thumbnail;
		}
	}
}
