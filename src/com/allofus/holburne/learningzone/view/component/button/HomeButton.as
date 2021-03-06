package com.allofus.holburne.learningzone.view.component.button
{
	import com.allofus.holburne.learningzone.guiassets.menu.HomeTab;
	import com.allofus.holburne.learningzone.guiassets.menu.HomeTabClicked;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import mx.logging.ILogger;



	/**
	 * @author jc
	 */
	public class HomeButton extends AbstractButton
	{
		protected var homeTab:Bitmap;
		protected var homeTabSelected:Bitmap;
		protected var label:TextField;
		
		public function HomeButton(vo:ButtonVO)
		{
			super(null);
			
			homeTab = new Bitmap(new HomeTab(0,0));
			homeTabSelected = new Bitmap(new HomeTabClicked(0,0));
			label = FontManager.createTextField("<p class='buttonLabel'>Collection</p>");
			
			addChild(homeTab);
			addChild(homeTabSelected);
			addChild(label);
			
			homeTabSelected.visible = false;
			
			PositionUtil.centerHorizontally(label, homeTab);
			PositionUtil.centerVertically(label, homeTab);

		}

		override protected function handleMouseUp(event : MouseEvent) : void
		{
			homeTabSelected.visible = false;
		}
		
		override protected function handleMouseDown(event:MouseEvent):void
		{
			homeTabSelected.visible = true;
		}
		
		override public function dispose():void
		{
			super.dispose();		
			
			homeTab = null;
			homeTabSelected = null;
			label = null;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HomeButton );
	}
}
