package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.chapter2.Slide_2_3_2;
	import com.holburne.learningzone.swc.chapter2.Chap2IntroImage;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_2_3_2VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_2_3_2;
		
		public function Slide_2_3_2VC()
		{
			
			containerMC = new Slide_2_3_2();
			
			var caption:String = 
				"<p class='imageCaptionItalic'>The Visit of the Godfather</p>"
			+	"<p class='imageCaption'>Pieter Brueghel the Younger (1565-1638)</p>"
			+	"<p class='imageCaption'>Oil on panel</p>"
			+	"<p class='imageCaption'>36.5 x 49.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne, A46</p>";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap2IntroImage(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			
			pins = new Vector.<HotspotPin>();
			var str1:String = "<p class='popupPanelTitle'>Cheese</p><p>Maturing on a rack</p>";
			var str2:String = "<p class='popupPanelTitle'>Wool winders</p><p>To keep yarn tidy after spinning</p>";
			var str3:String = "<p class='popupPanelTitle'>Prints</p><p>Cheap woodcuts of holy pictures, prayers, sayings and calendars were often pinned or pasted to cottage walls or furniture.</p>";
			var str4:String = "<p class='popupPanelTitle'>Back pack</p><p>Soft sack attached to a wooden frame with shoulder straps.</p>";
			var str5:String = "<p class='popupPanelTitle'>Pap dish</p><p>Warm bread-and-milk for the little ones</p>";
			var str6:String = "<p class='popupPanelTitle'>Swaddling</p><p>Before nappies and babygrows, babies were tightly wrapped in linen bands.  This roll is ready to be wound round the baby after washing.</p>";
			var str7:String = "<p class='popupPanelTitle'>Infant feeder</p><p>A pottery sucking bottle for toddlers’ milk</p>";
			var str8:String = "<p class='popupPanelTitle'>Sugarloaf</p><p>Sugar had only recently been introduced to Europe, and was very expensive.  It was sold in large loaves which were cut into small lumps or pounded into powder for cooking.  It was a traditional gift for families with new babies.</p>";
			var str9:String = "<p class='popupPanelTitle'>Butter Churn</p><p>Cream is beaten until the fat particles join together to form a lump of butter.</p>";
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO(str3)),
				new HotspotPinVO(containerMC.t4, new PopupPanelVO(str4)),
				new HotspotPinVO(containerMC.t5, new PopupPanelVO(str5)),
				new HotspotPinVO(containerMC.t6, new PopupPanelVO(str6)),
				new HotspotPinVO(containerMC.t7, new PopupPanelVO(str7)),
				new HotspotPinVO(containerMC.t8, new PopupPanelVO(str8)),
				new HotspotPinVO(containerMC.t9, new PopupPanelVO(str9))
			];
			
			var title:String ="What are all those things?";
			var description:String = "<p class='justified'>Tap on the pins on the large image to find out more about the items in the scene.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			text.alpha = 0;
			addChild(text);
			
			super();
			
			img.showCaption(false);
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn([img,text]); 
		}
	}
}