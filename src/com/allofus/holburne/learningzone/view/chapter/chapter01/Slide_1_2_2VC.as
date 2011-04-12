package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailClickedVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.chapter1.Img_1_2_2_01;
	import com.holburne.learningzone.chapter1.Img_1_2_2_02;
	import com.holburne.learningzone.chapter1.Img_1_2_2_03;
	import com.holburne.learningzone.chapter1.Img_1_2_2_04;
	import com.holburne.learningzone.chapter1.Img_1_2_2_05;
	import com.holburne.learningzone.chapter1.Img_1_2_2_06;
	import com.holburne.learningzone.chapter1.Img_1_2_2_07;
	import com.holburne.learningzone.chapter1.Img_1_2_2_08;
	import com.holburne.learningzone.chapter1.Img_1_2_2_09;
	import com.holburne.learningzone.chapter1.Img_1_2_2_10;
	import com.holburne.learningzone.swcassets.Slide_1_2_2;

	import mx.logging.ILogger;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_1_2_2VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_1_2_2;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function Slide_1_2_2VC()
		{
			containerMc = new Slide_1_2_2();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>William Wollaston MP</span><span class='imageCaption'>, late 1750s</span></p>"
			+	"<p class='imageCaption'>Oil on canvas, 216 x 147 cm</p>"
			+	"<p class='imageCaption'>By Kind Permission of the Trustees of the HC Wollaston Will Trust</p>";
			var vo01:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t1, Img_1_2_2_01, st01);
			
			var st02:String = 
				"<p><span class='imageCaptionItalic'>Robert Craggs Nugent MP</span><span class='imageCaption'>, about 1761</span></p>"
			+	"<p class='imageCaption'>Oil on canvas, 235 x 150 cm</p>"
			+	"<p class='imageCaption'>On loan from a private collection</p>";
			var vo02:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t2, Img_1_2_2_02, st02);	
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>Letter to James Unwin</span><span class='imageCaption'>, 15 September 1763</span></p>"
			+	"<p class='imageCaption'>Ink on paper, 22.4 x 37.6 cm</p>"
			+	"<p class='imageCaption'>Purchased in 1988</p>";
			var vo03:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t3, Img_1_2_2_03, st03);
			
			var st04:String = 
				"<p><span class='imageCaptionItalic'>Dr Rice Charleton</span><span class='imageCaption'>, about 1764</span></p>"
			+	"<p class='imageCaption'>Oil on canvas, 229 x 152 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Ernest Cook Bequest through the National Art Collections Fund 1955</p>"
			+	"<p class='imageCaption'>A365</p>";
			var vo04:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t4, Img_1_2_2_04, st04);
			
			var st05:String = 
				"<p><span class='imageCaptionItalic'>Market Cart with Figures</span><span class='imageCaption'>, about 1765</span></p>"
			+	"<p class='imageCaption'>Watercolour and chalk, 23.1 x 32.2 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir William Holburne, A96</p>";
			var vo05:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t5, Img_1_2_2_05, st05);					
			
			var st06:String = 
				"<p><span class='imageCaptionItalic'>Unknown Lady with a Blue Cloak</span><span class='imageCaption'>, about 1765</span></p>"
			+	"<p class='imageCaption'>Oil on canvas, 73.6 x 62.2 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir William Holburne, A66</p>";
			var vo06:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t6, Img_1_2_2_06, st06);			

			var st07:String = 
				"<p><span class='imageCaptionItalic'>Dr Abel Moysey</span><span class='imageCaption'>, about 1765</span></p>"
			+	"<p class='imageCaption'>Oil on canvas, 127.5 x 102 cm</p>"
			+	"<p class='imageCaption'>On loan from a private collection</p>";
			var vo07:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t7, Img_1_2_2_07, st07);
			
			var st08:String = 
				"<p><span class='imageCaptionItalic'>Thomas Bowlby MP</span><span class='imageCaption'>, 1766</span></p>"
			+	"<p class='imageCaption'>Oil on canvas</p>"
			+	"<p class='imageCaption'>Bequest 2010, 2010.1</p>";
			var vo08:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t8, Img_1_2_2_08, st08);		
			
			var st09:String = 
				"<p><span class='imageCaptionItalic'>Louisa, Lady Clarges</span><span class='imageCaption'>, 1778</span></p>"
			+	"<p class='imageCaption'>Oil on canvas, 126 x 100.5 cm</p>";
			var vo09:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t9, Img_1_2_2_09, st09);	
			
			var st10:String = 
				"<p><span class='imageCaptionItalic'>Letter to Dr Rice Charleton</span><span class='imageCaption'>, 24 June 1779</span></p>"
			+	"<p class='imageCaption'>Ink and sealing wax on paper, 21.8 x 37.7 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Ernest Cook Bequest through the National Art Collections Fund 1955</p>"
			+	"<p class='imageCaption'>A365a</p>";
			var vo10:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t10, Img_1_2_2_10, st10);			
			
//			var st01:String = 
//				"<p><span class='imageCaptionItalic'></span><span class='imageCaption'></span></p>"
//			+	"<p class='imageCaption'></p>"
//			+	"<p class='imageCaption'></p>"
//			+	"<p class='imageCaption'></p>"
//			+	"<p class='imageCaption'></p>"
//			+	"<p class='imageCaption'></p>";
//			var vo01:ThumbnailClickedVO = new ThumbnailClickedVO(containerMc.t1, Img_1_2_2_01, st01);

			
			thumbnailVOs = new <ThumbnailClickedVO>[ vo01,vo02,vo03,vo04,vo05,vo06,vo07,vo08,vo09,vo10 ];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);
			
			var title:String ="OTHER WORKS IN THE HOLBURNE COLLECTION";
			var description:String = 
				"<p class='justified'>Because of Gainsborough's importance to Bath, the Holburne has become a centre for display and study of his work in Bath.  The museum itself owns few examples of his paintings and drawings, and we are grateful to all those lenders who have allowed the Holburne to exhibit some particularly fine examples of his portraiture.</p>";
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
			super.staggerItemsIn([largeImageContainer,text,containerMc]);
		}
		
		override public function dispose():void
		{
			removeChild(containerMc);
			removeChild(largeImageContainer);
			containerMc = null;
			largeImageContainer = null;
			thumbnailVOs.length = 0;
			thumbnailVOs = null;
			super.dispose();
		}
		
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_2_2VC );
	}
}
