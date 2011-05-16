package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TimelineMax;
	import com.greensock.TweenAlign;
	import com.greensock.TweenMax;

	import mx.logging.ILogger;

	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class IntroductionSlide extends AbstractSlide
	{
		protected var img:ImageWithBorderAndCaption;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function IntroductionSlide()
		{
			positionImageAndText();
			super();
		}
		
		protected function positionImageAndText():void
		{
			var pt:Point = PositionUtil.getPositionInLeftFrame(img);
			img.x = pt.x;
			img.y = pt.y;
			
			var pt2:Point = PositionUtil.getPositionInRightFrame(text);
			text.x = pt2.x;
			text.y = pt2.y;
		}
		
		override protected function staggerInComplete():void
		{
			img.showCaption();
		}
		
		override public function transitionInFromHomeScreen():void
		{
			img.showCaption();
			staggerItemsIn(img,text);
		}
		
		override public function transitionIn():void
		{
			img.alpha = text.alpha = 0;
			staggerItemsIn(img,text);
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
				
			if(img)
				img.dispose();
				
			if(text)
				text.dispose();
				
			img = null;
			text = null;
			super.dispose();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( IntroductionSlide );
	}
}
