package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.events.TimelineEvent;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.swcassets.Slide_3_3_1;

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
			addChild(bgPlate);

			timelineButtons = new Slide_3_3_1TimelineButtons();
			timelineButtons.x = 210;
			timelineButtons.y = AppGlobals.RIGHT_FRAME_Y + 350;
			timelineButtons.addEventListener(TimelineEvent.SELECTED, handleButtonSelected);
			addChild(timelineButtons);

			super();
		}

		protected function handleButtonSelected(event : TimelineEvent) : void
		{
			bgPlate.leftContent.visible = bgPlate.rightContent.visible = false;
			bgPlate.leftContent.alpha = bgPlate.rightContent.alpha = 0;
			bgPlate.leftContent.gotoAndStop(event.button.vo.actionParams);
			bgPlate.rightContent.gotoAndStop(event.button.vo.actionParams);
			staggerItemsIn([bgPlate.leftContent, bgPlate.rightContent]);
		}

		private static const logger : ILogger = GetLogger.qualifiedName(Slide_3_3_1VC);
	}
}
