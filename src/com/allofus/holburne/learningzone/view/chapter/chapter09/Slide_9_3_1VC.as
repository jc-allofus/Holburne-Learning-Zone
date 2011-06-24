package com.allofus.holburne.learningzone.view.chapter.chapter09
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter9.Img_9_1;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_1_1;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_1_2;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_1_3;
	import com.holburne.learningzone.swc.chapter9.Slide_9_3_1;

	import flash.display.Bitmap;

	/**
	 * COPY AND PASTE THIS BADBOY TO SETUP A NEW HOTSPOT SLIDE
	 * 
	 * 
	 * 
	 * @author jc
	 */
	public class Slide_9_3_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_9_3_1; //make reference to mc from compiled swc

		public function Slide_9_3_1VC()
		{

			containerMC = new Slide_9_3_1();
			
			
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
			
			var str1:String = "<p>Jaffier, a Venetian nobleman [David Garrick, actor playwright and theatre manager]. Zoffany painted at least three other versions of the painting. The main difference between them is the material of Garrick's waistcoat.</p>";
			var str2:String = "<p>Belvidera, a Venetian Senator’s daughter, wife of Jaffier [Susannah Cibber, singer and actress]. Although the play was written 80 years earlier she is shown in contemporary clothes.</p>";
			var str3:String = "<p>The mouth of the Grand Canal, Venice. The scene is set outside the Doge's Palace and the painted scenery represents the famous view across the Lagoon to the Palladian church of San Giorgio Maggiore.  Moonlight adds atmosphere to the tragedy [Theatre Royal, Drury Lane, London]</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1, Img_9_3_1_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2, Img_9_3_1_2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3, Img_9_3_1_3))
			];
			
			var title:String ="Whats going on?";
			var description:String = "<p class='justified'>Venice Preserv'd was a byword for Tragedy in the eighteenth century. The scene is one of the most dramatic: the Venetian nobleman Jaffier's wife has persuaded himn to betray his friend and condemn him to the gallows. Driven to despair, Jaffier threatens to kill his wife and himself.</p>"
			;
			text = new TextBoxWithTitleAndDescription(title, description);
			text.alpha = 0;
			addChild(text);
			
			super();
			text.y = AppGlobals.RIGHT_FRAME_Y;
			img.showCaption(false);
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(img,text); 
		}
			
	}
}
