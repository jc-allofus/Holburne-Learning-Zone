package com.allofus.holburne.learningzone.view.splash
{
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class SplashScreen extends Sprite
	{
		public static const CLOSE : String = "SplashScreen/CLOSE";
		
		protected var infoLabel:TextField;
		
		public function SplashScreen()
		{
			visible = false;
			
			graphics.beginFill(0x66bb33);
			graphics.drawRect(0, 0, 650, 300);
			
			var fmt:TextFormat = new TextFormat();
			fmt.size = 8;
			fmt.color = 0xffffff;
			fmt.font = "Helvetica, Arial, sans-serif";
			
			infoLabel = new TextField();
			infoLabel.defaultTextFormat = fmt;
			addChild(infoLabel);
		}
		
		public function show():void
		{
			x = Math.round((stage.stageWidth * 0.5) - (width * 0.5));
			y = Math.round((stage.stageHeight * 0.5) - (height * 0.5));
			visible = true;
		}
		
		public function set status(value:String):void
		{
			infoLabel.text = value;
		}

		public function dispose() : void
		{
			visible = false;
			graphics.clear();
			if(contains(infoLabel))removeChild(infoLabel);
			infoLabel = null;
		}
		
		
	}
}
