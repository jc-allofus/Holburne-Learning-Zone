package com.allofus.holburne.learningzone.view.debug
{
	import net.hires.debug.Stats;

	import com.allofus.holburne.learningzone.AppGlobals;

	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class DebugVC extends Sprite
	{
		protected var leftContentFrame:Shape;
		protected var rightContentFrame:Shape;
		
		public function DebugVC()
		{
			visible = false;
			
			addChild(new Stats());
			
			//draw rect for "main content frame"
			//frame for where zoomed images should end up for visual reference, this should be turned off later
			leftContentFrame = new Shape();
			leftContentFrame.graphics.beginFill(0x00cc00, 0.2);
			leftContentFrame.graphics.drawRect(0, 0, AppGlobals.LEFT_FRAME_WIDTH, AppGlobals.LEFT_FRAME_HEIGHT);
			leftContentFrame.x = AppGlobals.LEFT_FRAME_X;
			leftContentFrame.y = AppGlobals.LEFT_FRAME_Y;
			addChild(leftContentFrame);
			
			rightContentFrame = new Shape();
			rightContentFrame.graphics.beginFill(0x0000cc, 0.2);
			rightContentFrame.graphics.drawRect(0, 0, AppGlobals.RIGHT_FRAME_WIDTH, AppGlobals.RIGHT_FRAME_HEIGHT);
			rightContentFrame.x = AppGlobals.RIGHT_FAME_X;
			rightContentFrame.y = AppGlobals.RIGHT_FRAME_Y;
			addChild(rightContentFrame);
		}
	}
}
