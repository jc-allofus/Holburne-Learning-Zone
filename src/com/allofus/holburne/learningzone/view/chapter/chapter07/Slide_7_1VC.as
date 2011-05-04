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
			
			var title:String ="INTRODUCTION";
			var description:String = 
				"<p class='justified'>Romanelli produced a series of jewel-like cabinet paintings, often painted on copper, during the late 1630s.  At the time he was working at the Palazzo Barberini in Rome with his master Pietro da Cortona.  These little paintings have simple classical forms and bright, pure colours, as seen in the ultramarine and ochre cloaks of the women in this <span class='copyItalic'>Entombment</span>.</p>"
			+	"<p></p>"
			+	"<p class='justified'>The dominant figure in this scene is the bloodless body of the dead Christ, as it is wrapped in a white linen sheet by the young disciples John and Mary Magdalene.  Nearby, Joseph of Arimathaea prepares a stone tomb, while Jesus’s mother Mary stands contemplating her son’s body.  A plump pink angel holds up the contrasting greyish arm of Jesus, pointing to the wounds in his hands.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
