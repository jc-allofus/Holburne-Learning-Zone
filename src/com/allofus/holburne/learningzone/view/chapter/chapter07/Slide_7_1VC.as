package com.allofus.holburne.learningzone.view.chapter.chapter07
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter7.Img_7_1;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_7_1VC extends IntroductionSlide
	{
		public function Slide_7_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Entombment</p>"
			+	"<p class='imageCaption'>Giovanni Francesco Romanelli (1610-1662)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1638 </p>"
			+	"<p class='imageCaption'>68.6 x 53.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A135</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_7_1(0,0)), caption);
			addChild(img);
			
			var title:String ="Introduction";
			var description:String = 
				"<p class='justified'>The dominant figure in this scene is the bloodless body of the dead Christ, as it is wrapped in a white linen sheet by the young disciples John and Mary Magdalene.  Nearby, Joseph of Arimathaea prepares a stone tomb, while Jesus’s mother Mary stands contemplating her son’s body.  A plump pink angel holds up the contrasting greyish arm of Jesus, pointing to the wound in his hand.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Romanelli produced a number of similar small jewel-like paintings during the late 1630s while working in Rome with Pietro da Cortona.  They have simple classical forms and bright, pure colours.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
