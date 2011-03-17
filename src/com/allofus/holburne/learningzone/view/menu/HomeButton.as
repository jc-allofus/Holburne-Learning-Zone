package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.swcassets.menu.HomeTab;
	import com.allofus.holburne.learningzone.swcassets.menu.HomeTabClicked;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class HomeButton extends Sprite
	{
		protected var homeTab:Bitmap;
		protected var homeTabSelected:Bitmap;
		protected var label:TextField;
		
		public function HomeButton()
		{
			buttonMode = true;
			mouseChildren = false;

			homeTab = new Bitmap(new HomeTab(0,0));
			homeTabSelected = new Bitmap(new HomeTabClicked(0,0));
			label = FontManager.createTextField("<p class='buttonLabel'>HOME</p>");
			
			addChild(homeTab);
			addChild(homeTabSelected);
			addChild(label);
			
			homeTabSelected.visible = false;
			
			PositionUtil.centerHorizontally(label, homeTab);
			PositionUtil.centerVertically(label, homeTab);

			addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			addEventListener(MouseEvent.CLICK, handleClick);
			addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}

		protected function handleAddedToStage(event : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
			stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
		}

		
		private function handleMouseUp(event : MouseEvent) : void
		{
			if(homeTabSelected.visible)
			{
				handleClick();
			}
		}
		
		protected function handleMouseDown(event:MouseEvent):void
		{
			homeTabSelected.visible = true;
		}
		
		protected function handleClick(event:MouseEvent = null):void
		{
			if(homeTabSelected.visible) //just to make sure we aren't doing this 2x in the case where we get the MOUSE_UP and CLICK events
			{
				homeTabSelected.visible = false;
				dispatchEvent(new Event(Event.CLOSE));
			}
		}
		
		public function dispose():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
			if(stage)stage.removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
			removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);			
			removeEventListener(MouseEvent.CLICK, handleClick);
			
			while (numChildren > 0)
			{
				removeChildAt(0);
			}
			
			homeTab = null;
			homeTabSelected = null;
			label = null;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HomeButton );
	}
}
