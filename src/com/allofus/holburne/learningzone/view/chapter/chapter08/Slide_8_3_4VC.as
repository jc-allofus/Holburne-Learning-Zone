package com.allofus.holburne.learningzone.view.chapter.chapter08
{
	import com.allofus.holburne.learningzone.events.VideoPlayerEvent;
	import com.allofus.holburne.learningzone.view.component.VideoSlide;
	import com.allofus.holburne.learningzone.view.component.video.VideoPlayback;

	/**
	 * @author jc
	 */
	public class Slide_8_3_4VC extends VideoSlide
	{
		public function Slide_8_3_4VC()
		{
			player = new VideoPlayback("Slide_8_3_4_VidPlayer", "assets/vids/atomic.f4v");
			player.addEventListener(VideoPlayerEvent.DIMENSIONS_CHANGED, positionPlayer);
			player.addEventListener(VideoPlayerEvent.READY, transitionInAndPlayVideo);
			player.visible = false;
			player.alpha = 0;
			addChild(player);
			super();
		}
	}
}
