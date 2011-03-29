package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.guiassets.ImageSlideControlUpSkin;
	import com.allofus.learningzone.guiassets.ImageSlideControlDownSkin;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	/**
	 * @author jc
	 */
	public class ImageSliderControl extends Sprite
	{
		public static const UPDATE : String = "imageSliderControl/dragUpdate";
		protected var constraintRect:Rectangle;
		
		protected var line:Shape;
		protected var slideUpSkin:Sprite;
		protected var slideDownSkin:Sprite;
		
		public function ImageSliderControl(refObj:DisplayObject)
		{
			constraintRect = new Rectangle(refObj.x, refObj.y, refObj.width, refObj.height);
			
			slideUpSkin = new ImageSlideControlUpSkin();
			slideDownSkin = new ImageSlideControlDownSkin();
			slideDownSkin.visible = false;
			
			var halfHeight:int = Math.round(refObj.height * 0.5);
			
			line = new Shape();
			line.graphics.lineStyle(1,0xffffff);
			line.graphics.moveTo(0, -halfHeight);
			line.graphics.lineTo(0, halfHeight);
			
			addChild(line);
			addChild(slideUpSkin);
			addChild(slideDownSkin);
			
			y = halfHeight;
			
			addEventListener(Event.ADDED_TO_STAGE, enableListeners);
		}
		
		protected function enableListeners(event:Event = null):void
		{
			addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
		}
		
		protected function disableListeners():void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
		}

		protected function handleMouseDown(event : MouseEvent) : void
		{
			slideDownSkin.visible = true;
		}
		
		protected function handleMouseUp(event : MouseEvent) : void
		{
			slideDownSkin.visible = false;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ImageSliderControl );		
		
	}
}
