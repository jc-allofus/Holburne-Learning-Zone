package com.allofus.holburne.learningzone.view.background
{
	import com.allofus.holburne.learningzone.guiassets.BackgroundTexture08;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

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
			bgImage = new Bitmap(new BackgroundTexture08(0,0));
			bgImage.smoothing = true;
			cacheAsBitmap = true;
			mouseEnabled = false;
			mouseChildren = false;
			addChild(bgImage);
		}
		
		public function switchBackgroundTexture(id:int):void
		{
			if(bgImage)
			{
				bgImage.bitmapData.dispose();
				
				switch(id)
				{
					case 0:
//						bgImage.bitmapData = new BackgroundTexture(0,0);
						break;
					
					case 1:
//						bgImage.bitmapData = new BackgroundTexture01(0,0);
						break;
						
					case 2:
//						bgImage.bitmapData = new BackgroundTexture02(0,0);
						break;
						
					case 3:
//						bgImage.bitmapData = new BackgroundTexture03(0,0);
						break;
						
					case 4:
//						bgImage.bitmapData = new BackgroundTexture04(0,0);
						break;
						
					case 5:
//						bgImage.bitmapData = new BackgroundTexture05(0,0);
						break;
						
					case 6:
//						bgImage.bitmapData = new BackgroundTexture06(0,0);
						break;
						
					case 7:
//						bgImage.bitmapData = new BackgroundTexture07(0,0);
						break;
						
					case 8:
						bgImage.bitmapData = new BackgroundTexture08(0,0);
						break;
				}
			}
			else
			{
				logger.warn("no bitmap object, so I can't change my background texture");
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( BackgroundVC );
	}
}
