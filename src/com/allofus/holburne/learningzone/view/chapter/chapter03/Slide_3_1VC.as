package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter3.Chap3IntroImage;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_3_1VC extends IntroductionSlide
	{
		public function Slide_3_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>Self Portrait</p>"
			+	"<p class='imageCaption'>Thomas Barker (1769-1847)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1794</p>"
			+	"<p class='imageCaption'>78.7 x 64.6 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A102</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap3IntroImage(0,0)), caption);
			addChild(img);
			
			var title:String ="INTRODUCTION";
			var description:String = 
				"<p class='justified'>Benjamin Barker and his family settled in Bath in 1783.  His sons Thomas, Benjamin and Joseph were trained as landscape painters.  Thomas soon showed a precocious artistic talent, nurtured by the coachbuilder Charles Spackman who sent him to Italy to study in the early 1790s.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Thomas probably made this self portrait shortly after his return from Italy.  The confident young artist’s portrait is full of allusions to the past: on his easel is a view of the Temple of Vesta above the waterfall at Tivoli, a reference to his recent travels around Rome.  The pose with one hand on the hip, fashionably long hair and rich ochre coat are borrowed from the seventeenth-century master Van Dyck.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
