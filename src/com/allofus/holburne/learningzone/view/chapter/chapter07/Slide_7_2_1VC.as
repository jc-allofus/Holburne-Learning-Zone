package com.allofus.holburne.learningzone.view.chapter.chapter07
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter7.Img_7_1;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_7_2_1VC extends ImageAndTextSlide
	{
		public function Slide_7_2_1VC()
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
			img.alpha = 0;
			addChild(img);
			
			var title:String ="Giovanni Francesco Romanelli (1610-1662)";
			var description:String = "<p class='justified'>Romanelli trained in Rome under Domenichino (1581-1641).  Through most of the 1630s he assisted Pietro da Cortona (1596-1669) on a series of wall and ceiling paintings in the Palazzo Barberini, Rome.  Here he came to the attention of Pope Urban VIII, a member of the Barberini family, who commissioned several important works for the Vatican while Romanelli was still in his twenties.  Although he quickly became an influential figure in Rome, he fell from favour after Pope Urban’s death.  In 1646 he moved to Paris to work for Cardinal Mazarin, the Queen Regent’s influential adviser.  He returned to Rome after two years but was soon back in Paris decorating the Louvre palace for the Queen.  Romanelli eventually retired to his native Viterbo.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			super.staggerItemsIn(img,text);
		}
	}
}
