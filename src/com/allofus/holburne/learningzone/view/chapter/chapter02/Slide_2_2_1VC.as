package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.chapter2.Img_2_2_1_1;
	import com.holburne.learningzone.chapter2.Img_2_2_1_2;
	import com.holburne.learningzone.chapter2.Img_2_2_1_3;
	import com.holburne.learningzone.chapter2.Img_2_2_1_4;
	import com.holburne.learningzone.chapter2.Img_2_2_1_5;
	import com.holburne.learningzone.chapter2.Img_2_2_1_6;
	import com.holburne.learningzone.chapter2.Slide_2_2_1;

	import mx.logging.ILogger;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_2_2_1VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_2_2_1;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function Slide_2_2_1VC()
		{
			containerMc = new Slide_2_2_1();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>The Painter and the Buyer</span><span class='imageCaption'>, c.1565</span></p>"
			+	"<p class='imageCaption'>Pieter Bruegel I</p>"
			+	"<p class='imageCaption'>Pen and black ink on brown paper, 25.5 x 21.5 cm</p>"
			+	"<p class='imageCaption'>Graphische Sammlung Albertina, Vienna</p>";
			var at01:String = "<p>The elder Bruegel was probably born in Breda and worked mainly in Antwerp.  Antwerp (now in Belgium) was a great trading city with a wealthy and discerning Imperial Court and an appreciative eye for his landscapes, religious paintings and scenes of everyday peasant life.  His landscape work was transformed by a journey over the Alps to the far south of Italy.  He was also influenced by Hieronymus Bosch.  Much-loved paintings include the <span class='copyItalic'>Tower of Babel, Netherlandish Proverbs</span> and <span class='copyItalic'>The Peasant Wedding</span>.</p> "	;
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_2_2_1_1, st01,at01);
			
			var st02:String = 
				"<p><span class='imageCaptionItalic'>Hunters in the Snow</span><span class='imageCaption'>, 1565</span></p>"
			+	"<p class='imageCaption'>Pieter Bruegel I</p>"
			+	"<p class='imageCaption'>Oil on panel, 117 x 162 cm</p>"
			+	"<p class='imageCaption'>Kunsthistorisches Museum, Vienna</p>";
			var at02:String = "<p>The elder Bruegel was probably born in Breda and worked mainly in Antwerp.  Antwerp (now in Belgium) was a great trading city with a wealthy and discerning Imperial Court and an appreciative eye for his landscapes, religious paintings and scenes of everyday peasant life.  His landscape work was transformed by a journey over the Alps to the far south of Italy.  He was also influenced by Hieronymus Bosch.  Much-loved paintings include the <span class='copyItalic'>Tower of Babel, Netherlandish Proverbs</span> and <span class='copyItalic'>The Peasant Wedding</span>.</p> "	;
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_2_2_1_2, st02, at02);	
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>Portrait of Pieter Bruegel the Younger</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Sir Anthony van Dyck (1599-1641)</p>"
			+	"<p class='imageCaption'>Pen and ink</p>"
			+	"<p class='imageCaption'>Teylers Museum, Haarlem</p>";
			var at03:String = "<p>Pieter Bruegel the Elder’s first son, also Pieter, spent his life in his father’s shadow.  Most of the paintings he produced with his large studio were copies of Brugel the elder’s famous works.  In the case of one winter scene, at least 60 copies are known.  He was also known as ‘Hell’ Brueghel because of his many paintings of grotesque and demonic scenes.</p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_2_2_1_3, st03, at03);

			var st04:String = 
				"<p><span class='imageCaptionItalic'>Portrait of Jan Breughel the Elder</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>after Sir Anthony van Dyck (1599-1641)</p>"
			+	"<p class='imageCaption'>Etching and engraving</p>"
			+	"<p class='imageCaption'>Fitzwilliam Museum, Cambridge</p>";
			var at04:String = "<p>Pieter the Younger’s brother Jan was known as ‘Velvet’ or ‘Paradise’ Breughel because of his beautifully detailed flower paintings and landscapes.  His first teacher was his grandmother, a successful watercolour painter.  He enjoyed a high status in Antwerp society and had many very distinguished patrons throughout Europe.</p>";
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_2_2_1_4, st04, at04);

			var st05:String = 
				"<p><span class='imageCaptionItalic'>The Earthly Paradise</span><span class='imageCaption'>, 1607-08</span></p>"
			+	"<p class='imageCaption'>Jan Breughel I</p>"
			+	"<p class='imageCaption'>Oil on copper, 45 x 65 cm</p>"
			+	"<p class='imageCaption'>Musée du Louvre, Paris</p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>";
			var at05:String = "<p>Pieter the Younger’s brother Jan was known as ‘Velvet’ or ‘Paradise’ Breughel because of his beautifully detailed flower paintings and landscapes.  His first teacher was his grandmother, a successful watercolour painter.  He enjoyed a high status in Antwerp society and had many very distinguished patrons throughout Europe.</p>";
			var vo05:ThumbnailVO = new ThumbnailVO(containerMc.t5, Img_2_2_1_5, st05, at05);

			var st06:String = 
				"<p><span class='imageCaptionItalic'>The Holy Family with St John</span><span class='imageCaption'>, about 1635</span></p>"
			+	"<p class='imageCaption'>Jan Breughel II (1601-1678)</p>"
			+	"<p class='imageCaption'>Oil on panel, 74  x 54 cm</p>"
			+	"<p class='imageCaption'>Private collection </p>";
			var at06:String = "<p>Jan the younger was the son of Jan Breughel I and grandson of Pieter Bruegel I.  While he was travelling in Italy with Anthony van Dyck, his father died unexpectedly from cholera, leaving young Jan his studio.  He continued to work in his father’s style, painting landscapes and flowers.</p>";
			var vo06:ThumbnailVO = new ThumbnailVO(containerMc.t6, Img_2_2_1_6, st06, at06);

			thumbnailVOs = new <ThumbnailVO>[vo01, vo02,vo03, vo04, vo05, vo06];

			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="The Brueghel Family: Who’s Who?";
			var description:String = "<p class='justified'>Until the eighteenth century, people could spell their surnames however they liked.  Documents show that the members of Pieter Bruegel’s family all signed their names with different spellings.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			text.x = AppGlobals.RIGHT_FAME_X;
			text.y = AppGlobals.RIGHT_FRAME_Y;
			addChild(text);		
			
			super();
		}
		
		override public function transitionIn():void
		{
			super.staggerItemsIn(largeImageContainer,text,containerMc);
		}
		
		override protected function showThumbSelected():void
		{
			super.showThumbSelected();
			if(selectedThumbVO)
			{
				text.setAdditionalText(selectedThumbVO.additionalText);	
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_2_2_1VC );
	}
}
