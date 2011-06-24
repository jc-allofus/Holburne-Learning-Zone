package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter4.Chap4IntroImage;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_1;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_10;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_11;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_12;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_2;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_3;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_4;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_5;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_6;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_7;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_8;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_1_9;
	import com.holburne.learningzone.swc.chapter4.Slide_4_3_1;

	import flash.display.Bitmap;


	/**
	 * @author jc
	 */
	public class Slide_4_3_1VC extends SingleImageWithHotspotsSlide
	{
		
		protected var containerMC:Slide_4_3_1;
		
		public function Slide_4_3_1VC()
		{
			containerMC = new Slide_4_3_1();
			
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
			
			var str1:String = "<p class='popupPanelTitle'>Orange</p>";
			var str2:String = "<p class='popupPanelTitle'>White peach</p>";
			var str3:String = "<p class='popupPanelTitle'>White grapes</p>";
			var str4:String = "<p class='popupPanelTitle'>Oyster</p>";
			var str5:String = "<p class='popupPanelTitle'>Red grapes</p>";
			var str6:String = "<p class='popupPanelTitle'>Bread roll</p>";
			var str7:String = "<p class='popupPanelTitle'>Pear</p>";
			var str8:String = "<p class='popupPanelTitle'>Black grapes</p>";
			var str9:String = "<p class='popupPanelTitle'>Crab</p>";
			var str10:String = "<p class='popupPanelTitle'>Apricots</p>";
			var str11:String = "<p class='popupPanelTitle'>Pomegranate</p>";
			var str12:String = "<p class='popupPanelTitle'>Hazel nuts</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1, Img_4_3_1_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2, Img_4_3_1_2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3, Img_4_3_1_3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4, Img_4_3_1_4)),
				new HotspotButtonVO(containerMC.t5, new PopupPanelVO(str5, Img_4_3_1_5)),
				new HotspotButtonVO(containerMC.t6, new PopupPanelVO(str6, Img_4_3_1_6)),
				new HotspotButtonVO(containerMC.t7, new PopupPanelVO(str7, Img_4_3_1_7)),
				new HotspotButtonVO(containerMC.t8, new PopupPanelVO(str8, Img_4_3_1_8)),
				new HotspotButtonVO(containerMC.t9, new PopupPanelVO(str9, Img_4_3_1_9)),
				new HotspotButtonVO(containerMC.t10, new PopupPanelVO(str10, Img_4_3_1_10)),
				new HotspotButtonVO(containerMC.t11, new PopupPanelVO(str11, Img_4_3_1_11)),
				new HotspotButtonVO(containerMC.t12, new PopupPanelVO(str12, Img_4_3_1_12))
			];
			
			var title:String ="What’s on the menu?";
			var description:String = 
				"<p class='justified'>How many different types of fruit and other food can you see?</p>"
			+	"<p></p>"
			+	"<p class='justified'>How many can you find in 60 seconds?</p>";
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
			staggerItemsIn(containerMC,text);
		}
	}
}
