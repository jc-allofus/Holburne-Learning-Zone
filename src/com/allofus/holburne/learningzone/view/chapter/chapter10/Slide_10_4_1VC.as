package com.allofus.holburne.learningzone.view.chapter.chapter10
{
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter10.Img_10_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_1_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_1_2;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_1_3;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_1_4;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_1_5;
	import com.holburne.learningzone.swc.chapter10.Slide_10_4_1;

	import flash.display.Bitmap;
	/**
	 * @author jc
	 */
	public class Slide_10_4_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_10_4_1;

		public function Slide_10_4_1VC()
		{

			containerMC = new Slide_10_4_1();
			
			
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
			
			
			pins = new Vector.<HotspotPin>();
			var str1:String = "<p class='popupPanelTitle'>Sleeve ruffles</p><p>You could tell a lot about a lady from what she wore at her elbow: lace ruffles or engageantes were attached to the edge of the sleeve, which always ended at the elbow.  They could vary greatly in size and quality, and some were wealthy enough to wear triple ruffles.  Mrs Clarke’s are a relatively simple double layer of fine muslin edged with lace or embroidery.</p>";
			var str2:String = "<p class='popupPanelTitle'>Jewellery</p><p>Pearl necklaces, earrings and hair ornaments were very popular for daywear in the mid eighteenth century.  Before pearl cultivation developed in the early twentieth century, pearls were very rare and grew only in the wild.  Gathering them from the sea was a dangerous business, and matching them a very skilled one.  The number of pearls worn by Mrs Clarke tells us how wealthy she must have been.  Ladies particularly liked pearls because their lustre flattered the skin.  Some even used powdered pearl as a light-diffusing face powder.</p>";
			var str3:String = "<p class='popupPanelTitle'>Mittens</p><p>Silk or kid leather mittens were a popular accessory for ladies to keep their hands white by protecting them from the sun in summer and the cold in winter.  A single pocket covers the fingers; it can be folded back towards the wrist to leave the fingers free.</p>";
			var str4:String = "<p class='popupPanelTitle'>Gown</p><p>This blue gown is identical to one in two other paintings by Devis.   The artist had no training in life drawing so he composed his portraits by posing jointed wooden mannequins or lay figures as miniature stand-ins for real people.  He owned a stock of little costumes for them, and this dress may be copied from one of these rather than a real gown owned by Mrs Clarke.</p>";
			var str5:String = "<p class='popupPanelTitle'>Hats</p><p>This pretty summer hat is made of straw covered in white silk and decorated with lace and blue satin ribbon to match Jane Clarke’s gown.  At a time when a dress code was carefully observed by all strata of society, hats were an important symbol of status.  Nobody went hatless out of doors.  Married women always wore a light linen or silk cap, even indoors, which would stay on when they put a hat on to go out.</p>";
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO(str1,Img_10_4_1_1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO(str2,Img_10_4_1_2)),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO(str3,Img_10_4_1_3)),
				new HotspotPinVO(containerMC.t4, new PopupPanelVO(str4,Img_10_4_1_4)),
				new HotspotPinVO(containerMC.t5, new PopupPanelVO(str5,Img_10_4_1_5))
			];
			
			var title:String ="Costumes";
			var description:String = "<p class='justified'>lorem ipsum...</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			text.alpha = 0;
			addChild(text);
			
			super();
			
			img.showCaption(false);
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(img,text); 
		}
			
	}
}
