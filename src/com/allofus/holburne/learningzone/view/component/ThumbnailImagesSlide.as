package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class ThumbnailImagesSlide extends AbstractSlide
	{
		protected var _selectedThumb:MovieClip;
		protected var _selectedThumbVO:ThumbnailVO;
		protected var thumbnailVOs:Vector.<ThumbnailVO>;
		protected var largeImage:ImageWithBorderAndCaption;
		protected var largeImageContainer:Sprite;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function ThumbnailImagesSlide()
		{
			selectDefault();
			super();
		}
		
		protected function selectDefault(thumbIndex:int = 0):void
		{
			selectedThumb = thumbnailVOs[thumbIndex].thumbnail;
			showThumbSelected();
			showSelectedLargeImage();
		}
		
		protected function enableThumbs():void
		{
			for (var i : int = 0; i < thumbnailVOs.length; i++) 
			{
				thumbnailVOs[i].thumbnail.buttonMode = true;
				thumbnailVOs[i].thumbnail.addEventListener(MouseEvent.CLICK, handleThumbClick);
			}
		}
		
		protected function disableThumbs():void
		{
			if(!thumbnailVOs || thumbnailVOs.length < 1)return;
			for (var i : int = 0; i < thumbnailVOs.length; i++) 
			{
				thumbnailVOs[i].thumbnail.buttonMode = false;
				thumbnailVOs[i].thumbnail.removeEventListener(MouseEvent.CLICK, handleThumbClick);
			}
		}
		
		protected function handleThumbClick(event:MouseEvent):void
		{
			var clicked:MovieClip = event.currentTarget as MovieClip;
			if(_selectedThumb)
			{
				if(_selectedThumb === clicked)
				{
					return;
				}
				deselect(_selectedThumb);
			}
			selectedThumb = clicked;
			showThumbSelected();
			showSelectedLargeImage();
		}
		
		protected function showThumbSelected():void
		{
			TweenMax.to(_selectedThumb, AppGlobals.FADE_DURATION * 0.5, {alpha:0.8, colorTransform:{tint:0xffffff, tintAmount:0.7}, ease:AppGlobals.FADE_EASE});
		}
		
		protected function showSelectedLargeImage():void
		{
			for (var i : int = 0; i < thumbnailVOs.length; i++) 
			{
				if (_selectedThumb === thumbnailVOs[i].thumbnail)
				{
					clearLargeImages();
					var bmd:BitmapData = new thumbnailVOs[i].largeImageClassRef(0,0) as BitmapData;
					largeImage = new ImageWithBorderAndCaption(new Bitmap(bmd), thumbnailVOs[i].caption);
					var pt:Point = PositionUtil.getPositionInLeftFrame(largeImage);
					largeImage.showCaption(false);
					largeImage.x = pt.x;
					largeImage.y = pt.y;
					largeImageContainer.addChild(largeImage);
					TweenMax.from(largeImage, AppGlobals.FADE_DURATION, {alpha:0, ease:AppGlobals.FADE_EASE});
					return;
				}
			}
			logger.error("uh oh, something went wrong trying to show " + _selectedThumb + "'s large image: ");
		}
		
		protected function deselect(thumb:MovieClip):void
		{
			TweenMax.to(thumb, AppGlobals.FADE_DURATION * 0.5, {alpha:1, colorTransform:{tintAmount:0}, ease:AppGlobals.FADE_EASE});
		}
		
		protected function clearLargeImages():void
		{
			var child:DisplayObject;
			while(largeImageContainer.numChildren > 0)
			{
				child = largeImageContainer.getChildAt(0);
				TweenMax.killTweensOf(child);
				largeImageContainer.removeChildAt(0);
			}
		}
		
		protected function set selectedThumb(value:MovieClip):void
		{
			_selectedThumb = value;
			for (var i : int = 0; i < thumbnailVOs.length; i++) 
			{
				if (_selectedThumb === thumbnailVOs[i].thumbnail)
				{
					_selectedThumbVO = thumbnailVOs[i];
					return;
				}
			}
		}
		
		override public function dispose():void
		{
			disableThumbs();
			if(thumbnailVOs)
				thumbnailVOs.length = 0;
			
			if(text)
				text.dispose();	
			text = null;
			
			if(largeImage)
				largeImage.dispose();
			largeImage = null;
			
			thumbnailVOs = null;
			_selectedThumb = null;
			_selectedThumbVO = null;
			largeImageContainer = null;
			super.dispose();	
		}

		public function get selectedThumbVO() : ThumbnailVO
		{
			return _selectedThumbVO;
		}	
		
		private static const logger : ILogger = GetLogger.qualifiedName(ThumbnailImagesSlide);
	}
}
