package com.allofus.holburne.learningzone.view.chapter.chapter10
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_3_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_3_2;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_3_3;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_3_4;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_3_5;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_3_6;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_3_7;
	import com.holburne.learningzone.swc.chapter10.Slide_10_4_3;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_10_4_3VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_10_4_3;

		public function Slide_10_4_3VC()
		{
			containerMc = new Slide_10_4_3();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>The Pitt Family of Encombe</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>William Hoare (about 1707-1792)</p>"
			+	"<p class='imageCaption'>Oil on canvas, between 1758 and 1761</p>"
			+	"<p class='imageCaption'>118 x 140 cm</p>"
			+	"<p class='imageCaption'>Purchased with assistance from the V&A/MLA Purchase Grant Fund, the Art Fund, the Beecroft Bequest, the Friends of the Holburne Museum, a private donor, and David Posnett in memory of Harold Leger, 2009</p>"
			+	"<p class='imageCaption'>2009.2</p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_10_4_3_1, st01);

			var st02:String = 
				"<p><span class='imageCaptionItalic'>The Byam Family</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Thomas Gainsborough (1727-1788)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1762-66</p>"
			+	"<p class='imageCaption'>238.5 x 229.7 cm</p>"
			+	"<p class='imageCaption'>On long-term loan from the Andrew Brownsword Arts Foundation</p>"
			+	"<p class='imageCaption'>L2001.1</p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_10_4_3_2, st02);
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>The Sanderson Children</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>William Tate (about 1750 - 1806)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1775</p>"
			+	"<p class='imageCaption'>90.8 x 76.2 cm</p>"
			+	"<p class='imageCaption'>Presented by Miss J.M. Oldfield and Mrs. D. Ball, 1995</p>"
			+	"<p class='imageCaption'>1995.4</p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_10_4_3_3, st03);	
			
			var st04:String = 
				"<p><span class='imageCaptionItalic'>The Rev. Robert Carter Thelwall and his family</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>George Stubbs (1724-1806)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1776 </p>"
			+	"<p class='imageCaption'>96.5 x 155 cm</p>"
			+	"<p class='imageCaption'>Bequest of Ernest E. Cook through the National Art Collections Fund, 1955</p>"
			+	"<p class='imageCaption'>A368</p>";
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_10_4_3_4, st04);
			
			var st05:String = 
				"<p><span class='imageCaptionItalic'>The Stapleton Family</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Thomas Beach (1738-1806)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1789 </p>"
			+	"<p class='imageCaption'>152.5 x 137.2 cm</p>"
			+	"<p class='imageCaption'>Bequest of Miss E.M.C. Stapleton, 1950</p>"
			+	"<p class='imageCaption'>A355</p>";
			var vo05:ThumbnailVO = new ThumbnailVO(containerMc.t5, Img_10_4_3_5, st05);
			
			var st06:String = 
				"<p><span class='imageCaptionItalic'>A Young Lady and a Little Girl</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Attributed to  Marguerite Gérard (1761-1837)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1785-1790</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A93</p>";
			var vo06:ThumbnailVO = new ThumbnailVO(containerMc.t6, Img_10_4_3_6, st06);		
			
			var st07:String = 
				"<p><span class='imageCaptionItalic'>Charlotte Sargent with her Grand-daughter Mary</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>British school, mid nineteenth century</p>"
			+	"<p class='imageCaption'>Oil on canvas</p>"
			+	"<p class='imageCaption'>49 x 38 cm</p>"
			+	"<p class='imageCaption'>Bequest of Sir Orme Sargent, 1962</p>"
			+	"<p class='imageCaption'>A380</p>";
			var vo07:ThumbnailVO = new ThumbnailVO(containerMc.t7, Img_10_4_3_7, st07);
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03,vo04,vo05,vo06,vo07];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Conversation Pieces";
			var page1:String = "lorem ipsum...";
//				"<p class='justified'>paragraph1text</p>"
//			+	"<p></p>"
//			+	"<p class='justified'>paragraph2text</p>"
//			;
			text = new TextBoxWithTitleAndDescription(title, page1, AppGlobals.RIGHT_FRAME_WIDTH);
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
