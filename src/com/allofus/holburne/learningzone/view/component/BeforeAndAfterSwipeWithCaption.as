package com.allofus.holburne.learningzone.view.component
{
	import com.greensock.TimelineMax;

	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class BeforeAndAfterSwipeWithCaption extends Sprite
	{
		public static const BORDER_SIZE:int = 20;
		public static const BORDER_COLOR:uint = 0xFFFFFF;
		
		public static const REVEALED_PERCENT:int = 20;
		
		protected var imgBefore:DisplayObject;
		protected var imgBeforeMask:Shape;
		protected var imgAfter:DisplayObject;
		protected var imgAfterMask:Shape;
		protected var dragger:ImageSliderControl;
		protected var border:Shape;
		protected var _captionLabel:TextField;
		protected var _dragging:Boolean;
		
		protected var captionTimeline:TimelineMax;
		
		public function BeforeAndAfterSwipeWithCaption(imgBefore:DisplayObject, imgAfter:DisplayObject)
		{
			this.imgBefore = imgBefore;
			this.imgAfter = imgAfter;
			
			imgAfterMask = new Shape();
			imgAfterMask.graphics.beginFill(0x00cc00);
			imgAfterMask.graphics.drawRect(0, 0, imgBefore.width, imgBefore.height);
			addChild(imgAfterMask);
			
			imgBeforeMask = new Shape();
			imgBeforeMask.graphics.beginFill(0xcc0000);
			imgBeforeMask.graphics.drawRect(0, 0, imgBefore.width, imgBefore.height);
			addChild(imgBeforeMask);
			
			imgBefore.mask = imgBeforeMask;
			
			dragger = new ImageSliderControl(this.imgBefore);
			dragger.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			
			addChild(this.imgAfter);
			addChild(this.imgBefore);
			addChild(imgBeforeMask);
			addChild(dragger);
			
			dragger.x = Math.round(REVEALED_PERCENT * imgBefore.width / 100);
			updateMaskToDragger();
		}

		
		protected function startDragging(event:Event = null):void
		{
			_dragging = true;
			addEventListener(MouseEvent.MOUSE_MOVE, updateMaskToDragger);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
			dragger.startDrag(false,new Rectangle(0,dragger.y, imgBefore.width, 0));
		}

		protected function updateMaskToDragger(event:Event = null) : void
		{
			imgBeforeMask.width = dragger.x;
		}
		
		protected function stopDragging(event:Event = null):void
		{
			removeEventListener(MouseEvent.MOUSE_MOVE, updateMaskToDragger);
			_dragging = false;
			stopDrag();
		}
		
	}
}
