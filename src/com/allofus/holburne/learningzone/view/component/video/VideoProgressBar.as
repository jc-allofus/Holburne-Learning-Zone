package com.allofus.holburne.learningzone.view.component.video
{
	import com.allofus.holburne.learningzone.events.VideoSeekEvent;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;

	import mx.logging.ILogger;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class VideoProgressBar extends Sprite
	{
		private static const FRICTION:Number = 0.1;
		private static const SNAP_DISTANCE:Number = 2; 
		
		
		protected var bounds:Shape;
		protected var bg:Shape;
		protected var progress:Shape;
		protected var dragMarker:Shape;
		protected var _width:Number = 100;
		
		protected var _isDragging:Boolean = false;
		protected var _targetX:int;
		
		public function VideoProgressBar()
		{
			bounds = new Shape();
			bg = new Shape();
			progress = new Shape();
			dragMarker = new Shape();
			addChild(bounds);
			addChild(bg);
			addChild(progress);
			addChild(dragMarker);
			addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
		}
		
		
		protected function draw():void
		{
			bounds.graphics.clear();
			bounds.graphics.beginFill(0xcc0066, 0);
			bounds.graphics.drawRect(0, 0, _width, 50);
			
			bg.graphics.clear();
			bg.graphics.beginFill(0xbbbcb1);
			bg.graphics.drawRect(0, 0, _width, 7);
			
			progress.graphics.clear();
			progress.graphics.beginFill(0xb00404);
			progress.graphics.drawRect(0, 0, _width, 7);
			
			
			dragMarker.graphics.clear();
			dragMarker.graphics.beginFill(0xcccc00, 0);
			dragMarker.graphics.drawCircle(0, 0, 4);
			
			PositionUtil.centerVertically(bg, bounds);
			PositionUtil.centerVertically(progress, bounds);
			
			progress.scaleX = 0;
		}
		
		public function setWidth(value:Number):void
		{
			_width = value;
			draw();
		}
		
		protected function startDragging(event:Event = null):void
		{
			_isDragging = true;
			addEventListener(Event.ENTER_FRAME, updateTargetX);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
			dispatchEvent(new VideoSeekEvent(VideoSeekEvent.SEEK_DRAG_STARTED, NaN));
		}

		protected function updateTargetX(event:Event = null) : void
		{
			
			
			//update targetX if dragging (mouse is down)
			if(_isDragging)
			{
				_targetX = mouseX;
				
				//clamp values to image size
				if(_targetX > _width) 
					_targetX = _width;
				if(_targetX < 0) 
					_targetX = 0;
			}
			
			//update draggerVC and mask w/ friction
			dragMarker.x += FRICTION * (_targetX - dragMarker.x );
			
			//snap position we we've stopped dragging and are within the sepecified distance
			if(!_isDragging && Math.abs(_targetX - dragMarker.x) < SNAP_DISTANCE)
			{
				dragMarker.x = _targetX;
			}
			
			//get percentage
			var pct:Number = (dragMarker.x * 100) / _width;
			//update bar's graphics to percentage
			progress.scaleX = pct * .01;
			dispatchEvent(new VideoSeekEvent(VideoSeekEvent.SEEK_TO_PERCENT, pct));
		}
		
		protected function stopDragging(event:Event = null):void
		{
			if(stage)stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragging);
			removeEventListener(Event.ENTER_FRAME, updateTargetX);
			_isDragging = false;
			dispatchEvent(new VideoSeekEvent(VideoSeekEvent.SEEK_DRAG_COMPLETE, NaN));
		}
		
		public function updateProgress(percent:Number):void
		{
			progress.scaleX = percent / 100;
			if(!_isDragging)
			{
				dragMarker.x = _width * progress.scaleX;
			}
		}
		

		public function dispose() : void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			removeEventListener(Event.ENTER_FRAME, updateTargetX);
			if(stage)stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragging);
			
			if(bounds)
			{
				bounds.graphics.clear();
			}
			bounds = null;
			
			if(bg)
			{
				bg.graphics.clear();
			}
			bg = null;
			
			if(progress)
			{
				progress.graphics.clear();
			}
			progress = null;
			
			if(dragMarker)
			{
				dragMarker.graphics.clear();
			}
			dragMarker = null;
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
			
		}
		
		private static const logger : ILogger = GetLogger.qualifiedName(VideoProgressBar);
	}
}
