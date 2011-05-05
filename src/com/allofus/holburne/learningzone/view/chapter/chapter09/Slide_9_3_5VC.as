package com.allofus.holburne.learningzone.view.chapter.chapter09
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_5;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_9_3_5VC extends ImageAndTextSlide
	{

		public function Slide_9_3_5VC()
		{
			var caption:String = 
//				"<p><span class='imageCaptionItalic'>title</span><span class='imageCaption'></span></p>"
				"<p class='imageCaption'>Somerset Maugham at the Villa Mauresque, Cap Ferrat, 1948</p>";
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_9_3_5(0,0)), caption);
			addChild(img);
			
			
			var title:String ="The Maugham Collection";
			var description:String = 
				"<p class='justified'>This is one of a handful of works by Zoffany once owned by the novelist and playwright William Somerset Maugham (1874–1965).  Maugham gave his collection of over eighty Georgian theatrical paintings to the National Theatre in 1951.  In 2010 they were transferred to the Holburne Museum and the Theatre Royal, Bath.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Maugham began his literary career as a novelist, but by 1907 he was a very successful writer of light comedies.  Towards the end of the First World War he was turning to more serious themes for his stage works and novels.  He started to collecting theatrical paintings (which in those days were very inexpensive) in 1912.  His second purchase was Zoffany’s Venice Preserv’d, which he bought from Christie’s for £29.  It had once belonged to the great actor Sir Henry Irving.</p>"
			+	"<p></p>"
			+	"<p class='justified'>The paintings he had picked up in the London salerooms gradually found their way to Maugham’s villa in the south of France, and over time the collection grew until it was ‘second only to that of the Garrick Club’.  Maugham decided that, rather than allow the collection to be dispersed at his death, he would leave it to the new National Theatre.  Sadly, the theatre proved not to be a secure enough home for the collection.  In 2010 it was transferred to Bath, where it is shared between the Holburne Museum and the Theatre Royal.</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
