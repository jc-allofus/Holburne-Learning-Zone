package com.allofus.holburne.learningzone.view.background
{
	import com.allofus.holburne.learningzone.guiassets.BackgroundTexture;

	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class BackgroundVC extends Sprite
	{
		protected var bgImage:Bitmap;
		
		public function BackgroundVC()
		{
			bgImage = new Bitmap(new BackgroundTexture(0,0));
			bgImage.smoothing = true;
			cacheAsBitmap = true;
			mouseEnabled = false;
			mouseChildren = false;
			addChild(bgImage);
		}
	}
}
