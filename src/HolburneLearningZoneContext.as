package
{
	import com.allofus.holburne.learningzone.view.chapter.chapter04.Slide_4_4_3VCMediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter04.Slide_4_4_3VC;
	import com.allofus.holburne.learningzone.ApplicationMediator;
	import com.allofus.holburne.learningzone.controller.ApplicationStatusChanged;
	import com.allofus.holburne.learningzone.controller.ChapterSelectedCommand;
	import com.allofus.holburne.learningzone.controller.CleanupChaptersCommand;
	import com.allofus.holburne.learningzone.controller.CloseChapterCommand;
	import com.allofus.holburne.learningzone.controller.TakeScreenshotCommand;
	import com.allofus.holburne.learningzone.controller.ToggleMouseVisibleCommand;
	import com.allofus.holburne.learningzone.controller.startup.StartupCommand;
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.holburne.learningzone.events.ChapterEvent;
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.events.UtilEvent;
	import com.allofus.holburne.learningzone.model.ApplicationStatusModel;
	import com.allofus.holburne.learningzone.model.Chapter01Model;
	import com.allofus.holburne.learningzone.model.Chapter02Model;
	import com.allofus.holburne.learningzone.model.Chapter03Model;
	import com.allofus.holburne.learningzone.model.Chapter04Model;
	import com.allofus.holburne.learningzone.model.Chapter05Model;
	import com.allofus.holburne.learningzone.model.Chapter06Model;
	import com.allofus.holburne.learningzone.model.Chapter07Model;
	import com.allofus.holburne.learningzone.model.Chapter08Model;
	import com.allofus.holburne.learningzone.model.Chapter09Model;
	import com.allofus.holburne.learningzone.model.Chapter10Model;
	import com.allofus.holburne.learningzone.model.Chapter11Model;
	import com.allofus.holburne.learningzone.model.Chapter12Model;
	import com.allofus.holburne.learningzone.model.Chapter13Model;
	import com.allofus.holburne.learningzone.model.Chapter14Model;
	import com.allofus.holburne.learningzone.model.Chapter15Model;
	import com.allofus.holburne.learningzone.model.Chapter16Model;
	import com.allofus.holburne.learningzone.model.Chapter17Model;
	import com.allofus.holburne.learningzone.model.Chapter18Model;
	import com.allofus.holburne.learningzone.model.Chapter19Model;
	import com.allofus.holburne.learningzone.model.Chapter20Model;
	import com.allofus.holburne.learningzone.model.ConfigProxy;
	import com.allofus.holburne.learningzone.model.InternetConnectionProxy;
	import com.allofus.holburne.learningzone.service.XMLFeedService;
	import com.allofus.holburne.learningzone.view.background.BackgroundVC;
	import com.allofus.holburne.learningzone.view.background.BackgroundVCMediator;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterView;
	import com.allofus.holburne.learningzone.view.chapter.chapter01.Chapter01;
	import com.allofus.holburne.learningzone.view.chapter.chapter01.Chapter01Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter02.Chapter02;
	import com.allofus.holburne.learningzone.view.chapter.chapter02.Chapter02Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter03.Chapter03;
	import com.allofus.holburne.learningzone.view.chapter.chapter03.Chapter03Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter04.Chapter04;
	import com.allofus.holburne.learningzone.view.chapter.chapter04.Chapter04Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter05.Chapter05;
	import com.allofus.holburne.learningzone.view.chapter.chapter05.Chapter05Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter06.Chapter06;
	import com.allofus.holburne.learningzone.view.chapter.chapter06.Chapter06Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter07.Chapter07;
	import com.allofus.holburne.learningzone.view.chapter.chapter07.Chapter07Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter08.Chapter08;
	import com.allofus.holburne.learningzone.view.chapter.chapter08.Chapter08Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter09.Chapter09;
	import com.allofus.holburne.learningzone.view.chapter.chapter09.Chapter09Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter10.Chapter10;
	import com.allofus.holburne.learningzone.view.chapter.chapter10.Chapter10Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter11.Chapter11;
	import com.allofus.holburne.learningzone.view.chapter.chapter11.Chapter11Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter12.Chapter12;
	import com.allofus.holburne.learningzone.view.chapter.chapter12.Chapter12Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter13.Chapter13;
	import com.allofus.holburne.learningzone.view.chapter.chapter13.Chapter13Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter14.Chapter14;
	import com.allofus.holburne.learningzone.view.chapter.chapter14.Chapter14Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter15.Chapter15;
	import com.allofus.holburne.learningzone.view.chapter.chapter15.Chapter15Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter16.Chapter16;
	import com.allofus.holburne.learningzone.view.chapter.chapter16.Chapter16Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter17.Chapter17;
	import com.allofus.holburne.learningzone.view.chapter.chapter17.Chapter17Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter18.Chapter18;
	import com.allofus.holburne.learningzone.view.chapter.chapter18.Chapter18Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter19.Chapter19;
	import com.allofus.holburne.learningzone.view.chapter.chapter19.Chapter19Mediator;
	import com.allofus.holburne.learningzone.view.chapter.chapter20.Chapter20;
	import com.allofus.holburne.learningzone.view.chapter.chapter20.Chapter20Mediator;
	import com.allofus.holburne.learningzone.view.component.video.VideoControls;
	import com.allofus.holburne.learningzone.view.component.video.VideoControlsMediator;
	import com.allofus.holburne.learningzone.view.component.video.VideoPlayer;
	import com.allofus.holburne.learningzone.view.component.video.VideoPlayerMediator;
	import com.allofus.holburne.learningzone.view.debug.DebugVC;
	import com.allofus.holburne.learningzone.view.debug.DebugViewMediator;
	import com.allofus.holburne.learningzone.view.frame.BlankOutMediator;
	import com.allofus.holburne.learningzone.view.frame.BlankOutVC;
	import com.allofus.holburne.learningzone.view.homepage.HomePage1Mediator;
	import com.allofus.holburne.learningzone.view.homepage.HomepageSingleClickVC;
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
			injector.mapSingleton(XMLFeedService);
			
			//model/menu structure
			injector.mapSingleton(Chapter01Model);
			injector.mapSingleton(Chapter02Model);
			injector.mapSingleton(Chapter03Model);
			injector.mapSingleton(Chapter04Model);
			injector.mapSingleton(Chapter05Model);
			injector.mapSingleton(Chapter06Model);
			injector.mapSingleton(Chapter07Model);
			injector.mapSingleton(Chapter08Model);
			injector.mapSingleton(Chapter09Model);
			injector.mapSingleton(Chapter10Model);
			injector.mapSingleton(Chapter11Model);
			injector.mapSingleton(Chapter12Model);
			injector.mapSingleton(Chapter13Model);
			injector.mapSingleton(Chapter14Model);
			injector.mapSingleton(Chapter15Model);
			injector.mapSingleton(Chapter16Model);
			injector.mapSingleton(Chapter17Model);
			injector.mapSingleton(Chapter18Model);
			injector.mapSingleton(Chapter19Model);
			injector.mapSingleton(Chapter20Model);
			
			//VIEW
			mediatorMap.mapView(HolburneLearningZone, ApplicationMediator); //document class		
			mediatorMap.createMediator(contextView); 						//create mediator for document class
			
			mediatorMap.mapView(BackgroundVC, BackgroundVCMediator);
			mediatorMap.mapView(SplashScreen, SplashScreenMediator);//600 x 350 
			mediatorMap.mapView(BlankOutVC, BlankOutMediator);
			mediatorMap.mapView(DebugVC, DebugViewMediator);
			mediatorMap.mapView(ChapterMenu, ChapterMenuMediator);
//			mediatorMap.mapView(HomepageVC, HomePage1Mediator);
			mediatorMap.mapView(HomepageSingleClickVC, HomePage1Mediator);
			mediatorMap.mapView(VideoControls, VideoControlsMediator);
			mediatorMap.mapView(VideoPlayer, VideoPlayerMediator);
			
			//chapters
			mediatorMap.mapView(Chapter01, Chapter01Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter02, Chapter02Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter03, Chapter03Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter04, Chapter04Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter05, Chapter05Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter06, Chapter06Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter07, Chapter07Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter08, Chapter08Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter09, Chapter09Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter10, Chapter10Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter11, Chapter11Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter12, Chapter12Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter13, Chapter13Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter14, Chapter14Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter15, Chapter15Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter16, Chapter16Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter17, Chapter17Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter18, Chapter18Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter19, Chapter19Mediator, AbstractChapterView);
			mediatorMap.mapView(Chapter20, Chapter20Mediator, AbstractChapterView);
			
			//slides who need mediators
			mediatorMap.mapView(Slide_4_4_3VC, Slide_4_4_3VCMediator);
			
			//CONTROLLER
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand);
			commandMap.mapEvent(ApplicationStatusEvent.CHANGED, ApplicationStatusChanged);
			commandMap.mapEvent(UtilEvent.TAKE_SCREENSHOT, TakeScreenshotCommand);
			commandMap.mapEvent(UtilEvent.TOGGLE_MOUSE_VISIBLE, ToggleMouseVisibleCommand);
			commandMap.mapEvent(ChapterEvent.SELECTED, ChapterSelectedCommand);
			commandMap.mapEvent(ChapterEvent.CLEANUP, CleanupChaptersCommand);
			commandMap.mapEvent(ChapterMenuEvent.CLOSE_CHAPTER, CloseChapterCommand);
			
			//kick it off
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HolburneLearningZoneContext );
	}
}