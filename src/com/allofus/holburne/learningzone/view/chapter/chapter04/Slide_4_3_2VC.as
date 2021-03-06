package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter4.Chap4IntroImage;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_2_1;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_2_2;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_2_3;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_2_4;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_2_5;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_2_6;
	import com.holburne.learningzone.swc.chapter4.Img_4_3_2_7;
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
			
			var caption:String = 
				"<p class='imageCaptionItalic'>Still Life with Shellfish and Fruit</p>"
			+	"<p class='imageCaption'>follower of Abraham van Beyeren (about 1620-1690) </p>"
			+	"<p class='imageCaption'>Oil on canvas, 1660s</p>"
			+	"<p class='imageCaption'>87.8 x 104.2 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A15</p>"
			;
			
			//var str1:String = "<p class='popupPanelTitle'></p><p></p>";
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap4IntroImage(0,0)), caption);
			addChild(img);
			
			var str1:String = "<p class='popupPanelTitle'>Chinese porcelain dish</p><p></p>";
			var str2:String = "<p class='popupPanelTitle'>Silver Ewer</p>";
			var str3:String = "<p class='popupPanelTitle'>Cover to the silver gilt cup</p><p>Decorated with a figure with a lance.</p>";
			var str4:String = "<p class='popupPanelTitle'>Pocket watch</p><p>The artist has included a time-piece as a reminder that all the riches of nature and art will pass away</p>";
			var str5:String = "<p class='popupPanelTitle'>Roemer</p><p>Roemer Traditional Netherlandish style of drinking glass</p>";
			var str6:String = "<p class='popupPanelTitle'>Silver gilt cup</p><p>A German parcel-gilt silver cup, probably made in Nuremberg.  Its cover is lying on the table to the left.</p>";
			var str7:String = "<p class='popupPanelTitle'>Parrot</p><p>Exotic pets imported from the southern hemisphere were an important status symbol.</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1, Img_4_3_2_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2, Img_4_3_2_2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3, Img_4_3_2_3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4, Img_4_3_2_4)),
				new HotspotButtonVO(containerMC.t5, new PopupPanelVO(str5, Img_4_3_2_5)),
				new HotspotButtonVO(containerMC.t6, new PopupPanelVO(str6, Img_4_3_2_6)),
				new HotspotButtonVO(containerMC.t7, new PopupPanelVO(str7, Img_4_3_2_7))
			];
			
			var title:String ="Treasures of the Banquet Table";
			var description:String = 
				"<p class='justified'>Extravagant still lifes such as this one display the wealth of goods available in the prosperous Northern Netherlands in the seventeenth century. As well as celebrating this embarassment of riches, Dutch still lifes also often suggest the transience of such wealth. Touch the picture to find out more.</p>"
				;
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
			staggerItemsIn(containerMC,text);
		}
	}
}
