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
			
			var title:String ="INTRODUCTION";
			var description:String = 
				"<p class='justified'>Jan van der Venne of Brussels painted low-life scenes, specialising in gypsy encampments and images of old people.  Here he uses a favourite religious subject, the temptation of St Anthony, as an excuse to invent some spectacularly hideous monsters.  </p>"
			+	"<p></p>"
			+	"<p class='justified'>St Anthony the Great is revered throughout Christianity as the leader of a community of hermits that grew up in the Egyptian desert in the first few centuries after Christ.  The artist shows St Anthony kneeling at the door of his cave attended by his faithful pig.  He is tempted to the sins of the flesh by a beckoning blonde wrapped in soft satin, while Avarice rattles a bulging purse.  Spiritual troubles swarm on him in the form of visionary demons flaunting some delightfully gruesome details.</p>"
			+	"<p></p>"
			+	"<p class='justified'>The artist contrasts the swirling, shrieking movement of the gang of fiends with the peaceful rock-like silence of the hermit kneeling in prayer.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
