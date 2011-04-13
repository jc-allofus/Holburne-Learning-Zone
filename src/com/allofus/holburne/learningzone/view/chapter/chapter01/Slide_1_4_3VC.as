package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.MultipageTextBox;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.holburne.learningzone.swc.chapter1.Chap1IntroImage;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class Slide_1_4_3VC extends AbstractSlide
	{
		protected var img:ImageWithBorderAndCaption;
		protected var text:MultipageTextBox;
		
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
			addChild(img);
			var pt1:Point = PositionUtil.getPositionInLeftFrame(img);
			img.x = pt1.x;
			img.y = pt1.y;
			img.showCaption(false);
			addChild(img);
			
			var title:String ="HOW MUCH DID IT COST?";
			var page1:String = 
				"<p class='justified'>When he began painting this portrait in the early 1760s, it was the largest painting Gainsborough had ever attempted.  He must have known his client, George Byam, was willing and able to pay handsomely for it.  Fifty years later, Jane Austen wrote “No people spend more freely, I believe, than West Indians”, and as a West Indian landowner, Byam and his wife must have been very welcome customers in Bath.</p>"
			+	"<p></p>"
			+ 	"<p>In April 1766, a Cornish clergyman, Rev John Penrose, reported to his daughter on a visit to Gainsborough’s showroom:</p>" 
			+	"<p class='copyItalic'>Your Mamma and Fanny have both been to see the Pictures, and are much pleased with them.  Amongst the rest is a fine Portrait of a father, mother and child: the finest Portrait, she ever saw, and she liked it the better for the child’s being very like little Molly.</p>"
			;
			var page2:String = 
				"<p>Penrose often noted prices of goods and services in his letters from Bath, and he added:</p>"
			+	"<p class='copyItalic'>The Picture ... cost £120, drawing the Gentleman and Lady only.  What the child’s Picture cost, I can’t tell.</p>"
			+	"<p></p>"
			+	"<p>In the 1760s, £120 would pay a labourer’s wages for five years, or buy you two tons of cheese.  For Gainsborough, it would have paid eight months’ rent on his spacious house in the centre of Bath.</p>"
			;
			text = new MultipageTextBox(title, [page1,page2]);
			addChild(text);
			
			var pt2:Point = PositionUtil.getPositionInRightFrame(text);
			text.x = pt2.x;
			text.y = pt2.y;
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			img.alpha = 0;
			text.alpha = 0;
			staggerItemsIn([img,text]);
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_3_1VC );
	}
}
