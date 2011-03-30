package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.events.ChapterMenuEvent;
	import flash.events.MouseEvent;
	import com.allofus.shared.util.PositionUtil;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;
	import com.allofus.shared.logging.GetLogger;
	import com.greensock.TimelineMax;
	import com.greensock.TweenAlign;
	import com.greensock.TweenMax;

	import mx.logging.ILogger;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class ChapterMenu extends Sprite
	{
		public static const POS_Y:int = 995;
		
		public static const BUTTON_OFFSET_X:int = 298; 
		
		protected var homeButton:HomeButton;
		protected var sectionButtonDOs:Vector.<MenuButton>;
		protected var sectionButtonLayer:Sprite;
		protected var subMenuPanelLayer:Sprite;
		protected var transition : TimelineMax;
		protected var currentSelected : MenuButton;
		
		public function ChapterMenu()
		{
			homeButton = new HomeButton(null);
			homeButton.x = 65;
			homeButton.addEventListener(MouseEvent.CLICK, handleClose);
			addChild(homeButton);
			
			sectionButtonLayer = new Sprite();
			addChild(sectionButtonLayer);
			
			subMenuPanelLayer = new Sprite();
			sectionButtonLayer.addChild(subMenuPanelLayer);
			
			transitionIn();
		}
		
		public function addItems(itemVOs : Vector.<MenuButtonVO>) : void
		{
			logger.debug("adding menu itmes: " + itemVOs);
			var menuButton:MenuButton;
			if(!sectionButtonDOs)sectionButtonDOs = new Vector.<MenuButton>();
			for (var i : int = 0; i < itemVOs.length; i++) 
			{
				menuButton = new MenuButton(itemVOs[i]);
				menuButton.x = BUTTON_OFFSET_X * i;
				menuButton.addEventListener(MouseEvent.CLICK, handleMenuButtonClicked);
				sectionButtonLayer.addChild(menuButton);
				sectionButtonDOs.push(menuButton);
				
				if(itemVOs[i].subMenuButtons && itemVOs[i].subMenuButtons.length > 0)
				{
					var menuPanel:MenuPanelVC = new MenuPanelVC(itemVOs[i].subMenuButtons, menuButton.vo);
					menuPanel.x = menuButton.x + 5;
					//menuPanel.y = 00;
					subMenuPanelLayer.addChild(menuPanel);
				}
			}
			PositionUtil.centerHorizontallyByVal(sectionButtonLayer, AppGlobals.APP_WIDTH);
			selectFirstItem();
		}
		
		public function selectFirstItem():void
		{
			deselectAllButtons();
			var firstItem:MenuButton = sectionButtonDOs[0];
			firstItem.selected = true;
			currentSelected = firstItem;
		}
		
		public function transitionIn(delay:Number = 0.5):void
		{
			homeButton.y = sectionButtonLayer.y = AppGlobals.APP_HEIGHT;
			if(transition)transition.clear();
			transition = new TimelineMax({delay:delay});
			transition.insertMultiple([
			new TweenMax(sectionButtonLayer, AppGlobals.FADE_DURATION, {y:POS_Y}),
			new TweenMax(homeButton, AppGlobals.FADE_DURATION, {y:POS_Y})
			],0,TweenAlign.NORMAL,AppGlobals.TRANSITION_STAGGER);
		}
		
		public function transitionOut(delay:Number = 0):void
		{
			if(transition)transition.clear();
			for (var i : int = 0; i < subMenuPanelLayer.numChildren; i++) 
			{
				var panel:MenuPanelVC = subMenuPanelLayer.getChildAt(i) as MenuPanelVC;
				panel.close();
			}
			transition = new TimelineMax({delay:delay});
			transition.insertMultiple([
			new TweenMax(homeButton, AppGlobals.FADE_DURATION, {y:AppGlobals.APP_HEIGHT}),
			new TweenMax(sectionButtonLayer, AppGlobals.FADE_DURATION, {y:AppGlobals.APP_HEIGHT})
			],0,TweenAlign.NORMAL,AppGlobals.TRANSITION_STAGGER);
		}
		
		protected function handleClose(event:Event):void
		{
			transitionOut();
			dispatchEvent(new Event(Event.CLOSE));
		}
		
		protected function handleMenuButtonClicked(event:MouseEvent):void
		{
			var btn:MenuButton = event.currentTarget as MenuButton;
			if(currentSelected != btn)
			{
				deselectAllButtons();
				btn.selected = true;
				currentSelected = btn;
				dispatchEvent(new ChapterMenuEvent(ChapterMenuEvent.ITEM_SELECTED, btn.vo));
			}
		}
		
		protected function deselectAllButtons():void
		{
			if(sectionButtonDOs && sectionButtonDOs.length > 0)
			{
				for (var i : int = 0; i < sectionButtonDOs.length; i++) 
				{
					sectionButtonDOs[i].selected = false;
				}
			}
			else
			{
				logger.warn("deselectAllButtons() call with nothing in sectionButtonDO vector; not WINNING.");
			}
		}
		
		public function dispose():void
		{
			currentSelected = null;
			
			homeButton.removeEventListener(MouseEvent.CLICK, handleClose);
			homeButton.dispose();
			homeButton = null;
			
			for (var i : int = 0; i < sectionButtonDOs.length; i++) 
			{
				sectionButtonDOs[i].removeEventListener(MouseEvent.CLICK, handleMenuButtonClicked);
				sectionButtonDOs[i].dispose();				
			}
			sectionButtonDOs.length = 0;
			sectionButtonDOs = null;
			
			for (var j : int = 0; j < subMenuPanelLayer.numChildren; j++) 
			{
				var panel:MenuPanelVC = subMenuPanelLayer.getChildAt(j) as MenuPanelVC;
				if(panel)panel.dispose();	
			}
			subMenuPanelLayer = null;
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ChapterMenu );
	}
}