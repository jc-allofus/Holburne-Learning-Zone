package com.allofus.holburne.learningzone.view.chapter.chapter07
{
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter7.Img_7_1;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_1_1;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_1_2;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_1_3;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_1_4;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_1_5;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_1_6;
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
			
			var str1:String = "<p class='popupPanelTitle'>Joseph</p><p>Joseph is described in the Gospels as 'a rich man of Arimathaea' who asked Pontius Pilate for the dead body of Christ in order to bury him.</p>";
			var str2:String = "<p class='popupPanelTitle'>St. John</p><p>St John or 'the disciple whom Jesus loved' is the only disciple described as being present at the Crucifixion in the Gospels.</p>";
			var str3:String = "<p class='popupPanelTitle'>Mary</p><p>Jesus's mother is shown as the model of compassion (litearally 'suffering with').</p>";
			var str4:String = "<p class='popupPanelTitle'>An angel</p><p>An angel transforms the painting from a simple narrative to a timeless devotional image. He draws the viewer's attention to the nail hole in Christ's hand.</p>";
			var str5:String = "<p class='popupPanelTitle'>Jesus</p><p>The dead Christ. Although the wounds of the crucifixion are visible, the painting does not emphasise the physical suffering of Christ.</p>";
			var str6:String = "<p class='popupPanelTitle'>Mary Magdalene</p><p>Mary Magdalene is traditionally shown in images of the Crucifixion and Entombment. Although she is often shown displaying the extremes of grief, here she shares the contemplative calm of the painting.</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1, Img_7_3_1_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2, Img_7_3_1_2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3, Img_7_3_1_3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4, Img_7_3_1_4)),
				new HotspotButtonVO(containerMC.t5, new PopupPanelVO(str5, Img_7_3_1_5)),
				new HotspotButtonVO(containerMC.t6, new PopupPanelVO(str6, Img_7_3_1_6))
			];
			
			var title:String ="The Subject";
			var body:String = "<p class='justified'>Romanelli's painting combines two episodes in the Easter story: Christ's body has been taken down from the cross and is now being prepared for burial.  The surrounding figures, like the viewer of the painting, contemplate the dead body.</p>";
			text = new TextBoxWithTitleAndDescription(title, body);
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
