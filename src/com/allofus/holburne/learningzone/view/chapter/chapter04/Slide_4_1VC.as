package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter4.Chap4IntroImage;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_4_1VC extends IntroductionSlide
	{
		public function Slide_4_1VC()
		{
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
			
			var title:String ="Introduction";
			var description:String = 
				"<p class='justified'>This sumptuous banquet table, which once hung in Sir William Holburne’s dining room, has recently been cleaned and repaired.  The composition is particularly rich in detail, and cleaning has revealed a silver ewer, a crab, oysters, a pomegranate and a pocket-watch.  The watch is a reminder that all earthly delights, fruit, food, even fine ceramics and glass, eventually pass away.</p>"
				;
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
