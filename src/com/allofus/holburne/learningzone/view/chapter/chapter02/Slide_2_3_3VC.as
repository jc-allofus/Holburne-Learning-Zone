package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.chapter2.Img_2_3_3_1;
	import com.holburne.learningzone.chapter2.Img_2_3_3_2;
	import com.holburne.learningzone.chapter2.Img_2_3_3_3;
	import com.holburne.learningzone.chapter2.Slide_2_3_3;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_2_3_3VC extends ThumbnailImagesSlide
	{
		
		protected var containerMc:Slide_2_3_3;
		
		public function Slide_2_3_3VC()
		{
			
			containerMc = new Slide_2_3_3();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>Visit to the Farm</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Pieter Brueghel II</p>"
			+	"<p class='imageCaption'>Oil on panel 41.5 x 58 cm</p>"
			+	"<p class='imageCaption'>Royal Museum of Fine Arts Antwerp</p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_2_3_3_1, st01);

			var st02:String = 
				"<p><span class='imageCaptionItalic'>Visit to the Farm</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Jan Brueghel I</p>"
			+	"<p class='imageCaption'>Oil on panel, 30.2 x 46.5 cm</p>"
			+	"<p class='imageCaption'>Royal Museum of Fine Arts Antwerp</p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_2_3_3_2, st02);
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>Visit to the Farm</span><span class='imageCaption'>, 1597</span></p>"
			+	"<p class='imageCaption'>Jan Brueghel I</p>"
			+	"<p class='imageCaption'>Oil on copper, 27 x 36 cm</p>"
			+	"<p class='imageCaption'>Kunsthistorisches Museum Vienna, Gemäldegalerie </p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_2_3_3_3, st03);			
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);
			
			var title:String ="Other versions of this scene";
			var description:String = "<p class='justified'>There are many versions of the <span class='copyItalic'>Visit of the Godfather</span> (or <span class='copyItalic'>Visit to the Farm</span>) by Pieter the Younger or his brother Jan the Elder.  The original by Pieter the Elder appears to be lost.  Some versions are painted on wood panels, some on copper, with many variations and different colourways.</p>";
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
			staggerItemsIn(largeImageContainer,text,containerMc);
		}
		
		override public function dispose():void
		{
			containerMc = null;
			super.dispose();
		}
	}
}
