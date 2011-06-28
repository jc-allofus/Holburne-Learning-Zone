package com.allofus.holburne.learningzone.view.chapter.chapter05
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter5.Img_5_2_1;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_5_2_1VC extends ImageAndTextSlide
	{

		public function Slide_5_2_1VC()
		{
			var caption:String = 
				"<p><span class='imageCaptionItalic'>The Temptation of St Anthony</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Jan van der Venne (active 1616, died before 1651)</p>"
			+	"<p class='imageCaption'>Oil on panel, between 1625 and 1649</p>"
			+	"<p class='imageCaption'>72 x 105 cm</p>"
			+	"<p class='imageCaption'>Museum Catharijneconvent, Utrecht</p>";
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_5_2_1(0,0)), caption);
			addChild(img);
			
			
			var title:String ="Jan van der Venne";
			var description:String = 
				"<p class='justified'>The artist of this painting has only recently emerged from the shadows.  Jan van der Venne (active by 1616, died before 1651) has been confused with the more famous Adriaen van de Venne (1589-1662), a painter and of allegories and portraits, and Adriaen’s brother Jan, a publisher.  The van de Vennes were based in Middelburg in Zeeland and later in The Hague, whereas the artist of this painting lived in Brussels. </p>"
			+	"<p></p>"
			+	"<p class='justified'>Van der Venne is especially noted for his choice of weird and exotic subject matter.  Old people were a favourite theme, and he produced many heads of quaint characters in profile, often bearded or wrapped in turbans.  Many relate closely to the old procuress in the Holburne’s painting, and to the profile of St Anthony himself.  On a larger scale, he painted several scenes in desert encampments with mysterious characters grouped round rocks or a fire.</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
