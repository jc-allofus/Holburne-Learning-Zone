package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.homepage.HomepageVC;
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.greensock.easing.Expo;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class HomePageThumbnailButton extends ImageWithBorderAndCaption
	{
		protected static const SELECTED_SCALE:Number 	= 0.7;
		
		protected var viewPiecePanel:Shape;
		protected var viewPieceLabel:TextField;
		
		protected var _vo:ChapterVO;
		
		protected var timeline:TimelineMax;
		
		protected var _selected:Boolean = false;
		
		protected var _origX:Number;
		protected var _origY:Number;
		
		public function HomePageThumbnailButton(img : Bitmap, captionText : String, vo:ChapterVO)
		{
			super(img, captionText);
			_vo = vo;
			viewPiecePanel = new Shape();
			viewPiecePanel.graphics.beginFill(0xcccccc, 0.8);
			viewPiecePanel.graphics.drawRect(0, 0, img.width, img.height);
			viewPiecePanel.x = this.img.x;
			viewPiecePanel.y = this.img.y;
			viewPieceLabel = FontManager.createStyledTextField("VIEW PEICE", "title");
			addChild(viewPiecePanel);
			addChild(viewPieceLabel);
			
			PositionUtil.centerHorizontally(viewPieceLabel, viewPiecePanel);
			PositionUtil.centerVertically(viewPieceLabel, viewPiecePanel);
				
//			var shp:Shape = new Shape();
//			shp.graphics.beginFill(0x00ff00);
//			shp.graphics.drawCircle(0, 0, 5);
//			addChild(shp);
//			
//			PositionUtil.centerHorizontally(shp, viewPiecePanel);
//			PositionUtil.centerVertically(shp, viewPiecePanel);	
			buttonMode = true;	
			addEventListener(MouseEvent.CLICK, handleClick);
		}
		
		protected function handleClick(e:MouseEvent):void
		{
			_selected ? collapse() : expand();
		}
		
		public function expand():void
		{
			if(!_origX)_origX = x;
			if(!_origY)_origY = y;
			_selected = true;
			if(timeline)timeline.clear();
			timeline = new TimelineMax({onComplete:showCaption});
			timeline.insert(new TweenMax(this, 0.5, {transformAroundCenter:{scaleX:SELECTED_SCALE, scaleY:SELECTED_SCALE}, ease:Expo.easeInOut, glowFilter:AppGlobals.GLOW_ON}));
			timeline.insert(new TweenMax(viewPiecePanel, 0.5, {autoAlpha:1, ease:Expo.easeInOut}));
			timeline.insert(new TweenMax(viewPieceLabel, 0.5, {autoAlpha:1, ease:Expo.easeInOut}));
		}
		
		override protected function showCaptionComplete():void
		{
			dispatchEvent(new Event(Event.OPEN));
		}
		
		public function collapse():void
		{
			_selected = false;
			hideCaption();
		}
		
		override protected function hideCaptionComplete():void
		{
			//logger.fatal("hidecaptionComplete()");
			if(timeline)timeline.clear();
			timeline = new TimelineMax({onComplete:collapseComplete});
			timeline.insert(new TweenMax(this, 0.5, {x:_origX, y:_origY, transformAroundCenter:{scaleX:HomepageVC.THUMB_SCALE, scaleY:HomepageVC.THUMB_SCALE}, ease:Expo.easeInOut, glowFilter:AppGlobals.GLOW_OFF}));
			timeline.insert(new TweenMax(viewPiecePanel, 0.5, {autoAlpha:0, ease:Expo.easeInOut}));
			timeline.insert(new TweenMax(viewPieceLabel, 0.5, {autoAlpha:0, ease:Expo.easeInOut}));
		}

		protected function collapseComplete():void
		{
			//logger.fatal("collapsed.");
			dispatchEvent(new Event(Event.CLOSE));
		}
		
		override public function dispose():void
		{
			if(timeline)
			{
				timeline.clear();
				timeline = null;
			}
			
			viewPiecePanel = null;
			viewPieceLabel = null;
			_vo = null;
			super.dispose();
		}

		public function get vo() : ChapterVO
		{
			return _vo;
		}

		public function set vo(vo : ChapterVO) : void
		{
			_vo = vo;
		}		
		
		private static const logger : ILogger = GetLogger.qualifiedName(HomePageThumbnailButton);
	}
}
