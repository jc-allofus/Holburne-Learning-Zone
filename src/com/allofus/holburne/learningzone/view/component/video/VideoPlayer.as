package com.allofus.holburne.learningzone.view.component.video
{
	import com.allofus.holburne.learningzone.events.VideoPlayerEvent;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;

	/**
	 * @author jc
	 */
	public class VideoPlayer extends Sprite
	{
		public var id:String;
		
		protected var _videoWidth:int = 360;
		protected var _videoHeight:int = 240;
				
		protected var connection:NetConnection;
		protected var stream:NetStream;
		protected var video:Video;
		
		protected var _renderState:String;
		protected var _videoAttached : Boolean = false;
		
		protected var _vidURL:String;
		protected var _autoplay:Boolean = false;
		protected var _duration:Number;
		protected var _isPlaying:Boolean = false;
		
		protected var _metadataSet:Boolean = false;

		public function VideoPlayer(id:String, vidURL:String = null)
		{
			this.id = id;
			_vidURL = vidURL;
			
			if(!stage)
			{
				addEventListener(Event.ADDED_TO_STAGE, initPlayer);
			}
			else
			{
				initPlayer();
			}
		}
		
		public function clearVideo():void
		{
			video.clear();
		}

		protected function initPlayer(event : Event = null) : void
		{
			//logger.debug("initPlayer.");
			
			removeEventListener(Event.ADDED_TO_STAGE, initPlayer);
			
			connection = new NetConnection();
			connection.connect(null);
			
			stream = new NetStream(connection);
			stream.addEventListener(NetStatusEvent.NET_STATUS, handleNetStatus);
			stream.client = this;
			
			attachVideo();
		}

		protected function attachVideo():void
		{
			video = new Video(videoWidth, videoHeight);
//			video.addEventListener(VideoEvent.RENDER_STATE, handleVideoObjectRender); //available in flash player v10.2, not sure which air runtime
			video.attachNetStream(stream);
			addChild(video);
			_videoAttached = true;
			
			if(_vidURL)
			{
				queueVideo(_vidURL, _autoplay);
			}
		}

		private function handleNetStatus(event : NetStatusEvent) : void
		{
			//logger.debug("status: " + event.info.code);
			switch(event.info["code"])
			{
				case "NetStream.Play.Stop":
					// finished
					logger.debug("stream reached end finished.");
					stream.seek(0);
					pause();
					dispatchEvent(new VideoPlayerEvent(VideoPlayerEvent.PLAYBACK_STATE_CHANGED, VideoPlayerEvent.STATE_FINISHED));
					break;
					
				case "NetStream.Play.StreamNotFound":
					logger.error("stream not found" + _vidURL);
					break;
					
				default:
					//logger.info("here is info: " + event.info);
					break;
			}
		}
		
		public function onMetaData(e:Object):void
		{
			//logger.debug("loaded video metadata: " + e["duration"]);
			if(_metadataSet)
				return;
				
			if(e["duration"])
				_duration = Number(e["duration"]);
			
			if(e["width"] && e["height"])
			{
				setVideoDimensions(int(e["width"]), int(e["height"]));
			}
			
			_metadataSet = true;
			
			dispatchEvent(new VideoPlayerEvent(VideoPlayerEvent.READY));
		}
		
		public function onXMPData(e:Object):void
		{
			//logger.debug("got XMPData : " + e);
		}
		
		public function queueVideo(vidURL : String, autoplay:Boolean = false) : void
		{
			//logger.debug("queue video: " + vidURL + ", autoplay: " + autoplay);
			_autoplay = autoplay;
			if (_vidURL != vidURL)
			{
				_vidURL = vidURL;
			}
			
			if(!video) return;

			stream.play(vidURL);
			
			if(stream.time > 0)
			{
				stream.seek(0);
			}
			
			if(_autoplay)
			{
				play();
			}
			else
			{
				pause();
			}
		}
		
		public function pause():void
		{
			stream.pause();
			_isPlaying = false;
			dispatchEvent(new VideoPlayerEvent(VideoPlayerEvent.PLAYBACK_STATE_CHANGED, VideoPlayerEvent.STATE_PAUSED));
		}

		public function play() : void
		{
			stream.resume();
			_isPlaying = true;
			dispatchEvent(new VideoPlayerEvent(VideoPlayerEvent.PLAYBACK_STATE_CHANGED, VideoPlayerEvent.STATE_PLAYING));
		}
		
		public function togglePlayPause() : void
		{
			_isPlaying ? pause() : play();
		}
		
		public function get currentTime():Number
		{
			return stream.time;
		}

		public function get duration() : Number
		{
			return _duration;
		}
		
		override public function toString():String
		{
			return "[VideoPlayer] -> " + id;
		}
		
		protected function bringToTop(vp:DisplayObject):void
		{
			setChildIndex(vp, numChildren -1);
		}

		public function dispose() : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initPlayer);
			
			video.attachNetStream(null);
			video.clear();
			if(contains(video))removeChild(video);
			video = null;

			stream.removeEventListener(NetStatusEvent.NET_STATUS, handleNetStatus);
			stream.close();
			stream = null;

			connection.close();
			connection = null;
		}
		
		
		//just convenience method for setting width & height at the same time and only dispatching one event after...
		protected function setVideoDimensions(width:int, height:int):void
		{
			video.width = _videoWidth = width;
			video.height = _videoHeight = height;
			dispatchEvent(new VideoPlayerEvent(VideoPlayerEvent.DIMENSIONS_CHANGED));
		}


		public function get videoWidth() : int
		{
			return _videoWidth;
		}

		public function set videoWidth(value : int) : void
		{
			video.width = _videoWidth = value;
			dispatchEvent(new VideoPlayerEvent(VideoPlayerEvent.DIMENSIONS_CHANGED));
		}

		public function get videoHeight() : int
		{
			return _videoHeight;
		}

		public function set videoHeight(value : int) : void
		{
			video.height = _videoHeight = value;
			dispatchEvent(new VideoPlayerEvent(VideoPlayerEvent.DIMENSIONS_CHANGED));
		}

		public function get isPlaying() : Boolean
		{
			return _isPlaying;
		}

		public function seekToPercent(value : Number) : void
		{
			if(_duration)
			{
				var time:Number = (value * _duration) / 100;
				stream.seek(time);
				logger.info("stream will go to: " + time + " / " + _duration);	
			}
			else
			{
				logger.warn("cannot seek to percent as I don't have the video's duration: " + _duration);
			}
		}
		
		private static const logger : ILogger = GetLogger.qualifiedName(VideoPlayer);
	}
}
