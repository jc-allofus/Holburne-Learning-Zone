package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.BeforeAndAfterSwipeWithCaption;
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
		
		protected var img:BeforeAndAfterSwipeWithCaption;
		
		
		public function Slide_2_4_3VC()
		{
			var imgBefore:Bitmap = new Bitmap(new Img_2_4_3_Before(0,0));
			var imgAfter:Bitmap = new Bitmap(new Img_2_4_3_After(0,0));
			
			img = new BeforeAndAfterSwipeWithCaption(imgBefore, imgAfter);
			addChild(img);
			
			var pt:Point = PositionUtil.getPositionInLeftFrame(img);
			img.x = pt.x;
			img.y = pt.y;
			
//			var pt2:Point = PositionUtil.getPositionInRightFrame(text);
//			text.x = pt2.x;
//			text.y = pt2.y;
			
			super();
		}
	}
}
