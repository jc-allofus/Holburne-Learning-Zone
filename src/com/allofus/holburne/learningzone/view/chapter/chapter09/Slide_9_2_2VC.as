package com.allofus.holburne.learningzone.view.chapter.chapter09
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.swc.chapter9.Img_9_2_2_1;
	import com.holburne.learningzone.swc.chapter9.Img_9_2_2_2;
	import com.holburne.learningzone.swc.chapter9.Img_9_2_2_3;
	import com.holburne.learningzone.swc.chapter9.Img_9_2_2_4;
	import com.holburne.learningzone.swc.chapter9.Img_9_2_2_5;
	import com.holburne.learningzone.swc.chapter9.Img_9_2_2_6;
	import com.holburne.learningzone.swc.chapter9.Slide_9_2_2;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_9_2_2VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_9_2_2;
		protected var mpText:TextBoxWithTitleAndDescription;

		public function Slide_9_2_2VC()
		{
			containerMc = new Slide_9_2_2();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>David Garrick as Sir John Brute in The Provok’d Wife by Sir John Vanbrugh</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Johan Zoffany (1733-1810)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1763</p>"
			+	"<p class='imageCaption'>75 x 62 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Somerset Maugham Collection, 2011</p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_9_2_2_1, st01);

			var st02:String = 
				"<p><span class='imageCaptionItalic'>Queen Charlotte</span><span class='imageCaption'>(1744-1818)</span></p>"
			+	"<p class='imageCaption'>Johan Zoffany (1733-1810)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1766</p>"
			+	"<p class='imageCaption'>88.9 x 68.6</p>"
			+	"<p class='imageCaption'>Bequest of Ernest E. Cook through the National Art Collections Fund, 1955</p>"
			+	"<p class='imageCaption'>A359</p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_9_2_2_2, st02);
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>Edward Shuter, John Beard and John Dunstall in Love in a Village by Isaac Bickerstaffe</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Johan Zoffany (1733-1810)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1767</p>"
			+	"<p class='imageCaption'>101.5 x 127 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Somerset Maugham Collection, 2011</p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_9_2_2_3, st03);	
			
			var st04:String = 
				"<p><span class='imageCaptionItalic'></span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>John Finlayson (about 1730 – about 1776) after Johan Zoffany </p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1767</p>"
			+	"<p class='imageCaption'>39 x 53 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Somerset Maugham Collection, 2011</p>";
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_9_2_2_4, st04);	
			
			var st05:String = 
				"<p><span class='imageCaptionItalic'>Charles Macklin as Shylock in The Merchant of Venice by William Shakespeare</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Johan Zoffany (1733-1810)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1768</p>"
			+	"<p class='imageCaption'>81 x 71 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Somerset Maugham Collection, 2011</p>";
			var vo05:ThumbnailVO = new ThumbnailVO(containerMc.t5, Img_9_2_2_5, st05);	
			
			var st06:String = 
				"<p><span class='imageCaptionItalic'>Samuel Foote and Thomas Weston</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>John Finlayson (about 1730 –  about 1776) after Johan Zoffany (1733-1810)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1769</p>"
			+	"<p class='imageCaption'>38.5 x 63 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Somerset Maugham Collection, 2011</p>";
			var vo06:ThumbnailVO = new ThumbnailVO(containerMc.t6, Img_9_2_2_6, st06);			
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03,vo04,vo05,vo06];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Other works";
			var page1:String = "";
//				"<p class='justified'>paragraph1text</p>"
//			+	"<p></p>"
//			+	"<p class='justified'>paragraph2text</p>"
//			;
			
			mpText = new TextBoxWithTitleAndDescription(title, page1, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(mpText);
			positionInRightFrame(mpText);
			mpText.y = AppGlobals.RIGHT_FRAME_Y;
			mpText.visible = false;
			mpText.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(largeImageContainer,containerMc,mpText);
		}
		
	}
}
