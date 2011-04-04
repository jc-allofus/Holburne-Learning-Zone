package com.allofus.holburne.learningzone.events
{
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class VideoPlayerEvent extends Event
	{
		public static const READY:String 					= "VideoPlayerEvent/ready";
		public static const DIMENSIONS_CHANGED:String 		= "VideoPlayerEvent/dimensionsChanged";
		public static const PLAYBACK_STATE_CHANGED:String 	= "VideoPlayerEvent/playbackStateChanged";
		
		public static const STATE_PLAYING:String  	="videoState/Playing";
		public static const STATE_PAUSED:String 	= "videoState/Paused";
		public static const STATE_FINISHED:String 	= "videoState/finished";
		
		
		public var playingState:String;
		
		public function VideoPlayerEvent(type : String, playingState:String = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			this.playingState = playingState;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new VideoPlayerEvent(type, playingState, bubbles, cancelable);
		}
	}
}
