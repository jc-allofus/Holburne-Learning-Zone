package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.chapter2.Img_2_2_2;
	import com.holburne.learningzone.chapter2.Img_2_2_3_1;
	import com.holburne.learningzone.chapter2.Img_2_2_3_2;
	import com.holburne.learningzone.chapter2.Img_2_2_3_3;
	import com.holburne.learningzone.chapter2.Img_2_2_3_4;
	import com.holburne.learningzone.chapter2.Img_2_2_3_5;
	import com.holburne.learningzone.chapter2.Img_2_2_3_7;
	import com.holburne.learningzone.chapter2.Img_2_2_3_8;
	import com.holburne.learningzone.chapter2.Slide_2_2_3;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_2_2_3VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_2_2_3;
		
		public function Slide_2_2_3VC()
		{
			containerMc = new Slide_2_2_3();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>The Wedding Dance</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Imitator of Pieter Brueghel the Younger (1564/5 - 1637–8)</p>"
			+	"<p class='imageCaption'>Oil on panel, 36.6 x 49.1 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir William Holburne, A165</p>";
			var at01:String = "<p>Holburne bought this painting as a pair with The Visit of the Godfather but it is a later copy of a much reproduced work from the studio.</p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_2_2_3_1, st01,at01);

			var st02:String = 
				"<p><span class='imageCaptionItalic'>Interior of an Alehouse</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Circle of David Teniers II (1610-1690)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 36.8 x 47 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir William Holburne, A51</p>";
			var at02:String = "<p>David Teniers the Younger was married to Jan Breughel the Elder’s daughter Anna, the grandaughter of Pieter Bruegel the Elder.</p> "	;
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_2_2_3_2, st02,at02);

			var st03:String = 
				"<p><span class='imageCaptionItalic'>Landscape with Large Tree, Figures and Dog</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Attributed to David Teniers I (1582-1649)</p>"
			+	"<p class='imageCaption'>Oil on panel, 61 x 55.2 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir William Holburne, A52</p>";
			var at03:String = "<p>David Teniers the Elder was related to the Brueghels through the marriage of his son David the Younger.</p> "	;
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_2_2_3_3, st03,at03);

			var st04:String = 
				"<p><span class='imageCaptionItalic'>Landscape with track, figures and sheep</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Manner of David Teniers I (1582-1649)</p>"
			+	"<p class='imageCaption'>Oil on panel, 24.1 x 34.6 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir William Holburne, A61</p>";
			var at04:String = "<p>David Teniers the Elder was related to the Brueghels through the marriage of his son David the Younger.</p> "	;
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_2_2_3_4, st04,at04);

			var st05:String = 
				"<p><span class='imageCaptionItalic'>Still Life with Cheese</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Circle of Jan van Kessel (1626-1679)</p>"
			+	"<p class='imageCaption'>Oil on panel, 16.5 x 20.3 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir William Holburne, A165</p>";
			var at05:String = "<p>Jan van Kessel was the grandson of Jan Breughel the Elder.</p> ";
			var vo05:ThumbnailVO = new ThumbnailVO(containerMc.t5, Img_2_2_3_5, st01,at05);

			var st06:String = 
				"<p><span class='imageCaptionItalic'>The Peasant and the Birdnester</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Pieter Brueghel the Younger (1564/5 - 1637–8)</p>"
			+	"<p class='imageCaption'>Oil on panel, 17.8 cm diameter</p>"
			+	"<p class='imageCaption'>Collection of Sir William Holburne, A166</p>";
			var at06:String = "<p>A version of a painting by the artist’s father, Peter Bruegel the Elder.</p> "	;
			var vo06:ThumbnailVO = new ThumbnailVO(containerMc.t6, Img_2_2_2, st06,at06); //same image as used in Slide_2_2_2

			var st07:String = 
				"<p><span class='imageCaptionItalic'>Boys blowing Bubbles</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Manner of David Teniers II (1610-1690)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 22 cm diameter</p>"
			+	"<p class='imageCaption'>Collection of Sir William Holburne, A186</p>";
			var at07:String = "<p>David Teniers the Younger was married to Jan Breughel the Elder’s daughter Anna, the grandaughter of Pieter Bruegel the Elder.</p> "	;
			var vo07:ThumbnailVO = new ThumbnailVO(containerMc.t7, Img_2_2_3_7, st07,at07);

			var st08:String = 
				"<p><span class='imageCaptionItalic'>Tavern Interior</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Attributed to David Ryckaert III (1612-1661)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 65.5 x 86.1 cm diameter</p>"
			+	"<p class='imageCaption'>Given by O.M. Dalton in 1939, A345</p>";
			var at08:String = ""	;
			var vo08:ThumbnailVO = new ThumbnailVO(containerMc.t8, Img_2_2_3_8, st08,at08);
			
			thumbnailVOs = new <ThumbnailVO>[vo01, vo02, vo03, vo04, vo05, vo06, vo07, vo08];

			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Other Bruenhal works";
			var description:String = "<p class='justified'>Other Paintings in the Holburne associated with the Bruegel Circle.  Tap a small image to view more detail.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			text.x = AppGlobals.RIGHT_FAME_X;
			text.y = AppGlobals.RIGHT_FRAME_Y;
			addChild(text);		
			
			super();
			
		}
		
		override public function transitionIn():void
		{
			super.staggerItemsIn(largeImageContainer,text,containerMc);
		}
		
		override protected function showThumbSelected():void
		{
			super.showThumbSelected();
			if(selectedThumbVO)
			{
				text.setAdditionalText(selectedThumbVO.additionalText);	
			}
		}
		
		override public function dispose():void
		{
			containerMc = null;
			super.dispose();
		}	
	}
}
