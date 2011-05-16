package com.allofus.holburne.learningzone.view.chapter.chapter09
{
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter9.Img_9_1;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_2_1;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_2_2;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_2_3;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_2_4;
	import com.holburne.learningzone.swc.chapter9.Slide_9_3_2;

	import flash.display.Bitmap;

	/**
	 * COPY AND PASTE THIS BADBOY TO SETUP A NEW HOTSPOT SLIDE
	 * 
	 * 
	 * 
	 * @author jc
	 */
	public class Slide_9_3_2VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_9_3_2; //make reference to mc from compiled swc

		public function Slide_9_3_2VC()
		{

			containerMC = new Slide_9_3_2();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'>David Garrick as Jaffier and Susannah Cibber as Belvidera in ‘Venice Preserv’d’</p>"
			+	"<p class='imageCaption'>Johann Zoffany (1733-1810)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1764</p>"
			+	"<p class='imageCaption'>101.5 x 127 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Somerset Maugham Collection, 2011</p>"
			+	"<p class='imageCaption'>Acc no TBC</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_9_1(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			var str1:String = "<p>Oil lamp – indicates a scene set at night</p>";
			var str2:String = "<p>Contemporary dress suitable for a  nobleman</p>";
			var str3:String = "<p>This scene is set in the ‘Senate House’ within the Doge’s Palace in Venice.  Garrick’s well-travelled audience would have been familiar with the view from the molo, the landing-stage outside the palace.  The painted scenery represents the famous view across the Lagoon to the Palladian church of San Giorgio Maggiore.  Moonlight adds atmosphere to the tragedy.</p>";
			var str4:String = "<p>Contemporary dress suitable for a married lady: dark silk gown, white lace, gauze scarf, pearls, lace cap.</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1, Img_9_3_2_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2, Img_9_3_2_2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3, Img_9_3_2_3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4, Img_9_3_2_4))
			];
			
			var title:String ="Costume, Scenery, Props";
			var description:String = "";
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
