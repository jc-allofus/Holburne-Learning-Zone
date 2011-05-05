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
				"<p class='justified'>Johannes Zauffaly was born in Frankfurt, the son of a cabinet-maker, and studied in Rome.  In 1760 he arrived in London, but at first work was hard to find.  He was a studio assistant until an encounter with the actor David Garrick changed his life.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Garrick, a great self-publicist, not only commissioned conversation pieces of himself and his family from Zoffany, but also a remarkable series of portraits of Garrick in various theatrical roles, complete with fellow cast members and stage sets.  The success of these, thanks in part to Garrick’s celebrity and the extraordinary acting skills that Zoffany was able to capture on canvas, allowed Zoffany to set up his own studio.  He was soon painting members of the aristocracy and their families.  One of these, the powerful Earl of Bute, introduced him to King George III and his Queen Charlotte.  The young Queen, a German princess, felt very much at home with her fellow countryman and he became her favoured artist for informal family portraits.  In 1772 she sent him to Florence, where he stayed for seven years and received many honours.</p>"
			+	"<p></p>"
			+	"<p class='justified'>On returning to London, he found he had fallen from fashion.  In an attempt to restore his fortunes, he travelled to India, knowing the demand for portraits among Bengal’s English families and officials as well as the Indian princes.  After five years, he returned to England with enough money saved for a comfortable retirement.</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
