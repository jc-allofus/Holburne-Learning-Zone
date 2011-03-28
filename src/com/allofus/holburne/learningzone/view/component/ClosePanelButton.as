package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.guiassets.ClosePanelDownSkin;
	import com.allofus.holburne.learningzone.guiassets.ClosePanelUpSkin;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class ClosePanelButton extends Sprite
	{
		protected var upSkin:Bitmap;
		protected var downSkin:Bitmap;
		
		public function ClosePanelButton()
		{
			buttonMode = true;
			mouseChildren = false;
			
			upSkin = new Bitmap(new ClosePanelUpSkin(0,0));
			downSkin = new Bitmap(new ClosePanelDownSkin(0,0));
			
			downSkin.visible = false;
			
			addChild(upSkin);
			addChild(downSkin);
			addEventListener(Event.ADDED_TO_STAGE, enableListeners);
		}
		
		protected function enableListeners(event:Event = null):void
		{
			addEventListener(Event.REMOVED_FROM_STAGE, disableListeners);
			addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
		}
		
		protected function disableListeners(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, enableListeners);
			removeEventListener(Event.REMOVED_FROM_STAGE, disableListeners);
		}
		
		protected function handleMouseUp(event : MouseEvent) : void
		{
			downSkin.visible = false;
		}

		protected function handleMouseDown(event : MouseEvent) : void
		{
			downSkin.visible = true;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ClosePanelButton );
	}
}
