package
{
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.logging.LogWriter;
	import com.allofus.shared.logging.MonsterDebuggerTarget;
	import com.allofus.shared.logging.SOSLoggingTarget;
	import com.allofus.shared.logging.formatters.JSONFormatter;

	import org.robotlegs.mvcs.Context;

	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEventLevel;

	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.InvokeEvent;
	import flash.filesystem.File;
	import flash.ui.Mouse;

	/**
	 * @author jc
	 */
	public class HolburneLearningZone extends Sprite
	{
		
		private var context:Context;
		
		public var backgroundLayer:Sprite;
		public var homepageLayer:Sprite;
		public var chapterLayer:Sprite; 
		public var blankOutLayer:Sprite;
		public var frameBorderLayer:Sprite;
		public var chapterMenuLayer:Sprite;
		public var splashScreenLayer:Sprite;
		public var debugLayer:Sprite;
		
		protected var _mouseVisible:Boolean = false;
		
		public function HolburneLearningZone()
		{
			if(stage)initApp();
			else addEventListener(Event.ADDED_TO_STAGE, initApp);
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, onApplicationInvoked);
		}
		
		protected function initApp(event:Event = null):void
		{
			//initializeTraceLogging();
			initializeSOSLogging();
			initializeMonsterDebuggerLogging();
			initializeFileLogging();
			testLogging();
			createLayers();
			createContext();
		}
		
		protected function onApplicationInvoked(event:InvokeEvent):void
		{
			stage.scaleMode = StageScaleMode.SHOW_ALL;
		}
		
		protected function initializeMonsterDebuggerLogging():void
		{
			var monsterTarget : MonsterDebuggerTarget = new MonsterDebuggerTarget(this);
			monsterTarget.includeCategory = true;
			monsterTarget.includeDate = false;
			monsterTarget.includeLevel = true;
			monsterTarget.includeTime = false;
			Log.addTarget(monsterTarget);
		}		
		
		protected function initializeSOSLogging() : void
		{
			var sosLoggingTarget : SOSLoggingTarget = new SOSLoggingTarget();
			sosLoggingTarget.includeCategory = true;
			sosLoggingTarget.includeDate = true;
			sosLoggingTarget.includeLevel = true;
			sosLoggingTarget.includeTime = true;
//			sosLoggingTarget.level = LogEventLevel.WARN;
			Log.addTarget(sosLoggingTarget);
		}
		
		protected function initializeFileLogging() : void
		{
			var logFile:File = File.applicationStorageDirectory.resolvePath("log/application_log.txt");
			var fileLogTarget : LogWriter = new LogWriter(logFile, new JSONFormatter());
			fileLogTarget.includeCategory = true;
			fileLogTarget.includeDate = true;
			fileLogTarget.includeLevel = true;
			fileLogTarget.includeTime = true;
			//only log level WARN and above
			fileLogTarget.level = LogEventLevel.WARN;
			Log.addTarget(fileLogTarget);
		}
		
		protected function testLogging():void
		{
			logger.debug("test debug.");
			logger.info("test info.");
			logger.warn("test warn.");
			logger.error("test error.");
			logger.fatal("test fatal");
		}
		
		protected function createLayers():void
		{
			backgroundLayer = new Sprite();
			homepageLayer = new Sprite();
			blankOutLayer = new Sprite();
			chapterLayer = new Sprite();
			frameBorderLayer = new Sprite();
			chapterMenuLayer = new Sprite();
			splashScreenLayer = new Sprite();
			debugLayer = new Sprite();
			
			addChild(backgroundLayer);
			addChild(homepageLayer);
			addChild(blankOutLayer);
			addChild(chapterLayer);
			addChild(frameBorderLayer);
			addChild(chapterMenuLayer);
			addChild(splashScreenLayer);
			addChild(debugLayer);
		}
		
		public function clearLayer(layer:Sprite):void
		{
			while (layer.numChildren > 0)
			{
				layer.removeChildAt(0);
			}
		}
		
		protected function createContext():void
		{
			context = new HolburneLearningZoneContext(this);
		}
		
		public function set mouseVisible(value:Boolean):void
		{
			if(value)
			{
				Mouse.show();	
			}
			else
			{
				Mouse.hide();
			}
			_mouseVisible = value;
		}
		
		public function get mouseVisible():Boolean
		{
			return _mouseVisible;
		}
	
		
		private static const logger : ILogger = GetLogger.qualifiedName(HolburneLearningZone);

	}
}
