package com.allofus.holburne.learningzone.view.chapter.chapter09
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_3;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_9_3_3VC extends ImageAndTextSlide
	{

		public function Slide_9_3_3VC()
		{
			var caption:String = 
				"<p><span class='imageCaptionItalic'>Thomas Gainsborough (1727-1788)</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>David Garrick</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1770-71</p>"
			+	"<p class='imageCaption'>81.5 x 76 cm</p>"
			+	"<p class='imageCaption'>Private Collection</p>";
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_9_3_3(0,0)), caption);
			addChild(img);
			
			
			var title:String ="David Garrick(1717-1779)";
			var description:String = 
				"<p class='justified'>Actor, manager and writer David Garrick (1717–1779) transformed the art and profession of the actor.  Brought up in Lichfield, he arrived in London with his schoolmaster Samuel Johnson and set up as a wine merchant with his brother.</p>"
				;
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
