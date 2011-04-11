package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.model.vo.DidTheRightThingVO;
	import com.allofus.holburne.learningzone.events.VoteEvent;
	import flash.events.MouseEvent;
	import com.allofus.shared.text.FontManager;
	import flash.text.TextField;
	import com.allofus.shared.util.PositionUtil;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import com.allofus.holburne.learningzone.view.component.button.ButtonWithCheckIcon;

	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_4_4_3_PollQuestion extends Sprite
	{
		
		protected var hRule:Shape;
		protected var question:TextField;
		protected var buttonYes:ButtonWithCheckIcon;
		protected var buttonNo:ButtonWithCheckIcon;
		
		public function Slide_4_4_3_PollQuestion(width:Number)
		{
			hRule = new Shape();
			hRule.graphics.lineStyle(1, 0x80816D);
			hRule.graphics.lineTo(width, 0);
			addChild(hRule);
			
			question = FontManager.createStyledTextField("WHAT WOULD YOU HAVE DONE?","title");
			PositionUtil.centerHorizontally(question, this);
			addChild(question);
			
			buttonYes = new ButtonWithCheckIcon(
				new ButtonVO({label:"<p>KEPT THE HALF-PARROT HIDDEN</p>"}),
				ButtonWithCheckIcon.ICON_CHECK_GREEN
				);
			addChild(buttonYes);
				
			buttonNo = new ButtonWithCheckIcon(
				new ButtonVO({label:"<p>CLEANED THE OVERPAINT OFF THE PARROT</p><p>(so that people could see it)</p>"}),
				ButtonWithCheckIcon.ICON_CHECK_BLUE
				);
			addChild(buttonNo);
			
			PositionUtil.positionUnder(question, hRule, 20);
			PositionUtil.positionUnder(buttonYes, question);
			PositionUtil.positionUnder(buttonNo, buttonYes);
			
			buttonYes.addEventListener(MouseEvent.CLICK, handleYesClick);
			buttonNo.addEventListener(MouseEvent.CLICK, handleNoClick);
				
		}
		
		protected function enableListeners():void
		{
			buttonYes.addEventListener(MouseEvent.CLICK, handleYesClick);
			buttonNo.addEventListener(MouseEvent.CLICK, handleNoClick);
		}
		
		protected function disableListeners():void
		{
			buttonYes.removeEventListener(MouseEvent.CLICK, handleYesClick);
			buttonNo.removeEventListener(MouseEvent.CLICK, handleNoClick);
		}
		
		protected function handleYesClick(event:MouseEvent = null):void
		{
			//disableListeners();
			buttonYes.selected = true;
			dispatchEvent(new VoteEvent(VoteEvent.SEND_VOTE, new DidTheRightThingVO(true)));
		}
		
		protected function handleNoClick(event:MouseEvent = null):void
		{
			//disableListeners();
			buttonNo.selected = true;
			dispatchEvent(new VoteEvent(VoteEvent.SEND_VOTE, new DidTheRightThingVO(false)));
		}
	}
}
