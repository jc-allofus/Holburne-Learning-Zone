package com.allofus.holburne.learningzone.view.templates
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.MultipageTextBox;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;

	import flash.display.MovieClip;
	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class TemplateThumbnailSlide extends ThumbnailImagesSlide
	{
		protected var containerMc:MovieClip;
		protected var mpText:MultipageTextBox;

		public function TemplateThumbnailSlide()
		{
			containerMc = new MovieClip();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'></span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Class, st01);

			var st02:String = 
				"<p><span class='imageCaptionItalic'></span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Class, st02);
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'></span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Class, st03);			
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Title";
			var page1:String = 
				"<p class='justified'>paragraph1text</p>"
			+	"<p></p>"
			+	"<p class='justified'>paragraph2text</p>"
			;
			
			var page2:String = 
				"<p class='justified'>paragraph1text</p>"
			+	"<p></p>"
			+	"<p class='justified'>paragraph2text</p>"
			;
			mpText = new MultipageTextBox(title, [page1,page2], AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(mpText);
			positionInRightFrame(mpText);
			mpText.y = AppGlobals.RIGHT_FRAME_Y;
			mpText.visible = false;
			mpText.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn([largeImageContainer,containerMc,mpText]);
		}
		
	}
}
