package com.allofus.holburne.learningzone.view.frame
{
	import com.allofus.holburne.learningzone.guiassets.Frame;
	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class FrameVC extends Sprite
	{
		protected var frameImg:Bitmap;
		
		public function FrameVC()
		{
			frameImg = new Bitmap(new Frame(1920,1080));
			frameImg.smoothing  =true;
			cacheAsBitmap  = true;
			addChild(frameImg);
		}
	}
}
