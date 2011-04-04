package com.allofus.holburne.learningzone.view.component.video
{
	import com.allofus.holburne.learningzone.events.VideoPlayerEvent;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class VideoPlayerMediator extends Mediator
	{
		
		[Inject] public var view:VideoPlayer;
		
		override public function onRegister():void
		{
			eventMap.mapListener(view, VideoPlayerEvent.DIMENSIONS_CHANGED, relayToSystem);
			eventMap.mapListener(view, VideoPlayerEvent.READY, relayToSystem);
			eventMap.mapListener(view, VideoPlayerEvent.PLAYBACK_STATE_CHANGED, relayToSystem);
		}
		
		protected function relayToSystem(event:Event):void
		{
			dispatch(event);
		}
	}
}
