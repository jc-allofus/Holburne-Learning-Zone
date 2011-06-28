package com.allofus.holburne.learningzone.view.chapter.chapter08
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.swc.chapter8.Img_8_2_2_1;
	import com.holburne.learningzone.swc.chapter8.Img_8_2_2_2;
	import com.holburne.learningzone.swc.chapter8.Img_8_2_2_3;
	import com.holburne.learningzone.swc.chapter8.Img_8_2_2_4;
	import com.holburne.learningzone.swc.chapter8.Slide_8_2_2;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_8_2_2VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_8_2_2;

		public function Slide_8_2_2VC()
		{
			containerMc = new Slide_8_2_2();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>Penitent Magdalene</span><span class='imageCaption'>, about 1698</span></p>"
			+	"<p class='imageCaption'>Michele Rocca</p>"
			+	"<p class='imageCaption'>Oil on canvas,  48.3 x 36.8 cm</p>"
			+	"<p class='imageCaption'>Getty Museum, California</p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_8_2_2_1, st01);

			var st02:String = 
				"<p><span class='imageCaptionItalic'>The Continence of Scipio</span><span class='imageCaption'>, about 1720</span></p>"
			+	"<p class='imageCaption'>Michele Rocca</p>"
			+	"<p class='imageCaption'>Oil on canvas, 24 x 35 cm</p>"
			+	"<p class='imageCaption'>Musée du Louvre, Paris </p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_8_2_2_2, st02);
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>The Continence of Scipio</span><span class='imageCaption'>, about 1720</span></p>"
			+	"<p class='imageCaption'>Michele Rocca</p>"
			+	"<p class='imageCaption'>Oil on canvas, 88 x 135 cm</p>"
			+	"<p class='imageCaption'>Musée du Louvre, Paris</p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_8_2_2_3, st03);		
			
			var st04:String = 
				"<p><span class='imageCaptionItalic'>Rinaldo and Armida</span><span class='imageCaption'>, after 1720</span></p>"
			+	"<p class='imageCaption'>Michele Rocca</p>"
			+	"<p class='imageCaption'>oil on canvas, 37 x 47.3 cm </p>"
			+	"<p class='imageCaption'>Walters Art Museum, Baltimore</p>";
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_8_2_2_4, st04);		
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03,vo04];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Examples of Work by Michele Rocca";
			var page1:String = 
				"<p class='justified'></p>"
//			+	"<p></p>"
//			+	"<p class='justified'>paragraph2text</p>"
			;
			
			text = new TextBoxWithTitleAndDescription(title, "", AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			positionInRightFrame(text);
			text.y = AppGlobals.RIGHT_FRAME_Y;
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(largeImageContainer,containerMc,text);
		}
		
		override public function dispose():void
		{
			containerMc = null;
			super.dispose();
		}
		
	}
}
