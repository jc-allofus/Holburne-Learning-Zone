package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailClickedVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.greensock.TweenMax;
	import com.holburne.learningzone.swcassets.Img_1_2_2_10;
	import com.holburne.learningzone.swcassets.Img_1_2_2_2;
	import com.holburne.learningzone.swcassets.Img_1_2_2_3;
	import com.holburne.learningzone.swcassets.Img_1_2_2_4;
	import com.holburne.learningzone.swcassets.Img_1_2_2_5;
	import com.holburne.learningzone.swcassets.Img_1_2_2_6;
	import com.holburne.learningzone.swcassets.Img_1_2_2_7;
	import com.holburne.learningzone.swcassets.Img_1_2_2_9;
	import com.holburne.learningzone.swcassets.Slide_1_2_2;

	import mx.logging.ILogger;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class Slide_1_2_2VC extends AbstractSlide
	{
		protected var containerMc:Slide_1_2_2;
		protected var thumbnails:Vector.<MovieClip>;
		
		protected var thumbnailVOs:Vector.<ThumbnailClickedVO>;
		
		protected var _selectedThumb:MovieClip;
		
		public function Slide_1_2_2VC()
		{
			containerMc = new Slide_1_2_2();
			thumbnails = new <MovieClip>[containerMc.thumb_1_2_2_2, containerMc.thumb_1_2_2_3, containerMc.thumb_1_2_2_4, containerMc.thumb_1_2_2_5, containerMc.thumb_1_2_2_6, containerMc.thumb_1_2_2_7, containerMc.thumb_1_2_2_9, containerMc.thumb_1_2_2_10];
			
			thumbnailVOs = new <ThumbnailClickedVO>
			[
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_2, Img_1_2_2_2),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_3, Img_1_2_2_3),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_4, Img_1_2_2_4),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_5, Img_1_2_2_5),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_6, Img_1_2_2_6),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_7, Img_1_2_2_7),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_9, Img_1_2_2_9),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_10, Img_1_2_2_10)
			];
			
			var vo:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.thumb_1_2_2_2, Img_1_2_2_2);
			
			
			initThumbs();
			
			addChild(containerMc);
			super();
		}
		
		protected function initThumbs():void
		{
			for (var i : int = 0; i < thumbnails.length; i++) 
			{
				//thumbnails[i].alpha = 0;
				thumbnails[i].addEventListener(MouseEvent.CLICK, handleThumbClick);
			}
		}
		
		protected function handleThumbClick(event:MouseEvent):void
		{
			if(_selectedThumb)deselect(_selectedThumb);
			var clicked:MovieClip = event.currentTarget as MovieClip;
			TweenMax.to(clicked, AppGlobals.FADE_DURATION * 0.5, {alpha:0.8, colorTransform:{tint:0xffffff, tintAmount:0.7}, ease:AppGlobals.FADE_EASE});
			_selectedThumb = clicked;
		}
		
		protected function deselect(thumb:MovieClip):void
		{
			//thumbnails[i].alpha = 1;
			TweenMax.to(thumb, AppGlobals.FADE_DURATION * 0.5, {alpha:1, colorTransform:{tintAmount:0}, ease:AppGlobals.FADE_EASE});
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_2_2VC );
	}
}
