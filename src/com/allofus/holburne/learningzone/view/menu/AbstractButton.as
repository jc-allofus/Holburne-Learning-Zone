package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class AbstractButton extends Sprite
	{
		public var vo:MenuButtonVO;
		protected var _selected : Boolean;
		
		public function AbstractButton(vo:MenuButtonVO)
		{
			this.vo = vo;
			buttonMode = true;
			mouseChildren = false;
			
			addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}
		
		protected function handleAddedToStage(event : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
			addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
		}
		
		protected function handleMouseDown(event:MouseEvent):void
		{
			//implement in concrete children
		}
		
		protected function handleMouseUp(event:MouseEvent):void
		{
			//implement in concrete children
		}
		
		public function get selected() : Boolean
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
		}
		
		public function dispose():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
			removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			if(stage)stage.removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
		}
	}
}
