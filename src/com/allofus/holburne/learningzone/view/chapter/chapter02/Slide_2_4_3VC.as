package com.allofus.holburne.learningzone.view.chapter.chapter02
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.BeforeAndAfterSwipeWithCaption;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.util.PositionUtil;
	import com.holburne.learningzone.swc.chapter2.Chap2IntroImage;
	import com.holburne.learningzone.swcassets.Img_2_4_3_After;

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
			+	"<p class='imageCaption'>Pieter Bruegel the Younger (1565-1638)</p>"
			+	"<p class='imageCaption'>Oil on panel</p>"
			+	"<p class='imageCaption'>36.5 x 49.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A46</p>";
			
			var imgBefore:Bitmap = new Bitmap(new Chap2IntroImage(0,0));
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
				"<p class='justified'>This painting on a fragile wooden panel had lost a lot of its painted surface over the years, particularly in the lower left quarter. Past restorers had made some mistakes in reconstructing missing details like the mother’s face and feet and the rockers on the cradle. X rays and other versions of the image have been used as guides to clean and restore the painting.</p>"
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
			if(img)
				img.dispose();
			img = null;

			if(text)
				text.dispose();				
			text = null;
			super.dispose();
		}
	}
}
