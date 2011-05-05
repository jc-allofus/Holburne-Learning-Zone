package com.allofus.holburne.learningzone.view.chapter.chapter09
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter9.Img_9_1;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_9_1VC extends IntroductionSlide
	{
		public function Slide_9_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>David Garrick as Jaffier and Susannah Cibber as Belvidera in ‘Venice Preserv’d’</p>"
			+	"<p class='imageCaption'>Johann Zoffany (1733-1810)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1764</p>"
			+	"<p class='imageCaption'>101.5 x 127 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Somerset Maugham Collection, 2011</p>"
			+	"<p class='imageCaption'>Acc no TBC</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_9_1(0,0)), caption);
			addChild(img);
			
			var title:String ="INTRODUCTION";
			var description:String = 
				"<p class='justified'>This scene is from a 1762 production of Thomas Otway’s tragedy Venice Preserv’d, written in 1682.  It took place at London’s Drury Lane theatre, and the tragic hero Jaffier was played by the theatre’s manager David Garrick.  The role of Jaffier’s faithful wife was taken by Susannah Cibber, one of the most able singers and actresses of her time.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Zoffany records the scenery, costume and gestures exactly as he would have seen them on stage at Drury Lane.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
