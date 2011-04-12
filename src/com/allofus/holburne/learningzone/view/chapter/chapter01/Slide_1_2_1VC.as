package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.MultipageTextBox;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.holburne.learningzone.swc.chapter1.Slide_1_2_1_bm;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class Slide_1_2_1VC extends AbstractSlide
	{
		
		protected var img:ImageWithBorderAndCaption;
		protected var text:MultipageTextBox;
		
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
			var pt1:Point = PositionUtil.getPositionInLeftFrame(img);
			img.x = pt1.x;
			img.y = pt1.y;
			img.showCaption(false);
			addChild(img);
			
			var title:String ="Thomas Gainsborough (1727-1788)";
			var page1:String = 
				"<p class='justified'>Thomas Gainsborough was a grammar-school pupil from Sudbury, Suffolk, who arrived in London in search of his fortune in 1740.  He studied painting and drawing at the St Martin’s Lane Academy.  By the age of seventeen he was confident to set up as an independent artist, and two years later he married and had his first daughter.  He moved back to Sudbury by 1750.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Like many of his contemporaries, Gainsborough made a steady living from ‘face-painting’, producing portraits of the well-to-do.  His real love, however, was for landscape, following the example of the Dutch masters of the seventeenth century.  Both are combined in his most famous Sudbury painting, <i>Mr & Mrs Andrews</i> (National Gallery).</p>"
			+	"<p></p>"
			+	"<p class='justified'>A couple of years later, Gainsborough and his family moved on to the larger town of Ipswich.  In 1758 he decided to move further still, to the rapidly-expanding spa town of Bath.  </p>";
			
			
			var page2:String = 
				"<p class='justified'>Gainsborough’s sixteen years in Bath (1758-1774) transformed his career as a painter.  He arrived, from his native Suffolk, as a minor provincial portrait artist, and left ready to take on the most fashionable and successful painters in London.  Bath offered the artist opportunities to paint the great, the rich, and the beautiful, as well as the inspiration of the picturesque landscape that surrounds the city.</p>"
			+	"<p></p>"
			+	"<p class='justified'>In London, he and his family lived in an elegant house in Pall Mall, with his own studio and showroom in the garden.  Here he painted the most fashionable members of high society, and was a favourite artist of King George III and his family.  His portraits and landscapes were the highlight of many Royal Academy exhibitions, until 1784 when Gainsborough fell out with the Academy over the positioning of his paintings.  He spent the last few years of his life concentrating on landscape painting and drawing. </p>";
			
			
			text = new MultipageTextBox(title, [page1,page2], AppGlobals.RIGHT_FRAME_WIDTH);
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
			super.staggerItemsIn([img,text]);
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
