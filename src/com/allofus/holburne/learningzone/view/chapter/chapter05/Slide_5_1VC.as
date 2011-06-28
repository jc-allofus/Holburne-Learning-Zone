package com.allofus.holburne.learningzone.view.chapter.chapter05
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter5.Chap5IntroImage;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_5_1VC extends IntroductionSlide
	{
		public function Slide_5_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Temptation of St Anthony</p>"
			+	"<p class='imageCaption'>Jan van der Venne (active 1616, died before 1651)</p>"
			+	"<p class='imageCaption'>Oil on panel</p>"
			+	"<p class='imageCaption'>53.1 x 73.7 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A35</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap5IntroImage(0,0)), caption);
			addChild(img);
			
			var title:String ="Introduction";
			var description:String = 
				"<p class='justified'>This teeming scene, with its crowd of grotesque monsters shows the 3rd-century Saint Anthony tormented by demons in the desert. The swirling shrieking movement of the gang of fiends is contrasted with the peaceful rock-like silence of the praying hermit.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Jan van der Venne of Brussels painted low-life scenes, specialising in gypsy encampments and images of old people.  Here he uses a favourite religious subject, the temptation of St Anthony, as an excuse to invent some spectacularly hideous monsters.</p>"
			;
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
