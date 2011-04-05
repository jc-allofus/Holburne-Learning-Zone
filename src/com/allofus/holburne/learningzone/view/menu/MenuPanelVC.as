package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import com.allofus.holburne.learningzone.guiassets.menu.MenuPanel;
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;
	import com.greensock.easing.Expo;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class MenuPanelVC extends Sprite
	{
		public static const VERTICAL_GAP:int = 15;
		public static const MARGIN_TOP:int = 27;
		public static const MARGIN_LEFT:int = 30;
		
		protected var background:Bitmap;
		
		public var menuButtonDOs:Vector.<SubMenuButton>;
		protected var menuButtonVOs:Vector.<MenuButtonVO>;
		protected var currentSelected:SubMenuButton;
		
		public var triggeredBy:MenuButtonVO;
		protected var bottomOfMenu:Number = 0;
		
		protected var _opened:Boolean = false;
		
		public function MenuPanelVC(vos:Vector.<MenuButtonVO>, triggeredBy:MenuButtonVO)
		{
			this.triggeredBy = triggeredBy;
			menuButtonVOs = vos;
			menuButtonDOs = new Vector.<SubMenuButton>();
			
			background = new Bitmap(new MenuPanel(0,0));
			addChild(background);
			
			var btn:SubMenuButton;
			for (var i : int = 0; i < menuButtonVOs.length; i++) 
			{
				btn = new SubMenuButton(menuButtonVOs[i]);
				btn.y = (SubMenuButton.HEIGHT+ VERTICAL_GAP) * i  + MARGIN_TOP;
				btn.addEventListener(MouseEvent.CLICK, handleButtonClicked);
				bottomOfMenu = btn.y + btn.height;
				btn.x = MARGIN_LEFT;
				addChild(btn);
				menuButtonDOs.push(btn);
				
				if(i < menuButtonVOs.length-1)
				{
					var sep:SubMenuSeparator = new SubMenuSeparator();
					addChild(sep);
					PositionUtil.positionUnder(sep, btn, 7);
					PositionUtil.centerHorizontally(sep, this);
				}
			}
		}
		
		protected function selectFirst():void
		{
			deselectAllButtons();
			currentSelected = menuButtonDOs[0];
			currentSelected.selected = true;
			dispatchEvent(new ChapterMenuEvent(ChapterMenuEvent.SUBMENU_ITEM_SELECTED, currentSelected.vo));
		}
		
		protected function handleButtonClicked(event:MouseEvent):void
		{
			var btn:SubMenuButton = event.currentTarget as SubMenuButton;
			if(currentSelected != btn)
			{
				deselectAllButtons();
				btn.selected = true;
				currentSelected = btn;
				dispatchEvent(new ChapterMenuEvent(ChapterMenuEvent.SUBMENU_ITEM_SELECTED, btn.vo));
			}
		}
		
		public function deselectAllButtons():void
		{
			if(menuButtonDOs && menuButtonDOs.length > 0)
			{
				for (var i : int = 0; i < menuButtonDOs.length; i++) 
				{
					menuButtonDOs[i].selected = false;
					
				}
				currentSelected = null;
			}
			else
			{
				logger.warn("deselectAllButtons() call with nothing in sectionButtonDO vector; not WINNING.");
			}
		}
		
		public function open():void
		{
			_opened = true;
			TweenMax.to(this, 0.5, {y:-bottomOfMenu, ease:Expo.easeOut});
		}
		
		public function close():void
		{
			_opened = false;
			TweenMax.to(this, 0.5, {y:0, ease:Expo.easeOut});
		}

		public function dispose() : void
		{
			TweenMax.killTweensOf(this);
			if(menuButtonDOs)
			{
				for (var i : int = 0; i < menuButtonDOs.length; i++) 
				{
					menuButtonDOs[i].dispose();				
				}
			}
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
			
			menuButtonDOs.length = 0;
			menuButtonDOs = null;
			triggeredBy = null;
			
			background.bitmapData.dispose();
			background = null;
		}
		
		public function toggle() : void
		{
			_opened ? close() : open();
		}
		
		private static const logger : ILogger = GetLogger.qualifiedName(MenuPanelVC);

	}
}
