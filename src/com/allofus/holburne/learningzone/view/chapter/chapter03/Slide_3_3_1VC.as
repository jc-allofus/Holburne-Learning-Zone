package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.events.TimelineEvent;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.swcassets.chapter3.Slide_3_3_1;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class Slide_3_3_1VC extends AbstractSlide
	{

		protected var bgPlate : Slide_3_3_1;
		protected var timelineButtons : Slide_3_3_1TimelineButtons;

		public function Slide_3_3_1VC()
		{
			bgPlate = new Slide_3_3_1();
			bgPlate.alpha = 0;
			addChild(bgPlate);

			timelineButtons = new Slide_3_3_1TimelineButtons();
			timelineButtons.x = 210;
			timelineButtons.y = AppGlobals.RIGHT_FRAME_Y + 350;
			timelineButtons.addEventListener(TimelineEvent.SELECTED, handleButtonSelected);
			timelineButtons.alpha = 0;
			addChild(timelineButtons);

			super();
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn([bgPlate,timelineButtons]);
		}

		protected function handleButtonSelected(event : TimelineEvent) : void
		{
			bgPlate.leftContent.visible = bgPlate.rightContent.visible = false;
			bgPlate.leftContent.alpha = bgPlate.rightContent.alpha = 0;
			bgPlate.leftContent.gotoAndStop(event.button.vo.actionParams);
			bgPlate.rightContent.gotoAndStop(event.button.vo.actionParams);
			staggerItemsIn([bgPlate.leftContent, bgPlate.rightContent]);
		}
		
		override public function dispose():void
		{
			if(timelineButtons)
				timelineButtons.removeEventListener(TimelineEvent.SELECTED, handleButtonSelected);
				
			timelineButtons = null;
			bgPlate = null;
			
			super.dispose();
		}

		private static const logger : ILogger = GetLogger.qualifiedName(Slide_3_3_1VC);
	}
}
