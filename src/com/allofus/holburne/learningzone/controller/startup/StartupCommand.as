package com.allofus.holburne.learningzone.controller.startup
{
	import com.allofus.holburne.learningzone.controller.FSMConstants;
	import com.allofus.holburne.learningzone.view.splash.SplashScreen;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.FSMInjector;
	import org.robotlegs.utilities.statemachine.StateEvent;
	import org.robotlegs.utilities.statemachine.StateMachine;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class StartupCommand extends Command
	{
		override public function execute():void
		{
			//make splash screen
			HolburneLearningZone(contextView).splashScreenLayer.addChild(new SplashScreen());
			
			//map fsm events to commands
			commandMap.mapEvent(FSMConstants.LOAD_CONFIG, LoadConfigCommand);
			commandMap.mapEvent(FSMConstants.DETECT_INTERNET_CONNECTION, DetectInternetConnectionCommand);
			commandMap.mapEvent(FSMConstants.CHECK_APP_UPDATE, CheckApplicationUpdateCommand);
			commandMap.mapEvent(FSMConstants.PREPARE_MODELS, PrepareModelCommand);
			commandMap.mapEvent(FSMConstants.CONSTRUCT_VIEW, ConstructInitialViewCommand);
			commandMap.mapEvent(FSMConstants.DO_APP_RUNNING, AppRunningCommand);
			commandMap.mapEvent(FSMConstants.DO_BOOTSTRAP_FAIL, DoBootstrapFailCommand);

			//wire up FSM
			var smInjector:FSMInjector = new FSMInjector( FSMConstants.FSM );
			var sm:StateMachine = new StateMachine(eventDispatcher);
			smInjector.inject(sm);
			
			//fire it up!
			dispatch(new StateEvent(StateEvent.ACTION));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( StartupCommand );
	}
}
