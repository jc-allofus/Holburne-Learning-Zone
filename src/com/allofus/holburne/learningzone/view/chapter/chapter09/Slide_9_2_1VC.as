package com.allofus.holburne.learningzone.view.chapter.chapter09
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter9.Img_9_2_1;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_9_2_1VC extends ImageAndTextSlide
	{

		public function Slide_9_2_1VC()
		{
			var caption:String = 
				"<p><span class='imageCaptionItalic'>Self Portrait</span><span class='imageCaption'>, 1777-1778</span></p>"
			+	"<p class='imageCaption'>Johan Zoffany (1733-1810)</p>"
			+	"<p class='imageCaption'>Black chalk on paper, 30.5 x 28 cm</p>"
			+	"<p class='imageCaption'>© Trustees of the British Museum</p>";
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_9_2_1(0,0)), caption);
			addChild(img);
			
			
			var title:String ="Johan Zoffany (1733-1810)";
			var description:String = 
				"<p class='justified'>Johannes Zauffaly was born in Frankfurt and studied in Rome.  In 1760 he arrived in London, but at first work was hard to find until an encounter with the actor David Garrick changed his life.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Garrick, a great self-publicist, not only commissioned paintings of his family from Zoffany, but also a remarkable series of portraits of himself in various theatrical roles, complete with fellow cast members and stage sets.  The success of these allowed Zoffany to set up his own studio.  He was soon painting members of the aristocracy and was a favourite of King George III and Queen Charlotte.</p>"
			;
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
