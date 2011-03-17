package com.allofus.holburne.learningzone.controller
{
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.graphics.codec.JPEGEncoder;
	import mx.logging.ILogger;

	import flash.display.BitmapData;
	import flash.filesystem.File;
	import flash.utils.ByteArray;

	/**
	 * take a screenshot of the app, used just for development (should be disabled for launch); encoding bytearray is slowwwwww at larger resolutions
	 * @author jc
	 */
	public class TakeScreenshotCommand extends Command
	{
		protected static const SCREENSHOT_DIR:String = "HolburneLearningZoneScreenshots";
		
		override public function execute():void
		{
			var d:Date = new Date();
			var ds:String = d.toString();
			logger.info("take screenshot, save to user's documents directory: " + ds);
			
			//draw stage to bitmap
			var ssBmd:BitmapData = new BitmapData(AppGlobals.APP_WIDTH, AppGlobals.APP_HEIGHT);
			ssBmd.draw(contextView);	
			
			//encoder w/ compression level 0 to 100
			var jpgenc:JPEGEncoder = new JPEGEncoder(60);
			
			//encode to byteArray
			var imgBA:ByteArray = jpgenc.encode(ssBmd);
			
			// path to save img-> /home/documents/SCREENSHOT_DIR/file.jpg
			var file:File = File.documentsDirectory.resolvePath(SCREENSHOT_DIR + File.separator + ds + ".jpg");
			
			var fs:FileStream = new FileStream();
			
			try
			{
				fs.open(file, FileMode.WRITE);
				fs.writeBytes(imgBA);
				fs.close();
			}
			catch (e:Error)
			{
				logger.fatal("error writing snapshot to disk: " + e);
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( TakeScreenshotCommand );
	}
}
