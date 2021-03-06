package com.allofus.holburne.learningzone.controller
{
	/**
	 * @author jc
	 */
	public class FSMConstants
	{
		public static const LOAD_CONFIG:String							= "event/loadConfigCommand";
		public static const LOADING_CONFIG:String						= "state/loadingConfig";
		public static const LOADING_CONFIG_SUCCESS:String  				= "action/loadingConfig/success";
		public static const LOADING_CONFIG_FAILED:String				= "action/loadingConfig/failed";
		
		public static const DETECT_INTERNET_CONNECTION:String 			= "event/detectInternetConnection";
		public static const DETECTING_INTERNET_CONNECTION:String 		= "state/detectingInternetConnection";
		public static const INITIAL_CONNECTION_ON:String 				= "action/detectingInternetConnection/on"; 
		public static const INITIAL_CONNECTION_OFF:String				= "action/detectingInternetConnection/off";
		public static const DETECT_INTERNET_CONNECTION_SUCCESS:String 	= "action/detectingInternetConnection/success";
		public static const DETECT_INTERNET_CONNECTION_FAILED:String 	= "action/detectingInternetConnection/failed";
		
		public static const CHECK_APP_UPDATE:String						= "event/checkApplicationUpdate";
		public static const CHECKING_APP_UPDATE:String					= "state/checkingApplicationUpdate";
		public static const CHECKING_APP_UPDATE_SUCCESS:String			= "action/checkingAppUpdateSuccess";
		public static const CHECKING_APP_UPDATE_FAIL:String				= "aciton/checkingAppUpdateFail";
		
		public static const PREPARE_MODELS:String						= "event/prepareModelsCommand";
		public static const PREPARING_MODELS:String						= "state/preparingModels";
		public static const PREPARE_MODELS_SUCCESS:String				= "action/prepareModelsSuccess";
		public static const PREPARE_MODELS_FAILED:String				= "action/prepareModelsFailed";
		
		public static const CONSTRUCT_VIEW:String						= "event/constructView";
		public static const CONSTRUCTING_VIEW:String					= "state/constructingView";
		public static const CONSTRUCTING_VIEW_COMPLETE:String			= "action/constructingViewComplete";
		
		public static const APPLICATION_RUNNING:String					= "state/app/running";
		public static const DO_APP_RUNNING:String						= "event/doIntroAnimation";
		public static const BOOTSTRAP_FAILED:String						= "state/bootstrap/failed";
		public static const DO_BOOTSTRAP_FAIL:String					= "event/doBootstrapFailCommand";
		
		public static const FSM:XML = 
			<fsm initial={LOADING_CONFIG}>
			   
			    <!-- LOAD CONFIG FILE, THIS COMES FROM NativeApp.APPDirectory -->
				<state name={LOADING_CONFIG} changed={LOAD_CONFIG}>
					<transition action={LOADING_CONFIG_SUCCESS} target={DETECTING_INTERNET_CONNECTION}/>
					<transition action={LOADING_CONFIG_FAILED} target={BOOTSTRAP_FAILED}/>
				</state> 
				
				<state name={DETECTING_INTERNET_CONNECTION} changed={DETECT_INTERNET_CONNECTION}>
					<transition action={DETECT_INTERNET_CONNECTION_FAILED} target={BOOTSTRAP_FAILED} />
					<transition action={INITIAL_CONNECTION_ON} target={CHECKING_APP_UPDATE} />
					<transition action={INITIAL_CONNECTION_OFF} target={PREPARING_MODELS} />-->
				</state>
				
				<state name={CHECKING_APP_UPDATE} changed={CHECK_APP_UPDATE}>
					<transition action={CHECKING_APP_UPDATE_SUCCESS} target={PREPARING_MODELS} />
					<!-- if we get a fail on updating the air app, continue to try booting normally anyway -->
					<transition action={CHECKING_APP_UPDATE_FAIL} target={PREPARING_MODELS} />
				</state>
				
				<state name={PREPARING_MODELS} changed={PREPARE_MODELS}>
					<transition action={PREPARE_MODELS_SUCCESS} target={CONSTRUCTING_VIEW} />
					<transition action={PREPARE_MODELS_FAILED} target={BOOTSTRAP_FAILED} />				
				</state>
				
				<state name={CONSTRUCTING_VIEW} changed={CONSTRUCT_VIEW}>
					<transition action={CONSTRUCTING_VIEW_COMPLETE} target={APPLICATION_RUNNING} />
				</state>
				
				<!-- SUCCESS! Kick the application off to the user... -->
				<state name={APPLICATION_RUNNING} changed={DO_APP_RUNNING}>
				</state>
				
				<!-- FAIL :( Something went wrong, now sort it out -->		
				<state name={BOOTSTRAP_FAILED} changed={DO_BOOTSTRAP_FAIL} />
				
			</fsm>;
	}
}
