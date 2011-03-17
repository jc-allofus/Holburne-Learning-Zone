package com.allofus.holburne.learningzone.view.frame
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.greensock.TweenMax;
	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class BlankOutVC extends Sprite
	{
		public function BlankOutVC()
		{
			visible = false;
			graphics.beginFill(0xFFFFFF, 0.8);
			graphics.drawRect(0, 0, AppGlobals.APP_WIDTH, AppGlobals.APP_HEIGHT);
		}
		
		public function show():void
		{
			alpha = 0;
			TweenMax.to(this, AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE,autoAlpha:1});
		}
		
		public function hide():void
		{
			TweenMax.to(this, AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE,autoAlpha:0});
		}
	}
}
