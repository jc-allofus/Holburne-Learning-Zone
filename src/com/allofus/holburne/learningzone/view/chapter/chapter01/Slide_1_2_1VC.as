package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.MultipageTextBox;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.swc.chapter1.Slide_1_2_1_bm;

	import mx.logging.ILogger;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_1_2_1VC extends AbstractSlide
	{
		
		protected var img:ImageWithBorderAndCaption;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function Slide_1_2_1VC()
		{
			var caption:String = 
				"<p class='imageCaption'>Thomas Gainsborough (1727-1788)</p>"
			+	"<p><span class='imageCaptionItalic'>Self Portrait </span><span class='imageCaption'>c.1754-9</span></p>"
			+	"<p class='imageCaption'>Graphite on paper, 35.9 x 25.8 cm</p>"
			+	"<p class='imageCaption'>© Trustees of the British Museum";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Slide_1_2_1_bm(0,0)), caption);
			img.visible = false;
			img.alpha = 0;
			positionInLeftFrame(img);
			img.showCaption(false);
			addChild(img);
			
			var title:String ="Thomas Gainsborough (1727-1788)";
			var page1:String = 
				"<p class='justified'>Thomas Gainsborough from Sudbury, Suffolk was a grammar-school pupil fromeducated at grammar school Sudbury, Suffolk. He moved to London as a young teenagerin his youth to study painting and drawing at the St Martin's Lane Academy, before returning to Sudbury as an independent artist in his early twenties. </p>"
			+	"<p></p>"
			+	"<p class='justified'>Gainsborough made a living from ‘face-painting’, producing portraits of the well-to-do, but his abiding love was for the landscapes he painted throughout his life. In search of a living, Gainsborugh and his young family moved first to Ipswich and then, in 1758 to the rapidly-expanding spa town of Bath.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Gainsborough’s sixteen years in Bath (1758-1774), painting the great, the rich and the beautiful, transformed his career and fortunes.  He arrived as a minor provincial portrait artist, and left ready to take on the most fashionable and successful painters in London.</p>"
			+	"<p></p>"
			+	"<p class='justified'>In London, he and his family lived in an elegant house in Pall Mall, with his own studio and showroom in the garden.  Here he painted the most fashionable members of high society, and was a favourite artist of King George III.  His portraits and landscapes were the highlight of many Royal Academy exhibitions, until 1784 when he fell out with the Academy. He spent the last years of his life concentrating on landscape painting and drawing.</p>";
			
			text = new TextBoxWithTitleAndDescription(title,page1);
			addChild(text);
			positionInRightFrame(text);
			text.visible = false;
			text.alpha = 0;
			super();
		}
		
		override public function transitionIn():void
		{
			super.staggerItemsIn(img,text);
		}
		
		override public function dispose():void
		{
			img = null;
			if(text)
				text.dispose();				
			text = null;
			super.dispose();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_2_1VC );
		
	}
}
