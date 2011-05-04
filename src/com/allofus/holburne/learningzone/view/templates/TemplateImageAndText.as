package com.allofus.holburne.learningzone.view.templates
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;

	import flash.display.Bitmap;
	import flash.display.BitmapData;

	/**
	 * @author jc
	 */
	public class TemplateImageAndText extends ImageAndTextSlide
	{

		public function TemplateImageAndText()
		{
			var caption:String = 
				"<p><span class='imageCaptionItalic'>title</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>descline1</p>"
			+	"<p class='imageCaption'>descline2</p>"
			+	"<p class='imageCaption'>descline3</p>";
			img = new ImageWithBorderAndCaption(new Bitmap(new BitmapData(0,0)), caption);
			addChild(img);
			
			
			var title:String ="title";
			var description:String = 
				"<p class='justified'>copyp1</p>"
			+	"<p></p>"
			+	"<p class='justified'>copyp2</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
