package com.allofus.holburne.learningzone
{
	import com.greensock.easing.Sine;
	/**
	 * @author jc
	 */
	public class AppGlobals
	{
		public static const CONFIG_XML:String = "assets/config.xml";
		public static const APP_WIDTH:int = 1920;
		public static const APP_HEIGHT:int = 1080;
		
		//these dimensions define the LEFT target rectangle which items are positioned relative to 
		public static const LEFT_FRAME_X:int = 64;
		public static const LEFT_FRAME_Y:int = 30;
		public static const LEFT_FRAME_WIDTH:int = 894;
		public static const LEFT_FRAME_HEIGHT:int = 850;
		
		//these dimensions define RIGHT target rectangle which items are positioned relative to
		public static const RIGHT_FAME_X:int = 1035;
		public static const RIGHT_FRAME_Y:int = 115;
		public static const RIGHT_FRAME_WIDTH:int = 740;
		public static const RIGHT_FRAME_HEIGHT:int = 595;
		
		//for drawing border for visual assets
		public static const BORDER_SIZE:int = 20;
		public static const BORDER_COLOR:uint = 0xFFFFFF;
		
		//animation vars
		public static const FADE_DURATION:Number = 0.5;
		public static const FADE_EASE:Function = Sine.easeOut;
		public static const DROPSHADOW:Object = {color:0x333333, alpha:1, blurX:12, blurY:12, strength:1, angle:45, distance:5};
		public static const GLOW_ON:Object = {color:0x333333, alpha:1, blurX:12, blurY:12, strength:1, inner:false, knockout:false, quality:1};
		public static const GLOW_OFF:Object = {color:0x333333, alpha:0, blurX:0, blurY:0, strength:1, inner:false, knockout:false, quality:1, remove:true};
		
		public static const TRANSITION_STAGGER:Number = 0.1;
	}
}
