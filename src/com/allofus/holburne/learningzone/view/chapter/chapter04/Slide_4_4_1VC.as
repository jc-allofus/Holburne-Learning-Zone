package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter4.Img_4_4;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_1_1;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_1_2;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_1_3;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_1_4;
	import com.holburne.learningzone.swc.chapter4.Slide_4_4_1;

	import flash.display.Bitmap;
	/**
	 * @author jc
	 */
	public class Slide_4_4_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_4_4_1; 

		public function Slide_4_4_1VC()
		{

			containerMC = new Slide_4_4_1();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'>Still Life with Shellfish and Fruit</p>"
			+	"<p class='imageCaption'>follower of Abraham van Beyeren (about 1620-1690) </p>"
			+	"<p class='imageCaption'>Oil on canvas, 1660s</p>"
			+	"<p class='imageCaption'>87.8 x 104.2 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A15</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_4_4(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			
			pins = new Vector.<HotspotPin>();
			var str1:String = "<p class='popupPanelTitle'>Details of damage to the frame</p><p>The whole surface of the frame is very dirty and the gilding is flaking off.</p>";
			var str2:String = "<p class='popupPanelTitle'>Details of damage to the frame</p><p>The whole surface of the frame is very dirty and the gilding is flaking off.</p>";
			var str3:String = "<p class='popupPanelTitle'>Detail of the largest tear</p><p>There is a large tear below the crab, lower right.</p>";
			var str4:String = "<p class='popupPanelTitle'>Detail of the painting partly cleaned.</p><p>The middle section has not yet been cleaned.  To either side, the colours are clean and fresh. In the middle, they are dull and yellow.</p>";
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO(str1,Img_4_4_1_1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO(str2,Img_4_4_1_2)),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO(str3,Img_4_4_1_3)),
				new HotspotPinVO(containerMC.t4, new PopupPanelVO(str4,Img_4_4_1_4))
			];
			
			var title:String ="The problem";
			var description:String = "<p class='justified'>The still life and its frame before conservation.</p>";
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
