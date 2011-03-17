package com.allofus.holburne.learningzone.view.text
{
	import flash.text.TextFormatAlign;
	import flash.text.TextFormat;
	/**
	 * @author jc
	 */
	public class TextFormats
	{
		public static function get titleFormat():TextFormat
		{
			var f:TextFormat = new TextFormat();
			f.size = 24;
			f.color = 0xb00404;
			f.align = TextFormatAlign.LEFT;
			return f;
		}
	}
}
