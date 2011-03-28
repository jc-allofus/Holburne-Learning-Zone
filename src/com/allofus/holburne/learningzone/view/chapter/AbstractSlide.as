package com.allofus.holburne.learningzone.view.chapter
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.shared.logging.GetLogger;
	import com.greensock.TimelineMax;
	import com.greensock.TweenAlign;
	import com.greensock.TweenMax;

	import mx.logging.ILogger;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class AbstractSlide extends Sprite
	{
		protected var transition:TimelineMax;
		
		public function AbstractSlide()
		{
		}
		
		public function transitionIn():void
		{
			visible = true;
		}
		
		public function transitionInFromHomeScreen() : void
		{
			//implement in concrete "introduction" slides
			logger.warn("haven't implemented transitionInFromHomeScreen() " + this);
		}
		
		protected function staggerItemsIn(items:Array):void
		{
			if(transition)transition.clear();
			var tweenArr:Array = [];
			for (var i : int = 0; i < items.length; i++) 
			{
				tweenArr.push(new TweenMax(items[i], AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE, autoAlpha:1}));
			}
			
			transition = new TimelineMax({onComplete:staggerInComplete});
			transition.insertMultiple(tweenArr,0,TweenAlign.NORMAL,AppGlobals.TRANSITION_STAGGER);	
		}
		
		protected function staggerInComplete():void{}
		
		
		protected function staggerItemsOut(items:Array):void
		{
			if(transition)transition.clear();
			var tweenArr:Array = [];
			for (var i : int = 0; i < items.length; i++) 
			{
				tweenArr.push(new TweenMax(items[i], AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE, autoAlpha:0}));
			}
			
			transition = new TimelineMax({onComplete:dispatchOut});
			transition.insertMultiple(tweenArr,0,TweenAlign.NORMAL,AppGlobals.TRANSITION_STAGGER);	
		}
		
		public function transitionOut():void
		{
			visible = false;
			dispatchOut();
		}
		
		protected function dispatchOut():void
		{
			logger.fatal("dispatching out");
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function dispose():void
		{
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( AbstractSlide );
	}
}
