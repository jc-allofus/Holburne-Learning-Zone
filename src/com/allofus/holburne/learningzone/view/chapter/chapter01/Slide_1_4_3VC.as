package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.MultipageTextBox;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.swc.chapter1.Chap1IntroImage;

	import mx.logging.ILogger;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_1_4_3VC extends AbstractSlide
	{
		protected var img:ImageWithBorderAndCaption;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function Slide_1_4_3VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Byam Family</p>"
			+	"<p class='imageCaption'>Thomas Gainsborough (1727-1788)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1762-66</p>"
			+	"<p class='imageCaption'>238.5 x 229.7 cm</p>"
			+	"<p class='imageCaption'>On long-term loan from the Andrew Brownswood Arts Foundation</p>"
			+	"<p class='imageCaption'>1.2001.1</p>";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap1IntroImage(0,0)), caption);
			positionInLeftFrame(img);
			img.showCaption(false);
			addChild(img);
			
			var title:String ="How Much Did it Cost?";
			var page1:String = 
				"<p class='justified'>When Gainsborough began painting this portrait in the early 1760s, it was the largest painting he had ever attempted. He must have known his client, George Byam, was willing and able to pay handsomely for it. Fifty years later, Jane Austen wrote “No people spend more freely, I believe, than West Indians”, and as a West Indian landowner, Byam and his wife must have been very welcome customers in Bath.</p>"
			+	"<p></p>"
			+ 	"<p>In April 1766, a Cornish clergyman, Rev John Penrose, saw the picture in Gainsborough's showroom and wrote to his daughter abouth the “fine Portrait of a father, mother and child: the finest Portrait, [your Mamma] ever saw, and she liked it the better for the child’s being very like little Molly.” Penrose added  “The Picture … cost £120, drawing the Gentleman and Lady only. What the child’s Picture cost, I can’t tell.”</p>" 
			+	"<p></p>"
			+	"<p>In the 1760s, £120 would pay a labourer’s wages for five years, or buy you two tons of cheese. For Gainsborough, it would have paid eight months’ rent on his spacious house in the centre of Bath.</p>"
			;
			text = new TextBoxWithTitleAndDescription(title, page1);
			addChild(text);
			positionInRightFrame(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			img.alpha = 0;
			text.alpha = 0;
			staggerItemsIn(img,text);
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_3_1VC );
	}
}
