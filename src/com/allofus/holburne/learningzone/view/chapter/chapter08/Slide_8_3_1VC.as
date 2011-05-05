package com.allofus.holburne.learningzone.view.chapter.chapter08
{
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter8.Img_8_1;
	import com.holburne.learningzone.swc.chapter8.Slide_8_3_1;

	import flash.display.Bitmap;
	/**
	 * COPY AND PASTE THIS BADBOY TO SETUP A NEW HOTSPOT SLIDE
	 * 
	 * 
	 * 
	 * @author jc
	 */
	public class Slide_8_3_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_8_3_1;

		public function Slide_8_3_1VC()
		{

			containerMC = new Slide_8_3_1();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'>The Mask of Truth</p>"
			+	"<p class='imageCaption'>Michele Rocca (about 1670 - about 1751)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1720</p>"
			+	"<p class='imageCaption'>48.1 x 63.3 cm</p>"
			+	"<p class='imageCaption'>Gift of Professor Wickstead, 1924</p>"
			+	"<p class='imageCaption'>A310</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_8_1(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			
			pins = new Vector.<HotspotPin>();
			var str1:String = "<p>Virgil, Roman poet and legendary sage</p>";
			var str2:String = "<p>A young wife accused of adultery</p>";
			var str3:String = "<p>Virgil’s magic lie-detector, the Mask of Truth.  If you have told a lie, it bites off your hand.</p>";
			var str4:String = "<p>A jealous older husband</p>";
			var str5:String = "<p>Roman soldier, in charge of law and order</p>";
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO(str3)),
				new HotspotPinVO(containerMC.t4, new PopupPanelVO(str4)),
				new HotspotPinVO(containerMC.t5, new PopupPanelVO(str5))
			];
			
			var title:String ="Who’s Who?";
			var description:String = "<p class='justified'>Tap on the pins on the image to find out more about the characters in this painting.</p>";
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