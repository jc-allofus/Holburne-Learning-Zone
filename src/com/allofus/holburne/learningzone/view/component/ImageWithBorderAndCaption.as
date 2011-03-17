package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.greensock.easing.Expo;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class ImageWithBorderAndCaption extends Sprite
	{
		public static const BORDER_SIZE:int = 20;
		public static const BORDER_COLOR:uint = 0xFFFFFF;
		
		protected var img:Bitmap;
		protected var border:Shape;
		protected var _captionLabel:TextField;
		
		protected var captionTimeline:TimelineMax;
		
		public function ImageWithBorderAndCaption(img:Bitmap, captionText:String)
		{
			//visible = false;
			
			this.img  = img;
			this.img.x = this.img.y = BORDER_SIZE;
			
			var totalWidth:int = Math.round(img.width + (BORDER_SIZE * 2));
			var totalHeight:int = Math.round(img.height + (BORDER_SIZE * 2));
			
			border = new Shape();
			border.graphics.beginFill(BORDER_COLOR);
			border.graphics.drawRect(0, 0, totalWidth, totalHeight);

			_captionLabel = FontManager.createTextField(captionText, img.width, 0, true);
			_captionLabel.x = BORDER_SIZE;
			_captionLabel.y = this.img.y + this.img.height + BORDER_SIZE;
			_captionLabel.visible = false;
			_captionLabel.alpha = 0;
			
			addChild(border);
			addChild(img);
		}
		
		public function transitionIn(delay:Number = 0):void
		{
			TweenMax.to(this, AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE, autoAlpha:1, glowFilter:AppGlobals.GLOW_ON, delay:delay});
		}
		
		public function transitionOut():void
		{
		}
		
		
		public function showCaption():void
		{
			logger.fatal("my height: " + height);
			addChild(_captionLabel);
			var th:Number = _captionLabel.y + _captionLabel.height + BORDER_SIZE;
			if(captionTimeline) captionTimeline.clear();
			captionTimeline = new TimelineMax({onComplete:showCaptionComplete});
			captionTimeline.insert(new TweenMax(border, 0.35, {height:th, ease:Expo.easeInOut}));
			captionTimeline.append(new TweenMax(_captionLabel, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE}));
		}
		
		protected function showCaptionComplete():void
		{
			//logger.fatal("showCaptionComplete()");
		}
		
		public function hideCaption():void
		{
			var th:Number = Math.round(img.height + (BORDER_SIZE * 2));;
			if(captionTimeline) captionTimeline.clear();
			captionTimeline = new TimelineMax({onComplete:hideCaptionComplete});
			captionTimeline.insert(new TweenMax(_captionLabel, 0.35, {autoAlpha:0, ease:AppGlobals.FADE_EASE}));
			captionTimeline.insert(new TweenMax(border, 0.35, {height:th, ease:Expo.easeInOut}));
		}
		
		protected function hideCaptionComplete():void
		{
			logger.fatal("my height: " + height);
			removeChild(_captionLabel);
			//logger.fatal("hidecaptionComplete()");
		}
		
		public function dispose():void
		{
			if(captionTimeline)
			{
				captionTimeline.clear();
				captionTimeline = null;
			}
			
			while (numChildren > 0)
			{
				removeChildAt(0);
			}
			
			if(img)img.bitmapData.dispose();
			
			_captionLabel = null;
			img = null;
			border = null;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ImageWithBorderAndCaption );
	}
}
