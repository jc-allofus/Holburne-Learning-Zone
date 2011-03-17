package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.greensock.TweenAlign;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.util.PositionUtil;
	import com.holburne.learningzone.swc.chapter1.Chap1IntroImage;

	import flash.display.Bitmap;
	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class Slide_1_1 extends AbstractSlide
	{
		protected var img:ImageWithBorderAndCaption;
		protected var text:TextBoxWithTitleAndDescription;
		
		protected var transition:TimelineMax;
		
		public function Slide_1_1()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>The Byam Family</p>"
			+	"<p class='imageCaption'>Thomas Gainsborough (1727-1788)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1762-66</p>"
			+	"<p class='imageCaption'>238.5 x 229.7 cm</p>"
			+	"<p class='imageCaption'>On long-term loan from the Andrew Brownswood Arts Foundation</p>"
			+	"<p class='imageCaption'>1.2001.1</p>";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap1IntroImage(0,0)), caption);
			var pt:Point = PositionUtil.getPositionInLeftFrame(img);
			img.x = pt.x;
			img.y = pt.y;
			addChild(img);
			
			var title:String ="INTRODUCTION";
			var description:String = 
				"<p>This life-size view of a wealthy English family enjoying the countryside is one of the most ambitions paintings made during Thomas Gainsborough's sixteen years in Bath.  From 1759 to 1774 he rented one of the most expensive houses in the town, right opposite the Abbey and next to the Pump Room.  In had a spacious studio where visitors to the Spa could come to be recorded in their fashionable finery.</p>"
			+	"<p>&npsp;</p>"
			+	"<p>George Byam, a plantation owner from Antigua, paid 100 guineas (over eight month's rent for the artist) for this portrait of himself and his new wife.  Gainsborough added their daughter Selina to the composition a few years later.  At the same time, Byam treated his wife to a re-painting of her dress from its original pink to a more up-to-date shade of blue.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			
			var pt2:Point = PositionUtil.getPositionInRightFrame(text);
			text.x = pt2.x;
			text.y = pt2.y;
			text.visible = false;
			text.alpha = 0;
		}
		
		override public function transitionIn():void
		{
			img.transitionIn();
			img.showCaption();
			text.transitionIn(0.25);
		}
		
		override public function transitionOut():void
		{
			if(transition)transition.clear();
			transition = new TimelineMax({onComplete:dispatchOut});
			transition.insertMultiple([
			new TweenMax(img, AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE, autoAlpha:0}),
			new TweenMax(text, AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE, autoAlpha:0})
			],0,TweenAlign.NORMAL,AppGlobals.TRANSITION_STAGGER);
		}
		
		override public function dispose():void
		{
			if(transition)transition.clear();
			img = null;
			text = null;
			super.dispose();
		}
		
		
	}
}
