package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.greensock.TweenMax;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author jc
	 */
	public class ChapterMenu extends Sprite
	{
		public static const POS_Y:int = 995;
		
		protected var homeButton:HomeButton;
		protected var sectionButtons:Vector.<MenuButtonVO>;
		
		
		public function ChapterMenu()
		{
			homeButton = new HomeButton();
			homeButton.x = 65;
			homeButton.addEventListener(Event.CLOSE, handleClose);
			addChild(homeButton);
			
			//position offstage then transition in
			y = AppGlobals.APP_HEIGHT;
			transitionIn();
		}
		
		public function transitionIn(delay:Number = 0.5):void
		{
			y = AppGlobals.APP_HEIGHT;
			TweenMax.to(this, 0.5, {y:POS_Y, delay:delay});
		}
		
		protected function handleClose(event:Event):void
		{
			dispatchEvent(event);
		}
	}
}