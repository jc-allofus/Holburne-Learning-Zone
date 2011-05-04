package com.allofus.holburne.learningzone.view.chapter.chapter08
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter8.Img_8_1;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_8_1VC extends IntroductionSlide
	{
		public function Slide_8_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Mask of Truth</p>"
			+	"<p class='imageCaption'>Michele Rocca (about 1670 - about 1751)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1720</p>"
			+	"<p class='imageCaption'>48.1 x 63.3 cm</p>"
			+	"<p class='imageCaption'>Gift of Professor Wickstead, 1924</p>"
			+	"<p class='imageCaption'>A310</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_8_1(0,0)), caption);
			addChild(img);
			
			var title:String ="INTRODUCTION";
			var description:String = 
				"<p class='justified'>The <span class='copyItalic'>Bocca della Verità</span> (the ‘Mouth of Truth’) is an ancient drain-cover in Rome carved into a moon-like face.  Its mouth and eyes are gaping holes.  It is said that anyone guilty of lying who dares to place their hand inside will have their hand bitten off.  A medieval legend tells that the Mask was invented by the poet and sage Virgil as a sort of public lie-detector.  This eighteenth-century Roman cabinet-painting tells the story of how Virgil’s machine was foiled by an adulterous young wife.</p>"
			+	"<p></p>"
			+	"<p class='justified'>The artist has captured the moment of suspense as the crowd watches the girl climb the steps to place her hand in the open mouth.  Her grey-haired husband’s eyes bulge with the intensity of his gaze.  Even the sculpted figures reclining above the mask are paying attention.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
