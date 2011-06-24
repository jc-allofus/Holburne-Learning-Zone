package com.allofus.holburne.learningzone.view.chapter.chapter07
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.swc.chapter7.Img_7_2_2_1;
	import com.holburne.learningzone.swc.chapter7.Img_7_2_2_2;
	import com.holburne.learningzone.swc.chapter7.Img_7_2_2_3;
	import com.holburne.learningzone.swc.chapter7.Img_7_2_2_4;
	import com.holburne.learningzone.swc.chapter7.Img_7_2_2_5;
	import com.holburne.learningzone.swc.chapter7.Img_7_2_2_6;
	import com.holburne.learningzone.swc.chapter7.Img_7_2_2_7;
	import com.holburne.learningzone.swc.chapter7.Slide_7_2_2;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_7_2_2VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_7_2_2;

		public function Slide_7_2_2VC()
		{
			containerMc = new Slide_7_2_2();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>Mary Magdalene</span><span class='imageCaption'>, 1633</span></p>"
			+	"<p class='imageCaption'>Guido Reni (1575-1642)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 234 x 151 cm</p>"
			+	"<p class='imageCaption'>Galleria Nazionale d'Arte Antica, Rome</p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_7_2_2_1, st01);

			var st02:String = 
				"<p><span class='imageCaptionItalic'>Pietà</span><span class='imageCaption'>, 1620-25</span></p>"
			+	"<p class='imageCaption'>Pietro da Cortona (1596-1669)</p>"
			+	"<p class='imageCaption'>Oil on canvas</p>"
			+	"<p class='imageCaption'>Santa Chiara, Cortona</p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_7_2_2_2, st02);
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>Rest on the Flight to Egypt</span><span class='imageCaption'>, about 1643</span></p>"
			+	"<p class='imageCaption'>Pietro da Cortona (1596-1669)</p>"
			+	"<p class='imageCaption'>Oil on copper, 48 x 39 cm</p>"
			+	"<p class='imageCaption'>Alte Pinakothek, Munich</p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_7_2_2_3, st03);
			
			var st04:String = 
				"<p><span class='imageCaptionItalic'>The Lamentation</span><span class='imageCaption'>, 1603</span></p>"
			+	"<p class='imageCaption'>Domencio Zampieri, called Domenichino (1581-1641)</p>"
			+	"<p class='imageCaption'>Oil on copper, 53 x 37.5 cm</p>"
			+	"<p class='imageCaption'>Metropolitan Museum of Art, New York</p>";
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_7_2_2_4, st04);	
			
			var st05:String = 
				"<p><span class='imageCaptionItalic'>Hagar and Ismail in the Desert</span><span class='imageCaption'>, about 1630</span></p>"
			+	"<p class='imageCaption'>Andrea Sacchi (1599-1661)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 96 x 92 cm</p>"
			+	"<p class='imageCaption'>National Gallery of Wales, Cardiff</p>";
			var vo05:ThumbnailVO = new ThumbnailVO(containerMc.t5, Img_7_2_2_5, st05);	
			
			var st06:String = 
				"<p><span class='imageCaptionItalic'>The Three Magdalenes</span><span class='imageCaption'>, 1634</span></p>"
			+	"<p class='imageCaption'>Andrea Sacchi (1599-1661)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 68 x 50.5 cm</p>"
			+	"<p class='imageCaption'>Galleria Nazionale d'Arte Antica, Rome</p>";
			var vo06:ThumbnailVO = new ThumbnailVO(containerMc.t6, Img_7_2_2_6, st06);	
			
			var st07:String = 
				"<p><span class='imageCaptionItalic'>The Entombment</span><span class='imageCaption'>, 1507</span></p>"
			+	"<p class='imageCaption'>Raphael (1483-1520)</p>"
			+	"<p class='imageCaption'>Oil on wood, 184 x 176 cm</p>"
			+	"<p class='imageCaption'>Galleria Borghese, Rome</p>";
			var vo07:ThumbnailVO = new ThumbnailVO(containerMc.t7, Img_7_2_2_7, st07);				
			
			thumbnailVOs = new <ThumbnailVO>[vo01,vo02,vo03,vo04,vo05,vo06,vo07];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Influences";
			var page1:String = 
				"<p class='justified'>Sir William Holburne believed this to be the work of the great Bolognese master Guido Reni. (1575-1642).  In the 1962 the collector and scholar of Baroque painting Sir Denis Mahon recognised it as a painting by G F Romanelli.</p>"
			+	"<p></p>"
			+	"<p class='justified'>At the time it was painted, Romanelli was still working closely with his master Pietro da Cortona (1596-1669). There are also similarities to the style of his first master, Domenichino (1581-1641).  His work suggests the influence of another Roman contemporary, Andrea Sacchi (1599-1661), especially in the figures of the Virgin and Joseph of Arimathea.</p>"
			+	"<p></p>"
			+	"<p class='justified'>All three artists, as well as Romanelli, were followers of the Renaissance master Raphael (1483-1520). They favoured the elegant classical style and restrained drama that Raphael developed a century earlier, preferring it to the more mannered and theatrical styles that had developed since his death.  Romanelli’s work was considered so similar to Raphael’s that he was known as ‘Il Raffaelino’.</p>"
			;
			
			text = new TextBoxWithTitleAndDescription(title, page1, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			positionInRightFrame(text);
			text.y = AppGlobals.RIGHT_FRAME_Y;
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(largeImageContainer,containerMc,text);
		}
		
		override public function dispose():void
		{
			containerMc = null;
			super.dispose();
		}
		
	}
}
