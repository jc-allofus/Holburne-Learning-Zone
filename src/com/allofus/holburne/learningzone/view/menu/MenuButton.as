package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.guiassets.menu.MenuTab;
	import com.allofus.holburne.learningzone.guiassets.menu.MenuTabClicked;
	import com.allofus.holburne.learningzone.guiassets.menu.MenuTabSelected;
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * These are the buttons that appear across the bottom of the screen for each chapter.
	 * @author jc
	 */
	public class MenuButton extends AbstractButton
	{
		
		protected var menuTab:Bitmap;
		protected var menuTabSelected:Bitmap;
		protected var menuTabClicked:Bitmap;
		
		protected var label : TextField;
		
		
		public function MenuButton(vo:MenuButtonVO)
		{
			super(vo);
			
			menuTab = new Bitmap(new MenuTab(0,0));
			menuTabSelected = new Bitmap(new MenuTabSelected(0,0));
			menuTabClicked = new Bitmap(new MenuTabClicked(0,0));
			
			addChild(menuTab);
			addChild(menuTabSelected);
			addChild(menuTabClicked);
			
			label = FontManager.createTextField(vo.label);
			addChild(label);
			PositionUtil.centerHorizontally(label, this);
			PositionUtil.centerVertically(label, this);
			
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
			logger.debug("dispose() " + this);
			super.dispose();
			
			menuTab.bitmapData.dispose();
			menuTabSelected.bitmapData.dispose();
			menuTabClicked.bitmapData.dispose();
			
			menuTab = null;
			menuTabSelected = null;
			menuTabClicked = null;
			label = null;
		}
		
		override public function set selected(value:Boolean):void
		{
			super.selected = value;

			if(value)
			{
				menuTabClicked.visible = false;
				menuTabSelected.visible = true;
				TweenMax.to(label, 0.2, {tint:0xb00404});
			}
			else
			{
				menuTabSelected.visible = menuTabClicked.visible = false;
				TweenMax.to(label, 0.2, {removeTint:true});
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( MenuButton );
	}
}
