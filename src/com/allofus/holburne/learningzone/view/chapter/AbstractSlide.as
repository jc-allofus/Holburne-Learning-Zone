package com.allofus.holburne.learningzone.view.chapter
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TimelineMax;
	import com.greensock.TweenAlign;
	import com.greensock.TweenMax;

	import mx.logging.ILogger;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class AbstractSlide extends Sprite
	{
		protected var transition:TimelineMax;
		
		public function AbstractSlide()
		{
			if(!stage)
			{
				addEventListener(Event.ADDED_TO_STAGE, initSlide);
			}
			else
			{
				initSlide();
			}
		}
		
		protected function positionInLeftFrame(instance:DisplayObject):void
		{
			var pt:Point = PositionUtil.getPositionInLeftFrame(instance);
			instance.x = pt.x;
			instance.y = pt.y;
		}
		
		protected function positionInRightFrame(instance:DisplayObject):void
		{
			var pt2:Point = PositionUtil.getPositionInRightFrame(instance);
			instance.x = pt2.x;
			instance.y = pt2.y;
		}
		
		protected function initSlide(event : Event = null) : void
		{
			//hook for anything else to init once we have a stage reference
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
		
		protected function staggerItemsIn(...items:Array):void
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
//			visible = false;
//			dispatchOut();
			if(transition)
				transition.clear();
			TweenMax.to(this, AppGlobals.FADE_DURATION, {autoAlpha:0, ease:AppGlobals.FADE_EASE, onComplete:dispatchOut});

		}
		
		protected function dispatchOut():void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function dispose():void
		{
			if(transition)
			{
				transition.clear();
				transition.kill();
			}
			transition = null;
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( AbstractSlide );
	}
}
