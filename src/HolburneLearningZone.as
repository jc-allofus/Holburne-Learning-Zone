package
{
	import com.allofus.shared.logging.LogWriter;
	import com.allofus.shared.logging.MonsterDebuggerTarget;
	import com.allofus.shared.logging.SOSLoggingTarget;
	import com.allofus.shared.logging.formatters.JSONFormatter;

	import mx.logging.Log;
	import mx.logging.LogEventLevel;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;

	/**
	 * @author jc
	 */
	public class HolburneLearningZone extends Sprite
	{
		public function HolburneLearningZone()
		{
			if(stage)initApp();
			else addEventListener(Event.ADDED_TO_STAGE, initApp);
		}
		
		protected function initApp(event:Event = null):void
		{
			//initializeTraceLogging();
			initializeSOSLogging();
			initializeMonsterDebuggerLogging();
			initializeFileLogging();
			//createContext();
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
	}
}
