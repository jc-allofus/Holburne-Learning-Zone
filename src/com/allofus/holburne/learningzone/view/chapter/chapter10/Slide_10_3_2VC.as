package com.allofus.holburne.learningzone.view.chapter.chapter10
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter10.Img_10_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_3_2_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_3_2_2;
	import com.holburne.learningzone.swc.chapter10.Slide_10_3_2;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_10_3_2VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_10_3_2;

		public function Slide_10_3_2VC()
		{

			containerMC = new Slide_10_3_2();
			
			
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
			
			var str1:String = "<p class='popupPanelTitle'>View of the River Wye</p><p>The Hill (known today as Hill Court) overlooks the river Wye towards Goodrich Castle and the mountains of South Wales.  Devis has probably used some artistic licence in depicting the village of Walford and the church of St. Michael and all Angels, where members of the Clarke family are buried.</p>";
			var str2:String = "<p class='popupPanelTitle'>Hill Court</p><p>The sisters are probably depicted outside their home at The Hill above Walford near Ross-on-Wye, Herefordshire.  In his book Excursion down the Wye, published in 1808, Charles Heath recalled a visit in the 1790s to “Mrs Clarke” (i.e. Jane), the “sole survivor of her ancient family”.  This is how he described the estate: “... placed on a gentle elevation on the shore of the river Wye.  The mansion is a handsome modern brick building, surrounded by fine gardens ... in the midst of a country abounding in the highest degree with every comfort that can gladden life”.</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1,Img_10_3_2_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2,Img_10_3_2_2))
			];
			
			var title:String ="Where do they live?";
			var description:String = "<p class='justified'>Touch the picture to have a look round the landscape.</p>";
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
