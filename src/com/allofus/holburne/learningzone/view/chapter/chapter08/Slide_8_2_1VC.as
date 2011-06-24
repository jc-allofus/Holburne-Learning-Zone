package com.allofus.holburne.learningzone.view.chapter.chapter08
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter8.Img_8_1;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_8_2_1VC extends ImageAndTextSlide
	{

		public function Slide_8_2_1VC()
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
			
			var title:String ="Michele Rocca (1666-1751)";
			var description:String = "<p class='justified'>Rocca worked in Rome, but was known as ‘Il Parmigiano’ because he was born and studied in Parma.  There he was influenced by the graceful and light-hearted style and rich colours of his great sixteenth-century predecessor Correggio.  In Rome he made his name as a painter of small-scale mythological and religious subjects before moving to Venice from around 1730.</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
