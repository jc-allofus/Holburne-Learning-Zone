package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter2.Chap2IntroImage;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_2_1VC extends IntroductionSlide
	{
		public function Slide_2_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Visit of the Godfather</p>"
			+	"<p class='imageCaption'>Pieter Bruegel the Younger (1565-1638)</p>"
			+	"<p class='imageCaption'>Oil on panel</p>"
			+	"<p class='imageCaption'>36.5 x 49.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne, A46</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap2IntroImage(0,0)), caption);
			addChild(img);
			
			var title:String ="Introduction";
			var description:String = 
				"<p class='justified'>The Bruegel family of Antwerp produced four generations of artists.  The dynasty’s founder was Pieter Bruegel the Elder, whose scenes of peasant life, religious subjects and landscapes are greatly loved.  His humorous depictions of country folk usually have a moralising message, sometimes illustrating traditional proverbs.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Bruegel’s son Pieter ran a busy studio that mostly produced copies or imitations of Pieter the Elder’s compositions.  This version of Visit of the Godfather (also known as Visit to the Farm) is based on an original that appears to be lost, but Pieter the Younger made many versions of it.  It depicts a busy farmhouse kitchen packed with detail.  An elegant couple are welcomed into the house by the farmer, who is their tenant.  The landlord’s wife is giving coins to the farmer’s son.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
