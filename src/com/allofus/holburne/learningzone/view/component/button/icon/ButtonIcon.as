package com.allofus.holburne.learningzone.view.component.button.icon
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class ButtonIcon extends Sprite
	{
		protected var _upSkin:DisplayObject;
		protected var _downSkin:DisplayObject;
		protected var _selectedSkin:DisplayObject;
		
		protected var _selected:Boolean = false;
		
		public function ButtonIcon()
		{
			up();
		}
		
		public function up():void
		{
			if(_upSkin)
				_upSkin.visible = true;
				
			if(_downSkin)
				_downSkin.visible = false;
				
			if(_selectedSkin)
				_selectedSkin.visible = _selected;
		}
		
		public function down():void
		{
			if(_upSkin)
				_upSkin.visible = false;
				
			if(_downSkin)
				_downSkin.visible = true;
				
			if(_selectedSkin)
				_selectedSkin.visible = _selected;
		}
		
		public function select():void
		{
			_selected = true;
			
			if(_upSkin)
				_upSkin.visible = false;
				
			if(_downSkin)
				_downSkin.visible = false;
				
			if(_selectedSkin)
				_selectedSkin.visible = _selected;
		}
		
		public function deselect():void
		{
			_selected = false;
			
			if(_upSkin)
				_upSkin.visible = false;
				
			if(_downSkin)
				_downSkin.visible = false;
				
			if(_selectedSkin)
				_selectedSkin.visible = _selected;
		}
	}
}
