package com.allofus.holburne.learningzone.view.component.video
{
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.allofus.shared.util.StringUtil;

	import mx.logging.ILogger;

	import flash.display.Sprite;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class VideoTimeDisplay extends Sprite
	{
		protected var currentTime:TextField;
		protected var duration:TextField;
		protected var separator:TextField;
		
		public function VideoTimeDisplay()
		{
			currentTime = FontManager.createTextField("<p class='videoTime'>00:00</p>", 10);
			separator = FontManager.createTextField("<p class='videoTime'> / </p>", 10);
			duration = FontManager.createTextField("<p class='videoTime'>00:00</p>", 10);
			
			PositionUtil.positionToTheRight(separator, currentTime);
			PositionUtil.positionToTheRight(duration, separator);
			
			addChild(currentTime);
			addChild(separator);
			addChild(duration);
		}

		public function update(currentTimeString : Number, durationString : Number) : void
		{
			currentTime.htmlText = "<p class='videoTime'>" + StringUtil.formatTime(currentTimeString) + "</p>";
			duration.htmlText = "<p class='videoTime'>" + StringUtil.formatTime(durationString) + "</p>";
		}

		public function dispose() : void
		{
			currentTime = null;
			separator = null;
			duration = null;
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( VideoTimeDisplay );
	}
}
