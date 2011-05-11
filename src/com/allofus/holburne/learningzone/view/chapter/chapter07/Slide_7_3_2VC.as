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
		protected var mpText:TextBoxWithTitleAndDescription;

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

			var title:String ="More paintings by Romanelli";
			var page1:String = 
				"<p class='justified'>Romanelli made several little paintings on copper of scenes for Pope Urban VIII and the Barberini family.  There are at least three scenes from the Easter story made around 1640, the same time as the Holburne’s.  Most of these include the disciple John, who was a witness to both the death and the Resurrection of Christ.  John is traditionally depicted as a very young man, and is thought to have written the fourth Gospel many years after these things took place.  Here is John’s account of the story.</p>"
//			+	"<p></p>"
//			+	"<p class='justified'>paragraph2text</p>"
			;
			
			mpText = new TextBoxWithTitleAndDescription(title, page1, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(mpText);
			positionInRightFrame(mpText);
			mpText.y = AppGlobals.RIGHT_FRAME_Y;
			mpText.visible = false;
			mpText.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(largeImageContainer,containerMc,mpText);
		}
		
		override protected function showThumbSelected():void
		{
			super.showThumbSelected();
			if(selectedThumbVO)
			{
				mpText.setAdditionalText(selectedThumbVO.additionalText);	
			}
		}
		
	}
}
