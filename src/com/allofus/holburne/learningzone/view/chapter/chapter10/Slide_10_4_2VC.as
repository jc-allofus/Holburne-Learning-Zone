package com.allofus.holburne.learningzone.view.chapter.chapter10
{
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter10.Img_10_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_2_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_2_2;
	import com.holburne.learningzone.swc.chapter10.Slide_10_4_2;

	import flash.display.Bitmap;
	/**
	 * @author jc
	 */
	public class Slide_10_4_2VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_10_4_2; //make reference to mc from compiled swc

		public function Slide_10_4_2VC()
		{

			containerMC = new Slide_10_4_2();
			
			
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
			var str1:String = "<p class='popupPanelTitle'>A gift of flowers</p><p>Jane is picking some flowers to give to her sister.  The sweet-smelling honeysuckle winds itself round other plants and is attractive to bees, and for those two reasons it has long been associated with devotion and faithful affection.  It was normally used as a symbol of marriage, but here it indicates the bond between two happily unmarried sisters.</p>";
			var str2:String = "<p class='popupPanelTitle'>Genteel behaviour</p><p>In Georgian society, the way a person moved was an important indicator of politeness.  Deportment was such an important accomplishment for ladies and gentlemen that it was taught to children by hired tutors, usually dancing masters, who were often French or Italian.</p><p>In 1737 the French dancer François Nivelon wrote a treatise on Genteel Behaviour for the aspiring middle classes that probably influenced Devis.  Nivelon instructs his lady readers ‘To Give or Receive’ … with becoming Modesty and gentle Motion, not too near, nor … at too great Distance.’  The giver must curtsey before presenting their right hand with the gift in it, ‘easily withdrawing the Hand, till it comes to a circular Action.’</p>";
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO(str1, Img_10_4_2_1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO(str2, Img_10_4_2_2))
			];
			
			var title:String ="Meanings";
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
