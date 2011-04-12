package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.events.VideoPlayerEvent;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.video.VideoPlayback;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;

	import flash.display.Shape;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class VideoSlide extends AbstractSlide
	{
		
		protected var player:VideoPlayback;
		protected var border:Shape;
		
		
		public function VideoSlide()
		{
			//CHILD SHOULD IMPLEMENT SOMETHING LIKE BELOW
//			player = new VideoPlayback("Slide_1_2_3_VidPlayer", "assets/vids/atomic.f4v");
//			player.addEventListener(VideoPlayerEvent.DIMENSIONS_CHANGED, positionPlayer);
//			player.addEventListener(VideoPlayerEvent.READY, transitionInAndPlayVideo);
//			player.visible = false;
//			player.alpha = 0;
//			addChild(player);
			super();
		}
		
		protected function positionPlayer(event:Event = null):void
		{
			PositionUtil.centerHorizontally(player, stage);
			PositionUtil.centerVertically(player, stage);
		}
		
		
		protected function transitionInAndPlayVideo(event:Event = null):void
		{
			TweenMax.to(player, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE, onComplete:player.play});
		}
		
		override public function dispose():void
		{
			if(player)
			{
				TweenMax.killTweensOf(player);
				player.removeEventListener(VideoPlayerEvent.DIMENSIONS_CHANGED, positionPlayer);
				player.removeEventListener(VideoPlayerEvent.READY, transitionInAndPlayVideo);
				player.dispose();
			}
			
			player = null;
			
			super.dispose();
		}		
	}
}
