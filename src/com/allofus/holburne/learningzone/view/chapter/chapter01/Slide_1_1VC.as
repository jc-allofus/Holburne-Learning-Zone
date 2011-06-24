package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter1.Chap1IntroImage;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_1_1VC extends IntroductionSlide
	{
		
		public function Slide_1_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Byam Family</p>"
			+	"<p class='imageCaption'>Thomas Gainsborough (1727-1788)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1762-66</p>"
			+	"<p class='imageCaption'>238.5 x 229.7 cm</p>"
			+	"<p class='imageCaption'>On long-term loan from the Andrew Brownswood Arts Foundation</p>"
			+	"<p class='imageCaption'>1.2001.1</p>";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap1IntroImage(0,0)), caption);
			addChild(img);
			
			var title:String ="INTRODUCTION";
			var description:String = 
				"<p class='justified'>This life-size portrait is one of the most ambitious paintings made during Gainsborough’s sixteen years in Bath.  Gainsborough rented one of the most expensive houses in town, opposite the Abbey, with a spacious studio where visitors to Bath could come to be recorded in their fashionable finery.</p>"
			+	"<p></p>"
			+	"<p class='justified'>George Byam, a plantation owner from Antigua, paid 100 guineas for this portrait of himself and his new wife.  A few years later Gainsborough added their daughter Selina and at the same time changed the colour of Mrs Byam's dress from pink to a more up-to-date shade of blue.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
		
	}
}
