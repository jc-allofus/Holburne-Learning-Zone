package com.allofus.holburne.learningzone.view.component.video
{
	import com.allofus.holburne.learningzone.events.VideoSeekEvent;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;

	import mx.logging.ILogger;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author jc
	 */
	public class VideoControls extends Sprite
	{
		protected var background:Shape;
		protected var timeDisplay:VideoTimeDisplay;
		
		protected var updateInterval:int = 100;
		protected var updateTimer:Timer;
		protected var videoRef:VideoPlayer;
		protected var playPauseButton:PlayPauseButton;
		protected var progressBar:VideoProgressBar;
		
		protected var resumePlaying:Boolean = true;
		
		public function VideoControls(videoRef:VideoPlayer)
		{
			this.videoRef = videoRef;
			
			background = new Shape();
			background.graphics.beginFill(0x00cc00, 0);
			background.graphics.drawRect(0, 0, 200, 50);
			addChild(background);
			
			updateTimer = new Timer(updateInterval);
			updateTimer.addEventListener(TimerEvent.TIMER, handleUpdateTick);
			
			playPauseButton = new PlayPauseButton();
			playPauseButton.addEventListener(MouseEvent.CLICK, handlePlayPauseClicked);
			addChild(playPauseButton);
			
			timeDisplay = new VideoTimeDisplay();
			addChild(timeDisplay);
			
			progressBar = new VideoProgressBar();
			progressBar.addEventListener(VideoSeekEvent.SEEK_DRAG_STARTED, onSeekDragStarted);
			progressBar.addEventListener(VideoSeekEvent.SEEK_TO_PERCENT, onSeekToPercent);
			progressBar.addEventListener(VideoSeekEvent.SEEK_DRAG_COMPLETE, onSeekDragComplete);
			addChild(progressBar);
			
			
			if(videoRef && videoRef.isPlaying)
				wake();
		}

		protected function handleUpdateTick(event : TimerEvent) : void
		{
			timeDisplay.update(videoRef.currentTime, videoRef.duration);
			updateProgress();
		}

		protected function updateProgress() : void
		{
			var percent:Number = (videoRef.currentTime * 100) / videoRef.duration;
			progressBar.updateProgress(percent);
		}
		
		protected function handlePlayPauseClicked(event:Event):void
		{
			videoRef.togglePlayPause();
		}
		
		private function onSeekDragStarted(event : VideoSeekEvent) : void
		{
			resumePlaying = videoRef.isPlaying;
			videoRef.pause();
		}
		
		private function onSeekToPercent(event : VideoSeekEvent) : void
		{
			videoRef.seekToPercent(event.percent);
		}
		
		private function onSeekDragComplete(event : VideoSeekEvent) : void
		{
			if(resumePlaying)
				videoRef.play();
		}
		

		public function layout() : void
		{
			background.graphics.clear();
			background.graphics.beginFill(0x00cc00, 0);
			background.graphics.drawRect(0, 0, videoRef.videoWidth, 50);
			
			timeDisplay.x = videoRef.videoWidth - timeDisplay.width;
			PositionUtil.centerVertically(timeDisplay, background);
			
			var progressBarWidth:Number = timeDisplay.x - (playPauseButton.x + playPauseButton.width) - (15*2);
			progressBar.setWidth(progressBarWidth);
			PositionUtil.positionToTheRight(progressBar, playPauseButton, 15);
			
			updatePlayPauseButtonState();
		}

		public function wake() : void
		{
			updateTimer.start();
			updatePlayPauseButtonState();
		}
		
		public function sleep():void
		{
			updateTimer.stop();
			updatePlayPauseButtonState();
		}
		
		protected function updatePlayPauseButtonState():void
		{
			var state:String = videoRef.isPlaying ? PlayPauseButton.PAUSE_SHOWING : PlayPauseButton.PLAY_SHOWING;
			playPauseButton.setState(state);
		}


		public function dispose() : void
		{
			if(background)
				background.graphics.clear();
			background = null;
			
			if(timeDisplay)
				timeDisplay.dispose();
			timeDisplay = null;
			
			if(updateTimer)
			{
				updateTimer.stop();
				updateTimer.removeEventListener(TimerEvent.TIMER, handleUpdateTick);
			}
			updateTimer = null;
			
			videoRef = null;
			
			if(playPauseButton)
			{
				playPauseButton.dispose();
				playPauseButton.removeEventListener(MouseEvent.CLICK, handlePlayPauseClicked);
			}
			playPauseButton = null;
			
			if(progressBar)
			{
				progressBar.dispose();
				progressBar.removeEventListener(VideoSeekEvent.SEEK_DRAG_STARTED, onSeekDragStarted);
				progressBar.removeEventListener(VideoSeekEvent.SEEK_TO_PERCENT, onSeekToPercent);
				progressBar.removeEventListener(VideoSeekEvent.SEEK_DRAG_COMPLETE, onSeekDragComplete);
			}
			progressBar = null;
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
		}

		private static const logger : ILogger = GetLogger.qualifiedName(VideoControls);
	}
}
