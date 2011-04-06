package com.allofus.holburne.learningzone.view.menu
{
	import flash.display.Shape;

	/**
	 * @author jc
	 */
	public class SubMenuSeparator extends Shape
	{
		public static const COLOR:uint = 0x80816d;
		public static const RADIUS:int = 5;
		
		public function SubMenuSeparator()
		{
			graphics.beginFill(COLOR);
			graphics.drawCircle(0, 0, RADIUS);
		}
	}
}
