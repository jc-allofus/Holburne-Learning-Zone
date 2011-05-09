package com.allofus.holburne.learningzone.view.chapter.chapter10
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;

	import flash.display.Bitmap;
	import flash.display.BitmapData;

	/**
	 * @author jc
	 */
	public class Slide_10_2_1VC extends ImageAndTextSlide
	{

		public function Slide_10_2_1VC()
		{
			var caption:String = 
				"<p><span class='imageCaptionItalic'>Self Portrait</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Arthur Devis (1712-1787)</p>"
			+	"<p class='imageCaption'>oil on panel, about 1742-1744</p>"
			+	"<p class='imageCaption'>9 x 6.5 cm</p>"
			+	"<p class='imageCaption'>National Portrait Gallery</p>";
			img = new ImageWithBorderAndCaption(new Bitmap(new BitmapData(610,10)), caption);
			addChild(img);
			
			
			var title:String ="Arthur Devis (1712-1787)";
			var description:String = "<p class='justified'>Arthur Devis belonged to a family of painters from Preston in Lancashire. By 1742, he had his own studio in London, where he specialised in small-scale informal group portraits, known as conversation pieces. Mostly portraits of country gentry, these paintings are a fascinating record of Georgian domestic life, fashion, and manners.  His portraits often tell us about his sitters by using gestures and objects to indicate family relationships and personal and professional interests. From the late 1740s Devis developed a more sophisticated style of composition and a more individual approach to the people he painted.  He also preferred to place them out of doors in a landscape, recalling his early training as a painter of views.  Despite these gradual changes, Devis’s style soon fell out of fashion and he supplemented his income by restoring and repairing paintings, before retiring to Brighton.</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
