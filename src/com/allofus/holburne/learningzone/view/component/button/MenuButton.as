package com.allofus.holburne.learningzone.view.component.button
{
	import com.allofus.holburne.learningzone.guiassets.menu.MenuTab;
	import com.allofus.holburne.learningzone.guiassets.menu.MenuTabClicked;
	import com.allofus.holburne.learningzone.guiassets.menu.MenuTabSelected;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import com.allofus.holburne.learningzone.view.menu.MenuPanelVC;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import mx.logging.ILogger;



	/**
	 * These are the buttons that appear across the bottom of the screen for each chapter.
	 * @author jc
	 */
	public class MenuButton extends AbstractButton
	{
		
		protected var menuTab:Bitmap;
		protected var menuTabSelected:Bitmap;
		protected var menuTabClicked:Bitmap;
		
		protected var _label : TextField;
		public var panel : MenuPanelVC;
		
		
		public function MenuButton(vo:ButtonVO)
		{
			super(vo);
			
			menuTab = new Bitmap(new MenuTab(0,0));
			menuTabSelected = new Bitmap(new MenuTabSelected(0,0));
			menuTabClicked = new Bitmap(new MenuTabClicked(0,0));
			
			addChild(menuTab);
			addChild(menuTabSelected);
			addChild(menuTabClicked);
			
			_label = FontManager.createTextField(vo.label);
			addChild(_label);
			PositionUtil.centerHorizontally(_label, this);
			PositionUtil.centerVertically(_label, this);
			
			menuTabSelected.visible = menuTabClicked.visible = false;
		}

		override protected function handleMouseDown(event:MouseEvent):void
		{
			if(!_selected)menuTabClicked.visible = true;
		}
		
		override protected function handleMouseUp(event:MouseEvent):void
		{
			menuTabClicked.visible = false;
		}
		
		override public function dispose():void
		{
			
			menuTab.bitmapData.dispose();
			menuTabSelected.bitmapData.dispose();
			menuTabClicked.bitmapData.dispose();
			
			menuTab = null;
			menuTabSelected = null;
			menuTabClicked = null;
			_label = null;
			
			panel = null;
			
			super.dispose();
		}
		
		override public function set selected(value:Boolean):void
		{
			super.selected = value;

			if(value)
			{
				menuTabClicked.visible = false;
				menuTabSelected.visible = true;
				TweenMax.to(_label, 0.2, {tint:0xb00404});
			}
			else
			{
				menuTabSelected.visible = menuTabClicked.visible = false;
				TweenMax.to(_label, 0.2, {removeTint:true});
			}
		}

		public function dropDown(ty : int) : void
		{
			y = ty;
			if(panel)
				panel.y = y;
		}
		
		public function get label():String
		{
			return _label.text;
		}
		

		private static const logger : ILogger = GetLogger.qualifiedName(MenuButton);
	}
}
