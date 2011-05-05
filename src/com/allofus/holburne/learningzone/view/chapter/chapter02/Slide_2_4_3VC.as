package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.BeforeAndAfterSwipeWithCaption;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.util.PositionUtil;
	import com.holburne.learningzone.swcassets.Img_2_4_3_After;
	import com.holburne.learningzone.swcassets.Img_2_4_3_Before;

	import flash.display.Bitmap;
	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class Slide_2_4_3VC extends AbstractSlide
	{
		
		protected var img:ImageWithBorderAndCaption;
		protected var text:TextBoxWithTitleAndDescription;
		
		
		public function Slide_2_4_3VC()
		{
			
			var caption:String = 
				"<p class='imageCaptionItalic'>The visit of the Godfather</p>"
			+	"<p class='imageCaption'>Pieter Brueghel the Younger (1565-1638)</p>"
			+	"<p class='imageCaption'>Oil on panel</p>"
			+	"<p class='imageCaption'>36.5 x 49.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A46</p>";
			
			var imgBefore:Bitmap = new Bitmap(new Img_2_4_3_Before(0,0));
			var imgAfter:Bitmap = new Bitmap(new Img_2_4_3_After(0,0));
			
			var swipey:BeforeAndAfterSwipeWithCaption = new BeforeAndAfterSwipeWithCaption(imgBefore, imgAfter);
			img = new ImageWithBorderAndCaption(swipey, caption);
			img.alpha = 0;
			addChild(img);
			
			var pt:Point = PositionUtil.getPositionInLeftFrame(img);
			img.x = pt.x;
			img.y = pt.y;
			img.showCaption(false);
			
			var title:String ="Before & After";
			var description:String = 
				"<p class='justified'>This life-size view of a wealthy English family enjoying the countryside is one of the most ambitions paintings made during Thomas Gainsborough's sixteen years in Bath.  From 1759 to 1774 he rented one of the most expensive houses in the town, right opposite the Abbey and next to the Pump Room.  In had a spacious studio where visitors to the Spa could come to be recorded in their fashionable finery.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Swipe across the image to see the transition over time</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			text.alpha = 0;
			addChild(text);
			
			var pt2:Point = PositionUtil.getPositionInRightFrame(text);
			text.x = pt2.x;
			text.y = pt2.y;
			
			super();
		}
		
		override public function transitionIn():void
		{
			super.staggerItemsIn(img,text);
		}
		
		override public function dispose():void
		{
			img.dispose();
			img = null;
			text = null;
			super.dispose();
		}
	}
}
