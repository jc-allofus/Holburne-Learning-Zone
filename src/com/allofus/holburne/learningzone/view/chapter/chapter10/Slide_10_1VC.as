package com.allofus.holburne.learningzone.view.chapter.chapter10
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.IntroductionSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter10.Img_10_1;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_10_1VC extends IntroductionSlide
	{
		public function Slide_10_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>Alicia and Jane Clarke</p>"
			+	"<p class='imageCaption'>Arthur Devis (1712-1787)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1758</p>"
			+	"<p class='imageCaption'>91.5 x 71 cm</p>"
			+	"<p class='imageCaption'>Accepted by HM Government in Lieu of Inheritance Tax and allocated to the Holburne Museum of Art, 2007</p>"
			+	"<p class='imageCaption'>2007.2</p>"
			;
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_10_1(0,0)), caption);
			addChild(img);
			
			var title:String ="Introduction";
			var description:String = 
				"<p class='justified'>Arthur Devis is one of the best-known painters of a new type of portrait that appeared during the eighteenth century.  ‘Conversation Pieces’ were small-scale informal portraits of groups of people.  They depicted a family or friends in stylised representations of their homes or in idealised landscapes.  Devis’s portraits of country gentry are a fascinating record of Georgian domestic life, fashion, and manners.</p>"
			+	"<p></p>"
			+	"<p class='justified'>This image of the middle-aged Clarke sisters of Walford Court, Ross-on-Wye, is particularly unusual as it depicts women as landowners.  They inherited their estate from John Kyrle, a distant cousin and close neighbour who was famous for helping good causes.  The landscape probably shows the grounds of Hill Court, which the sisters also owned.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
	}
}
