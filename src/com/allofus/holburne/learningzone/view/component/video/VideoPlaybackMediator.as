package com.allofus.holburne.learningzone.view.component.video
{
	import com.allofus.holburne.learningzone.events.VideoPlayerEvent;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author jc
	 */
	public class VideoPlaybackMediator extends Mediator
	{
		
		[Inject] public var view:VideoPlayback;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, VideoPlayerEvent.DIMENSIONS_CHANGED, handleDimensionsChanged);
		}
		
		protected function handleDimensionsChanged(event:VideoPlayerEvent):void
		{
			view.layout();
		}
	}
}
