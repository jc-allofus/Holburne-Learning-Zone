package com.allofus.holburne.learningzone.view.chapter.chapter07
{
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter7.Img_7_1;
	import com.holburne.learningzone.swc.chapter7.Slide_7_3_1;

	import flash.display.Bitmap;

	/**
	 * COPY AND PASTE THIS BADBOY TO SETUP A NEW HOTSPOT SLIDE
	 * 
	 * 
	 * 
	 * @author jc
	 */
	public class Slide_7_3_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_7_3_1; //make reference to mc from compiled swc

		public function Slide_7_3_1VC()
		{

			containerMC = new Slide_7_3_1();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'>The Entombment</p>"
			+	"<p class='imageCaption'>Giovanni Francesco Romanelli (1610-1662)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1638 </p>"
			+	"<p class='imageCaption'>68.6 x 53.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A135</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_7_1(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			var str1:String = "<p class='popupPanelTitle'>Joseph</p><p>A rich man of Arimathaea ... who also himself was Jesus' disciple.</p>";
			var str2:String = "<p class='popupPanelTitle'>John</p><p>The disciple whom Jesus loved.</p>";
			var str3:String = "<p class='popupPanelTitle'>Mary Magdalene</p><p>out of whom he had cast seven devils</p>";
			var str4:String = "<p class='popupPanelTitle'>Jesus</p><p>the Christ, the Son of the living God</p>";
			var str5:String = "<p class='popupPanelTitle'>Mary</p><p>The mother of Jesus</p>";
			var str6:String = "<p class='popupPanelTitle'>An angel</p><p></p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4)),
				new HotspotButtonVO(containerMC.t5, new PopupPanelVO(str5)),
				new HotspotButtonVO(containerMC.t6, new PopupPanelVO(str6))
			];
			
			var title:String ="Who’s who";
			//var description:String = "<p class='justified'>lorem ipsum...</p>";
			text = new TextBoxWithTitleAndDescription(title, "");
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
