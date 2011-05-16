package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.chapter2.Img_2_3_1_1;
	import com.holburne.learningzone.chapter2.Img_2_3_1_2;
	import com.holburne.learningzone.chapter2.Img_2_3_1_3;
	import com.holburne.learningzone.chapter2.Img_2_3_1_4;
	import com.holburne.learningzone.chapter2.Img_2_3_1_5;
	import com.holburne.learningzone.chapter2.Img_2_3_1_6;
	import com.holburne.learningzone.chapter2.Slide_2_3_1;
	import com.holburne.learningzone.swc.chapter2.Chap2IntroImage;

	import mx.logging.ILogger;

	import flash.display.Bitmap;



	/**
	 * @author jc
	 */
	public class Slide_2_3_1VC extends SingleImageWithHotspotsSlide
	{
		
		protected var containerMC:Slide_2_3_1;
		
		public function Slide_2_3_1VC()
		{
			containerMC = new Slide_2_3_1();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'>The Visit of the Godfather</p>"
			+	"<p class='imageCaption'>Pieter Brueghel the Younger (1565-1638)</p>"
			+	"<p class='imageCaption'>Oil on panel</p>"
			+	"<p class='imageCaption'>36.5 x 49.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne, A46</p>";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap2IntroImage(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			var str1:String = "<p>The farmer’s wife.</p>";
			var str2:String = "<p>A new-born baby.  The landlord and his wife are paying a visit to the farm to welcome the farmer’s new baby.</p>";
			var str3:String = "<p>A tenant farmer.  He rents the farmhouse and land and shares his produce with the landowner.</p>";
			var str4:String = "<p>The landowner</p>";
			var str5:String = "<p>The landowner’s wife</p>";
			var str6:String = "<p>The farmer’s first son.  Traditionally, the landlord was godfather to his tenants’ eldest sons.</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1, Img_2_3_1_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2, Img_2_3_1_2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3, Img_2_3_1_3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4, Img_2_3_1_4)),
				new HotspotButtonVO(containerMC.t5, new PopupPanelVO(str5, Img_2_3_1_5)),
				new HotspotButtonVO(containerMC.t6, new PopupPanelVO(str6, Img_2_3_1_6))
			];
			
			var title:String ="Who's who?";
			var description:String = "<p class='justified'>Tap a pin on the large image on the right to see more details.</p>";
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
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_2_3_1VC );
	}
}
