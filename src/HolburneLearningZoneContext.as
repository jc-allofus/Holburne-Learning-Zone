package
{
	import com.allofus.holburne.learningzone.controller.CleanupChaptersCommand;
	import com.allofus.holburne.learningzone.model.Chapter1Model;
	import com.allofus.holburne.learningzone.ApplicationMediator;
	import com.allofus.holburne.learningzone.controller.ApplicationStatusChanged;
	import com.allofus.holburne.learningzone.controller.ChapterSelectedCommand;
	import com.allofus.holburne.learningzone.controller.CloseChapterCommand;
	import com.allofus.holburne.learningzone.controller.TakeScreenshotCommand;
	import com.allofus.holburne.learningzone.controller.startup.StartupCommand;
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.holburne.learningzone.events.ChapterEvent;
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.events.UtilEvent;
	import com.allofus.holburne.learningzone.model.ApplicationStatusModel;
	import com.allofus.holburne.learningzone.model.ConfigProxy;
	import com.allofus.holburne.learningzone.model.InternetConnectionProxy;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterView;
	import com.allofus.holburne.learningzone.view.chapter.chapter01.Chapter01;
	import com.allofus.holburne.learningzone.view.chapter.chapter01.Chapter01Mediator;
	import com.allofus.holburne.learningzone.view.debug.DebugVC;
	import com.allofus.holburne.learningzone.view.debug.DebugViewMediator;
	import com.allofus.holburne.learningzone.view.frame.BlankOutMediator;
	import com.allofus.holburne.learningzone.view.frame.BlankOutVC;
	import com.allofus.holburne.learningzone.view.homepage.HomePage1Mediator;
	import com.allofus.holburne.learningzone.view.homepage.HomepageVC;
	import com.allofus.holburne.learningzone.view.menu.ChapterMenu;
	import com.allofus.holburne.learningzone.view.menu.ChapterMenuMediator;
	import com.allofus.holburne.learningzone.view.splash.SplashScreen;
	import com.allofus.holburne.learningzone.view.splash.SplashScreenMediator;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import mx.logging.ILogger;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author jc
	 */
	public class HolburneLearningZoneContext extends Context
	{
		public function HolburneLearningZoneContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			//MODEL & SERVICES
			injector.mapSingleton(ApplicationStatusModel);
			injector.mapSingleton(ConfigProxy);
			injector.mapSingleton(InternetConnectionProxy);
			injector.mapSingleton(Chapter1Model);
			
			//VIEW
			mediatorMap.mapView(HolburneLearningZone, ApplicationMediator); //document class		
			mediatorMap.createMediator(contextView); 						//create mediator for document class
				
			mediatorMap.mapView(SplashScreen, SplashScreenMediator);//600 x 350 
			mediatorMap.mapView(BlankOutVC, BlankOutMediator);
			mediatorMap.mapView(DebugVC, DebugViewMediator);
			mediatorMap.mapView(HomepageVC, HomePage1Mediator);
			mediatorMap.mapView(Chapter01, Chapter01Mediator, AbstractChapterView);
			mediatorMap.mapView(ChapterMenu, ChapterMenuMediator);
			
			//CONTROLLER
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand);
			commandMap.mapEvent(ApplicationStatusEvent.CHANGED, ApplicationStatusChanged);
			commandMap.mapEvent(UtilEvent.TAKE_SCREENSHOT, TakeScreenshotCommand);
			commandMap.mapEvent(ChapterEvent.SELECTED, ChapterSelectedCommand);
			commandMap.mapEvent(ChapterEvent.CLEANUP, CleanupChaptersCommand);
			commandMap.mapEvent(ChapterMenuEvent.CLOSE_CHAPTER, CloseChapterCommand);
			
			//kick it off
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HolburneLearningZoneContext );
	}
}