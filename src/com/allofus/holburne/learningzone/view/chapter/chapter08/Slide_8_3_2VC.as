package com.allofus.holburne.learningzone.view.chapter.chapter08
{
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.holburne.learningzone.swc.chapter8.Img_8_1;

	import flash.display.Bitmap;
	/**
	 * @author jc
	 */
	public class Slide_8_3_2VC extends AbstractSlide
	{
		protected var img:ImageWithBorderAndCaption;
		protected var questionPanel:Slide_8_3_2_QuestionPanel;
		
		public function Slide_8_3_2VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Mask of Truth</p>"
			+	"<p class='imageCaption'>Michele Rocca (about 1670 - about 1751)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1720</p>"
			+	"<p class='imageCaption'>48.1 x 63.3 cm</p>"
			+	"<p class='imageCaption'>Gift of Professor Wickstead, 1924</p>"
			+	"<p class='imageCaption'>A310</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_8_1(0,0)), caption);
			img.alpha = 0;
			positionInLeftFrame(img);
			addChild(img);
			
			questionPanel = new Slide_8_3_2_QuestionPanel();
			positionInRightFrame(questionPanel);
			questionPanel.alpha = 0;
			addChild(questionPanel);
			
			super();
		}
		
		
		override public function transitionIn():void
		{
			staggerItemsIn(img, questionPanel);
		}
		
		override public function dispose():void
		{
			questionPanel.dispose();
			questionPanel = null;
			
			img = null;
			
			super.dispose();
		}
	}
}
