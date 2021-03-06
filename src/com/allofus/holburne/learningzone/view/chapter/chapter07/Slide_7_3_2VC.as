package com.allofus.holburne.learningzone.view.chapter.chapter07
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_2_1;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_2_2;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_2_3;
	import com.holburne.learningzone.swc.chapter7.Img_7_3_2_4;
	import com.holburne.learningzone.swc.chapter7.Slide_7_3_2;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_7_3_2VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_7_3_2;

		public function Slide_7_3_2VC()
		{
			containerMc = new Slide_7_3_2();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>The Lamentation</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>oil on copper, 29.5 x 39.5 cm</p>"
			+	"<p class='imageCaption'>The Burghley House Collection</p>"
			+	"<p class='imageCaption'>(black and white photograph)</p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_7_3_2_1, st01,"<p class='justified'>Standing by the cross of Jesus were his mother and his mother’s sister, Mary the wife of Clopas, and Mary Magdalene. ...they took the body of Jesus and bound it in linen cloths with the spices, as is the burial custom of the Jews.</p>");

			var st02:String = 
				"<p><span class='imageCaptionItalic'>The Entombment</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Giovanni Francesco Romanelli (1610-1662) , about 1638</p>"
			+	"<p class='imageCaption'>Oil on canvas, 68.6 x 53.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_7_3_2_2, st02,"<p class='justified'>After these things Joseph of Arimathea, who was a disciple of Jesus, but secretly for fear of the Jews, asked Pilate that he might take away the body of Jesus … Now in the place where he was crucified there was a garden, and in the garden a new tomb in which no one had yet been laid.  So because of the Jewish day of Preparation, since the tomb was close at hand, they laid Jesus there.</p>");
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>St. John and St. Peter at Christ’s Tomb</span><span class='imageCaption'>, about 1640</span></p>"
			+	"<p class='imageCaption'>Oil on silvered copper</p>"
			+	"<p class='imageCaption'>46.7 x 38.4 cm</p>"
			+	"<p class='imageCaption'>Los Angeles County Museum of Art</p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_7_3_2_3, st03,"<p class='justified'>Now on the first day of the week Mary Magdalene came to the tomb early, while it was still dark, and saw that the stone had been taken away from the tomb.  So she ran and went to Simon Peter and the other disciple, the one whom Jesus loved, and said to them, ”They have taken the Lord out of the tomb, and we do not know where they have laid him.”  So Peter went out with the other disciple, and they were going toward the tomb.  Both of them were running together, but the other disciple outran Peter and reached the tomb first.  And stooping to look in, he saw the linen cloths lying there, but he did not go in.</p>");	
			
			var st04:String = 
				"<p><span class='imageCaptionItalic'>St John and St Peter at the Empty Tomb</span><span class='imageCaption'>, 1641</span></p>"
			+	"<p class='imageCaption'>oil on silvered copper</p>"
			+	"<p class='imageCaption'>46.8 x 38.4 cm</p>"
			+	"<p class='imageCaption'>Fitzwilliam Museum, Cambridge</p>";
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_7_3_2_4, st04,"<p class='justified'>Then Simon Peter came, following him, and went into the tomb.  He saw the linen cloths lying there, and the face cloth, which had been on Jesus’ head, not lying with the linen cloths but folded up in a place by itself.  Then the other disciple, who had reached the tomb first, also went in, and he saw and believed; for as yet they did not understand the Scripture, that he must rise from the dead.</p>");			
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03, vo04];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Other Episodes";
			var page1:String = 
				"<p class='justified'>Romanellli painted a number of similar small-scale painitngs depicting episodes from the same story, including the less usual scene of the disciples discovering the empty tomb following the Resurrection.</p>"
//			+	"<p></p>"
//			+	"<p class='justified'>paragraph2text</p>"
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
		
		override protected function showThumbSelected():void
		{
			super.showThumbSelected();
			if(selectedThumbVO)
			{
				text.setAdditionalText(selectedThumbVO.additionalText);	
			}
		}
		
		override public function dispose():void
		{
			containerMc = null;
			super.dispose();
		}
		
	}
}
