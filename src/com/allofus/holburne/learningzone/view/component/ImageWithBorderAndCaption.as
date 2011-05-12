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
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class ImageWithBorderAndCaption extends Sprite
	{
		
		protected var img:DisplayObject;
		protected var border:Shape;
		protected var _captionLabel:TextField;
		
		protected var captionTimeline:TimelineMax;
		
		public function ImageWithBorderAndCaption(img:DisplayObject, captionText:String)
		{
			//visible = false;
			
			this.img  = img;
			this.img.x = this.img.y = AppGlobals.BORDER_SIZE;
			
			var totalWidth:int = Math.round(img.width + (AppGlobals.BORDER_SIZE * 2));
			var totalHeight:int = Math.round(img.height + (AppGlobals.BORDER_SIZE * 2));
			
			border = new Shape();
			border.graphics.beginFill(AppGlobals.BORDER_COLOR);
			border.graphics.drawRect(0, 0, totalWidth, totalHeight);

			if(captionText != "")
			{
				_captionLabel = FontManager.createTextField(captionText, img.width, 0, true);
				_captionLabel.x = AppGlobals.BORDER_SIZE;
				_captionLabel.y = this.img.y + this.img.height + AppGlobals.BORDER_SIZE;
				_captionLabel.visible = false;
				_captionLabel.alpha = 0;
			}
			
			var gf:GlowFilter = new GlowFilter(0, 0.25,20,20,1,3);
			
			filters = [gf];
			
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
		
		
		public function showCaption(useTween:Boolean = true):void
		{
			if(!_captionLabel)
			{
				showCaptionComplete();
				return;
			}
			
			addChild(_captionLabel);
			var th:Number = _captionLabel.y + _captionLabel.height + AppGlobals.BORDER_SIZE;
			
			if(useTween)
			{
				if(captionTimeline) captionTimeline.clear();
				captionTimeline = new TimelineMax({onComplete:showCaptionComplete});
				captionTimeline.insert(new TweenMax(border, 0.35, {height:th, ease:Expo.easeInOut}));
				captionTimeline.append(new TweenMax(_captionLabel, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE}));
			}
			else
			{
				border.height = th;
				_captionLabel.alpha = 1;
				_captionLabel.visible = true;
			}
		}
		
		protected function showCaptionComplete():void
		{
			//logger.fatal("showCaptionComplete()");
		}
		
		public function hideCaption():void
		{
			if(!_captionLabel)
			{
				hideCaptionComplete();
				return;
			}
			
			var th:Number = Math.round(img.height + (AppGlobals.BORDER_SIZE * 2));;
			if(captionTimeline) captionTimeline.clear();
			captionTimeline = new TimelineMax({onComplete:hideCaptionComplete});
			captionTimeline.insert(new TweenMax(_captionLabel, 0.35, {autoAlpha:0, ease:AppGlobals.FADE_EASE}));
			captionTimeline.insert(new TweenMax(border, 0.35, {height:th, ease:Expo.easeInOut}));
		}
		
		protected function hideCaptionComplete():void
		{
			if(_captionLabel && contains(_captionLabel))
				removeChild(_captionLabel);
		}
		
		public function dispose():void
		{
			if(captionTimeline)
			{
				captionTimeline.clear();
				captionTimeline = null;
			}
			
			if(img)
			{
				if(img is Bitmap)
					(img as Bitmap).bitmapData.dispose();
					
				if(img is BeforeAndAfterSwipeWithCaption)
					(img as BeforeAndAfterSwipeWithCaption).dispose();
			}
			
			_captionLabel = null;
			img = null;
			border = null;
			
			while (numChildren > 0)
			{
				removeChildAt(0);
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ImageWithBorderAndCaption );
	}
}
