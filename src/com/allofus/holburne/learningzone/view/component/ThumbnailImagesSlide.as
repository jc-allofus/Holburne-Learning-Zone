package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailClickedVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;

	import mx.logging.ILogger;

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
		protected var thumbnailVOs:Vector.<ThumbnailClickedVO>;
		protected var largeImageContainer:Sprite;
		
		public function ThumbnailImagesSlide()
		{
			selectDefault();
			super();
		}
		protected function selectDefault(thumbIndex:int = 0):void
		{
			_selectedThumb = thumbnailVOs[thumbIndex].thumbnail;
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
			_selectedThumb = clicked;
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
					var img:MovieClip = new thumbnailVOs[i].largeImageClassRef() as MovieClip;
					var pt:Point = PositionUtil.getPositionInLeftFrame(img);
					img.x = pt.x;
					img.y = pt.y;
					largeImageContainer.addChild(img);
					TweenMax.from(img, AppGlobals.FADE_DURATION, {alpha:0, ease:AppGlobals.FADE_EASE});
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
				largeImageContainer.removeChild(child);
			}
		}
		
		override public function dispose():void
		{
			logger.fatal("disposing a thumbnail image slide");
			if(thumbnailVOs)
			{
				thumbnailVOs.length = 0;
			}
			disableThumbs();
			thumbnailVOs = null;
			_selectedThumb = null;
			largeImageContainer = null;
			super.dispose();	
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ThumbnailImagesSlide );	
	}
}
