package com.allofus.holburne.learningzone.view.chapter.chapter10
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter10.Img_10_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_3_1_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_3_1_2;
	import com.holburne.learningzone.swc.chapter10.Slide_10_3_1;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_10_3_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_10_3_1; //make reference to mc from compiled swc

		public function Slide_10_3_1VC()
		{

			containerMC = new Slide_10_3_1();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'>Alicia and Jane Clarke</p>"
			+	"<p class='imageCaption'>Arthur Devis (1712-1787)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1758</p>"
			+	"<p class='imageCaption'>91.5 x 71 cm</p>"
			+	"<p class='imageCaption'>Accepted by HM Government in Lieu of Inheritance Tax and allocated to the Holburne Museum of Art, 2007</p>"
			+	"<p class='imageCaption'>2007.2</p>"
			;
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_10_1(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			var str1:String = "<p class='popupPanelTitle'>Miss Alicia Clarke</p><p>The Clarke sisters were joint owners of the Walford Court  and Hill Court estates near Ross-on-Wye, Herefordshire.  They inherited Walford in 1724 from their neighbour and distant cousin John Kyrle, a well-known local philanthropist and landscape architect.</p>";
			var str2:String = "<p class='popupPanelTitle'>Miss Jane Clarke (1715-1806)</p><p>Neither of the sisters married but they shared their home and fortune.  They were well-known locally for their hospitality and as patrons of the arts.</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1,Img_10_3_1_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2,Img_10_3_1_2))
			];
			
			var title:String ="Who are they?";
			var description:String = "<p class='justified'>Touch the picture to find out who's who.</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			text.alpha = 0;
			addChild(text);
			
			super();
			
//			text.y = AppGlobals.RIGHT_FRAME_Y;
			img.showCaption(false);
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(img,text); 
		}
			
	}
}
