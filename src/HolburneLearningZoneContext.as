package
{
	import com.allofus.holburne.learningzone.view.mediator.ApplicationMediator;
	import com.allofus.holburne.learningzone.model.InternetConnectionProxy;
	import com.allofus.holburne.learningzone.model.ConfigProxy;
	import com.allofus.holburne.learningzone.view.splash.SplashScreenMediator;
	import com.allofus.holburne.learningzone.view.splash.SplashScreen;
	import com.allofus.holburne.learningzone.model.ApplicationStatusModel;
	import com.allofus.holburne.learningzone.controller.ApplicationStatusChanged;
	import com.allofus.holburne.learningzone.events.ApplicationStatusEvent;
	import com.allofus.holburne.learningzone.controller.startup.StartupCommand;
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
			
			//VIEW
			mediatorMap.mapView(HolburneLearningZone, ApplicationMediator); //document class		
			mediatorMap.createMediator(contextView); 						//create mediator for document class
				
			mediatorMap.mapView(SplashScreen, SplashScreenMediator);//600 x 350 ?
			
			//controller
			commandMap.mapEvent(ApplicationStatusEvent.CHANGED, ApplicationStatusChanged);
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand);
			
			//kick it off!
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HolburneLearningZoneContext );
	}
}