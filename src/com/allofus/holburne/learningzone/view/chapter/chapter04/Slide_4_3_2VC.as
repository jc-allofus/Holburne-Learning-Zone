package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter4.Chap4IntroImage;
	import com.holburne.learningzone.swc.chapter4.Slide_4_3_2;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_4_3_2VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_4_3_2;
		
		public function Slide_4_3_2VC()
		{
			containerMC = new Slide_4_3_2();
			pins = new Vector.<HotspotPin>();
			
			var caption:String = 
				"<p class='imageCaptionItalic'>Still Life with Shellfish and Fruit</p>"
			+	"<p class='imageCaption'>follower of Abraham van Beyeren (about 1620-1690) </p>"
			+	"<p class='imageCaption'>Oil on canvas, 1660s</p>"
			+	"<p class='imageCaption'>87.8 x 104.2 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A15</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap4IntroImage(0,0)), caption);
			addChild(img);
			
			var str1:String = "<p>ewer</p>";
			var str2:String = "<p>Porcelain dish</p>";
			var str3:String = "<p>Cover to gold cup.  Figure with lance. </p>";
			var str4:String = "<p>Pocket watch.  The artist has included a time-piece as a reminder that all the riches of nature and art will pass away</p>";
			var str5:String = "<p>Roemer</p>";
			var str6:String = "<p>Gold cup – parcel gilt??</p>";
			var str7:String = "<p>Parrot. Exotic pets imported from the southern hemisphere were an important status symbol.</p>";
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO(str3)),
				new HotspotPinVO(containerMC.t4, new PopupPanelVO(str4)),
				new HotspotPinVO(containerMC.t5, new PopupPanelVO(str5)),
				new HotspotPinVO(containerMC.t6, new PopupPanelVO(str6)),
				new HotspotPinVO(containerMC.t7, new PopupPanelVO(str7))
			];
			
			var title:String ="Treasures of the Banquet table";
			var description:String = "";
//				"<p class='justified'></p>"
//			+	"<p></p>"
//			+	"<p class='justified'></p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
			
			img.showCaption(false);
		}
		override public function transitionIn():void
		{
			containerMC.alpha = 0;
			text.alpha = 0;
			staggerItemsIn([containerMC,text]);
		}
	}
}
