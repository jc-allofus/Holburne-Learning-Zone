package com.allofus.holburne.learningzone.view.component.video
{
	import com.allofus.holburne.learningzone.events.VideoPlayerEvent;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Mediator;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class VideoControlsMediator extends Mediator
	{
		
		[Inject] public var view:VideoControls;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, VideoPlayerEvent.DIMENSIONS_CHANGED, handleDimensionsChanged);
			eventMap.mapListener(eventDispatcher, VideoPlayerEvent.READY, handlePlayerReady);
			eventMap.mapListener(eventDispatcher, VideoPlayerEvent.PLAYBACK_STATE_CHANGED, handlePlaybackStatechanged);
		}
		
		protected function handleDimensionsChanged(event:VideoPlayerEvent):void
		{
			view.layout();
		}
		
		protected function handlePlayerReady(event:VideoPlayerEvent):void
		{
			view.wake();
		}
		
		protected function handlePlaybackStatechanged(event:VideoPlayerEvent):void
		{
			logger.debug("med sees state changed");
			switch (event.playingState)
			{
				case VideoPlayerEvent.STATE_PLAYING:
					view.wake();
					break;
					
				case VideoPlayerEvent.STATE_PAUSED:	
					view.sleep();
					break;
					
				case VideoPlayerEvent.STATE_FINISHED:
					view.sleep();
					break;	
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( VideoControlsMediator );
	}
}
