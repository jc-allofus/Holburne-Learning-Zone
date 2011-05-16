package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter4.Chap4IntroImage;
	import com.holburne.learningzone.swc.chapter4.Slide_4_3_3;

	import flash.display.Bitmap;


	/**
	 * @author jc
	 */
	public class Slide_4_3_3VC extends SingleImageWithHotspotsSlide
	{
		
		protected var containerMC:Slide_4_3_3;
		
		public function Slide_4_3_3VC()
		{
			containerMC = new Slide_4_3_3();
			
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
			
			var str1:String = "<p>A previous restorer covered up this little parrot.  We think it must have been hidden when the canvas was cut down to fit a new frame, taking the parrot’s head with it.  We decided to keep the parrot visible, even though its head has been lost.</p>";
			var str2:String = "<p>We thought these white lines were scratches in the paint.  The conservator realised they had been painted deliberately to form the rim of a very tall, fluted glass.  You can see the foot of the glass to the right of the silver ewer.</p>";
			var str3:String = "<p>This silver vessel was so yellow that it looked more like gold. </p>";
			var str4:String = "<p>The artist’s reflection in the polished silver.</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4))
			];
			
			var title:String ="Secrets: what we discovered when we cleaned the painting";
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
			staggerItemsIn(containerMC,text);
		}
	}
}
