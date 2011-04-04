package com.allofus.holburne.learningzone.view.component.video
{
	import com.allofus.holburne.learningzone.guiassets.PauseDownSkin;
	import com.allofus.holburne.learningzone.guiassets.PauseUpSkin;
	import com.allofus.holburne.learningzone.guiassets.PlayDownSkin;
	import com.allofus.holburne.learningzone.guiassets.PlayUpSkin;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class PlayPauseButton extends Sprite
	{
		
		public static const PAUSE_SHOWING:String = "ppButton/PauseShowing";
		public static const PLAY_SHOWING:String = "ppButton/PlayShowing";
		
		protected var playUpSkin:Sprite;
		protected var playDownSkin:Sprite;
		protected var pauseUpSkin:Sprite;
		protected var pauseDownSkin:Sprite;
		
		protected var currentUpSkin:Sprite;
		protected var currentDownSkin:Sprite;
		
		public function PlayPauseButton()
		{
			buttonMode = true;
			mouseChildren = false;
			
			playUpSkin = new PlayUpSkin();
			playDownSkin = new PlayDownSkin();
			pauseUpSkin = new PauseUpSkin();
			pauseDownSkin = new PauseDownSkin();
			
			addChild(playUpSkin);
			addChild(pauseUpSkin);
			addChild(playDownSkin);
			addChild(pauseDownSkin);
			
			addEventListener(Event.ADDED_TO_STAGE, addListeners);
			setState();
		}
		
		protected function addListeners(event:Event = null):void
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(Event.REMOVED_FROM_STAGE, dispose);
			if(stage)stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		protected function removeListeners() : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addListeners);
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			removeEventListener(Event.REMOVED_FROM_STAGE, dispose);
			if(stage)stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		protected function onMouseUp(event:Event = null):void
		{
			logger.error("skin off.");
			currentDownSkin.visible = false;
		}
		
		protected function onMouseDown(event:Event = null):void
		{
			logger.error("skin on.");
			currentDownSkin.visible = true;
		}
		
		public function setState(value:String = PLAY_SHOWING):void
		{
			logger.info("set state: " + value);
			switch (value)
			{
				case PLAY_SHOWING:
					pauseUpSkin.visible = pauseDownSkin.visible = playDownSkin.visible = false;
					playUpSkin.visible = true;
					currentUpSkin = playUpSkin;
					currentDownSkin = playDownSkin;
					break;
					
				case PAUSE_SHOWING:
					playUpSkin.visible = playDownSkin.visible = pauseDownSkin.visible = false;
					pauseUpSkin.visible = true;
					currentUpSkin = pauseUpSkin;
					currentDownSkin = pauseDownSkin;
					break;
			}
		}
		
		public function dispose(event:Event = null):void
		{
			removeListeners();
			while(numChildren < 0)
			{
				removeChildAt(0);
			}
			
			playUpSkin = null;
			playDownSkin = null;
			pauseUpSkin = null;
			pauseDownSkin = null;
			currentDownSkin = null;
			currentUpSkin = null;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( PlayPauseButton );
		
	}
}
