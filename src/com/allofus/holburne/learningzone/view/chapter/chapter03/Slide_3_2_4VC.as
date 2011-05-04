package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.MultipageTextBox;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.chapter3.Img_3_2_4_1;
	import com.holburne.learningzone.chapter3.Img_3_2_4_2;
	import com.holburne.learningzone.chapter3.Img_3_2_4_3;
	import com.holburne.learningzone.swcassets.chapter3.Slide_3_2_4;

	import mx.logging.ILogger;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_3_2_4VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_3_2_4;
		protected var mpText:MultipageTextBox;
		
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
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_3_2_4_1, st01);

			var st02:String = 
				"<p><span class='imageCaptionItalic'>Lord John and Lord Bernard Stuart</span><span class='imageCaption'>, c. 1638</span></p>"
			+	"<p class='imageCaption'>Sir Anthony van Dyck (1599-1641) </p>"
			+	"<p class='imageCaption'>Oil on canvas, 238 x 146 cm</p>"
			+	"<p class='imageCaption'>National Gallery, London</p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_3_2_4_2, st02);
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>Self Portrait with a Sunflower/span><span class='imageCaption'>, c.1632</span></p>"
			+	"<p class='imageCaption'>Sir Anthony van Dyck (1599-1641)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 60 x 73 cm</p>"
			+	"<p class='imageCaption'>Private collection</p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_3_2_4_3, st03);			
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Barker’s Self Portrait";
			var page1:String = 
				"<p class='justified'>Thomas Barker used his self portrait as a way of telling the public about himself and his art.  As an artist who admired and imitated the great artists of the past, he used the self portrait as a way of comparing himself to them.</p>"
			+	"<p></p>"
			+	"<p class='justified'>One of the first and finest self portraits ever made by a painter was the portrait German artist Albrecht Dürer’s.  Dürer dated his portrait 1498, adding the words “I was 26 years old”.  Thomas Barker was about the same age when he painted the portrait now in the Holburne.  Both Dürer and Barker painted their self portraits soon after returning from a formative visit to Italy, and whilst Dürer refers to his travels by placing a sunny mountain landscape in the window behind him, Barker, three hundred years on, places his view of Italy on the easel at his side.  Both are flamboyantly dressed as gentlemen of fashion, and make a feature of their long, curling hair.</p>"
			;
			
			var page2:String = 
				"<p class='justified'>Dürer’s portrait, now in the Prado in Madrid, once belonged to Charles I of England, where it was copied by the engraver Wenceslaus Hollar.  It was the greatest artist of Charles I’s court, Anthony van Dyck, that Barker has imitated most closely in this portrait.  The young man’s pose with his back to the viewer, a hand on his hip and his head turning to face us, is borrowed from Van Dyck’s portrait of Lords John and Bernard Stuart.  Barker must also have been aware of Van Dyck’s own self portrait with a Sunflower, in which the artist, dressed in a red-brown tunic similar to Barker’s, looks over his shoulder.</p>"
			+	"<p></p>"
			+	"<p class='justified'>In self portraits, the artist is often depicted with his back turned and looking over his shoulder, for a very simple practical reason: while painting or drawing an image of himself, he would have had to turn away from his paper or canvas from time to time to look in a mirror.</p>"
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
		
		//override protected function staggerInComplete():void{containerMc.t1.alpha = containerMc.t2.alpha = containerMc.t3.alpha = 0;}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_3_2_4VC );
	}
}
