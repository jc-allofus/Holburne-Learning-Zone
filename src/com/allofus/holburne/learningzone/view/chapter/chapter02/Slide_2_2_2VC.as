package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.chapter2.Img_2_2_2;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_2_2_2VC extends ImageAndTextSlide
	{
		
		public function Slide_2_2_2VC()
		{
			var caption:String = 
				"<p><span class='imageCaptionItalic'>The Peasant and the Birdnester</span><span class='imageCaption'>, 1568</span></p>"
			+	"<p class='imageCaption'>Pieter Bruegel the Elder </p>"
			+	"<p class='imageCaption'>Oil on panel, 59 x 68 cm</p>"
			+	"<p class='imageCaption'>Kunsthistorisches Museum, Vienna</p>";
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_2_2_2(0,0)), caption);
			addChild(img);
			
			
			var title:String ="The Family Workshop";
			var description:String = 
				"<p class='justified'>Artists often passed on their skills, tools and workshops to their sons, and the Bruegels were no exception.  They and their relatives worked as artists over many generations, beginning with Pieter the Elder’s in-laws (and teachers) Pieter Coecke Van Aelst and Mayken Verhulst.</p>"
			+	"<p></p>"
			+	"<p class='justified'>While Pieter Bruegel the Younger made a living copying his father, the more successful members of the family developed their own styles.  Pieter II had a particularly busy studio selling lots of paintings fairly cheaply.  His many apprentices included the great still-life painter Frans Snyders.</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
