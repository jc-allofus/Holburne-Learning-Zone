package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter2.Chap2IntroImage;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_2_4_2VC extends ImageAndTextSlide
	{
		public function Slide_2_4_2VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Visit of the Godfather</p>"
			+	"<p class='imageCaption'>Pieter Brueghel the Younger (1565-1638)</p>"
			+	"<p class='imageCaption'>Oil on panel</p>"
			+	"<p class='imageCaption'>36.5 x 49.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne, A46</p>"
			;
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap2IntroImage(0,0)), caption);
			addChild(img);
			
			
			var title:String ="Work in Progress";
			var description:String = 
				"<p class='justified'>work in progress text here...</p>"
			+	"<p></p>"
			+	"<p class='justified'></p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
