package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class BeforeAndAfterSwipeWithCaption extends Sprite
	{
		public static const BORDER_SIZE:int = 20;
		public static const BORDER_COLOR:uint = 0xFFFFFF;
		
		public static const FRICTION:Number = 0.1;
		public static const SNAP_DISTANCE:Number = 2; 
		protected var _targetX:int;
		protected var _isDragging:Boolean = false;
		
		public static const REVEALED_PERCENT:int = 20;
		
		protected var imgBefore:DisplayObject;
		protected var imgBeforeMask:Shape;
		protected var imgAfter:DisplayObject;
		protected var imgAfterMask:Shape;
		protected var dragger:ImageSliderControl;
		
		
		public function BeforeAndAfterSwipeWithCaption(imgBefore:DisplayObject, imgAfter:DisplayObject)
		{
			this.imgBefore = imgBefore;
			this.imgAfter = imgAfter;
			
			imgAfterMask = new Shape();
			imgAfterMask.graphics.beginFill(0x00cc00);
			imgAfterMask.graphics.drawRect(0, 0, imgBefore.width, imgBefore.height);
			
			imgBeforeMask = new Shape();
			imgBeforeMask.graphics.beginFill(0xcc0000);
			imgBeforeMask.graphics.drawRect(0, 0, imgBefore.width, imgBefore.height);
			
			dragger = new ImageSliderControl(this.imgBefore);
			
			addChild(this.imgAfter);
			addChild(this.imgBefore);
			addChild(imgBeforeMask);
			addChild(imgAfterMask);
			addChild(dragger);

			this.imgBefore.mask = imgBeforeMask;
			this.imgAfter.mask = imgAfterMask;
			
			dragger.x = Math.round(REVEALED_PERCENT * imgBefore.width / 100);
			imgBeforeMask.width = dragger.x;

			addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
		}

		protected function startDragging(event:Event = null):void
		{
			_isDragging = dragger.selected = true;
			addEventListener(Event.ENTER_FRAME, updateTargetX);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
		}

		protected function updateTargetX(event:Event = null) : void
		{
			//update targetX if dragging (mouse is down)
			if(_isDragging)
			{
				_targetX = mouseX;
				
				//clamp values to image size
				if(_targetX > imgBefore.width) 
					_targetX = imgBefore.width;
				if(_targetX < 0) 
					_targetX = 0;
			}
			
			//update draggerVC and mask w/ friction
			dragger.x += FRICTION * (_targetX - dragger.x );
			imgBeforeMask.width = dragger.x;
			
			//snap position we we've stopped dragging and are within the sepecified distance
			if(!_isDragging && Math.abs(_targetX - dragger.x) < SNAP_DISTANCE)
			{
				dragger.x = _targetX;
				imgBeforeMask.width = dragger.x;
				removeEventListener(Event.ENTER_FRAME, updateTargetX);
			}
		}
		
		protected function stopDragging(event:Event = null):void
		{
			_isDragging = dragger.selected = false;
		}

		public function dispose() : void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			removeEventListener(Event.ENTER_FRAME, updateTargetX);
			if(stage)stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragging);
				
			while (numChildren > 0)
			{
				removeChildAt(0);
			}	
			
			dragger.dispose();
			dragger = null;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( BeforeAndAfterSwipeWithCaption );
		
	}
}
