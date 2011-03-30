package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter2.Chap2IntroImage;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_2_1VC extends IntroductionSlide
	{
		public function Slide_2_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Byam Family</p>"
			+	"<p class='imageCaption'>Thomas Gainsborough (1727-1788)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1762-66</p>"
			+	"<p class='imageCaption'>238.5 x 229.7 cm</p>"
			+	"<p class='imageCaption'>On long-term loan from the Andrew Brownswood Arts Foundation</p>"
			+	"<p class='imageCaption'>1.2001.1</p>";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap2IntroImage(0,0)), caption);
			addChild(img);
			
			var title:String ="INTRODUCTION";
			var description:String = 
				"<p class='justified'>This life-size view of a wealthy English family enjoying the countryside is one of the most ambitions paintings made during Thomas Gainsborough's sixteen years in Bath.  From 1759 to 1774 he rented one of the most expensive houses in the town, right opposite the Abbey and next to the Pump Room.  In had a spacious studio where visitors to the Spa could come to be recorded in their fashionable finery.</p>"
			+	"<p></p>"
			+	"<p class='justified'>George Byam, a plantation owner from Antigua, paid 100 guineas (over eight month's rent for the artist) for this portrait of himself and his new wife.  Gainsborough added their daughter Selina to the composition a few years later.  At the same time, Byam treated his wife to a re-painting of her dress from its original pink to a more up-to-date shade of blue.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}