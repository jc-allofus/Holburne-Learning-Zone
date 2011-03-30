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
		protected var _selected:Boolean = false;
		
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
			
		}
		

		public function set selected(value:Boolean) : void
		{
			_selected = slideDownSkin.visible = value;
		}

		public function dispose() : void
		{
			
			while (numChildren > 0)
			{
				removeChildAt(0);
			}
			
			line = null;
			slideUpSkin = null;
			slideDownSkin = null;
		}
		
		private static const logger : ILogger = GetLogger.qualifiedName(ImageSliderControl);
	}
}
