package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.chapter3.Img_3_2_4_1;
	import com.holburne.learningzone.chapter3.Img_3_2_4_2;
	import com.holburne.learningzone.chapter3.Img_3_2_4_3;
	import com.holburne.learningzone.swcassets.chapter3.Slide_3_2_4;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_3_2_4VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_3_2_4;
		
		public function Slide_3_2_4VC()
		{
			containerMc = new Slide_3_2_4();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>Self Portrait at 26</span><span class='imageCaption'>,  1498</span></p>"
			+	"<p class='imageCaption'>Albrecht Dürer (1471-1528)</p>"
			+	"<p class='imageCaption'>Oil on panel, 52 x 41 cm</p>"
			+	"<p class='imageCaption'>Museo del Prado, Madrid</p>";
			var at01:String = "<p>Albrecht Dürer's famous self-portrait is dated 1498 together with the words “I was 26 years old”.  Barker was about the same age in his painting. Both self-portraits were painted after returning from formative visits to Italy. Dürer refers to his travels by placing a sunny mountain landscape in the window behind him, Barker places his view of Italy (and the temple at Tivoli) on his easel. Both artists are flamboyantly dressed with long, curling hair.</p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_3_2_4_1, st01, at01);

			var st02:String = 
				"<p><span class='imageCaptionItalic'>Lord John and Lord Bernard Stuart</span><span class='imageCaption'>, c. 1638</span></p>"
			+	"<p class='imageCaption'>Sir Anthony van Dyck (1599-1641) </p>"
			+	"<p class='imageCaption'>Oil on canvas, 238 x 146 cm</p>"
			+	"<p class='imageCaption'>National Gallery, London</p>";
			var at02:String = "<p>Barker's portrait imitates Anthony van Dyck even more obviously. His pose, with his back to the viewer, a hand on his hip and his head turning to face us, is borrowed from Van Dyck’s portrait of Lords John and Bernard Stuart.</p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_3_2_4_2, st02, at02);
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>Self Portrait with a Sunflower</span><span class='imageCaption'>, c.1632</span></p>"
			+	"<p class='imageCaption'>Sir Anthony van Dyck (1599-1641)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 60 x 73 cm</p>"
			+	"<p class='imageCaption'>Private collection</p>";
			var at03:String = "<p>Barker must also have been aware of Van Dyck’s own self portrait with a Sunflower, in which the artist, dressed in a red-brown tunic similar to Barker’s, looks over his shoulder and out at the viewer.</p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_3_2_4_3, st03, at03);			
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Influences";
			var page1:String = 
				"<p class='justified'>Thomas Barker used his self portrait as a way of telling the public about himself and his art.  As an artist who admired and imitated the great artists of the past, he used the self portrait as a way of comparing himself to them. In particular his painting harks back to two other famous self portraits.</p>"
			;
			

			text = new TextBoxWithTitleAndDescription(title, page1);
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
			
			if(text)
				text.dispose();
			
			super.dispose();
		}
	}
}
