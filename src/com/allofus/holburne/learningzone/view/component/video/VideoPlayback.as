package com.allofus.holburne.learningzone.view.component.video
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.events.VideoPlayerEvent;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;

	import mx.logging.ILogger;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class VideoPlayback extends Sprite
	{

		protected var player:VideoPlayer; 		//displays video stream
		protected var controls:VideoControls; 	// play/pause & scrubber
		protected var border:Shape; 			
		
		public function VideoPlayback(id:String, vidURL:String = null)
		{
			player = new VideoPlayer(id, vidURL);
			player.addEventListener(VideoPlayerEvent.READY, layout);
			player.addEventListener(VideoPlayerEvent.DIMENSIONS_CHANGED, redispatch);
			
			border = new Shape();
			
			controls = new VideoControls(player);
			
			addChild(border);
			addChild(controls);
			addChild(player);
			
		}
		
		public function layout(event:Event = null):void
		{
			player.x = player.y = AppGlobals.BORDER_SIZE;
			controls.layout();
			PositionUtil.positionUnder(controls, player, AppGlobals.BORDER_SIZE);
			controls.x = AppGlobals.BORDER_SIZE;
			drawBorder();
			redispatch(event);
		}
		
		protected function drawBorder():void
		{
			var totalWidth:int = Math.round(player.videoWidth + (AppGlobals.BORDER_SIZE * 2));
			var totalHeight:int = Math.round(controls.y + controls.height + AppGlobals.BORDER_SIZE );
			
			border.graphics.clear();
			border.graphics.beginFill(AppGlobals.BORDER_COLOR);
			border.graphics.drawRect(0, 0, totalWidth, totalHeight);
		}
		
		protected function redispatch(event:Event):void
		{
			dispatchEvent(event);
		}
		
		public function play():void
		{
			player.play();
		}
		
		public function dispose() : void
		{
			if(player)
			{
				player.removeEventListener(VideoPlayerEvent.READY, layout);
				player.removeEventListener(VideoPlayerEvent.DIMENSIONS_CHANGED, redispatch);
				player.dispose();
			}
			player = null;
			
			if(controls)
			{
				controls.dispose();
			}
			controls = null;
			
			if(border)
				border.graphics.clear();
			border = null;
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
			
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( VideoPlayback );
	}
}
