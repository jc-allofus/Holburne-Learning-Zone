package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.greensock.TweenMax;
	import com.allofus.holburne.learningzone.model.vo.DidTheRightThingVO;
	import com.allofus.holburne.learningzone.events.VoteEvent;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.util.PositionUtil;

	/**
	 * @author jc
	 */
	public class Slide_4_4_3VC extends AbstractSlide
	{
		protected var text:TextBoxWithTitleAndDescription;
		
		protected var pollQuestion:Slide_4_4_3_PollQuestion;
		protected var pollResults:Slide_4_4_3_PollResults;
		
		public function Slide_4_4_3VC()
		{
			
			
			var title:String ="DID WE DO THE RIGHT THING?";
			var description:String = 
				"<p class='justified'>When the picture was cleaned, the little parrot appeared perched on a hoop at the top of the picture.  We think the canvas must have been cut down at some point to fit a new frame. When the edges of the picture were cut off, the parrot’s head went with them, so the parts of the parrot left behind were painted over to hide them.</p>"
			+	"<p></p>"
			+	"<p class='justified'>We decided to keep the parrot visible, even though its head has been lost.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH,650);
			addChild(text);
			
			PositionUtil.centerHorizontallyByVal(text, AppGlobals.APP_WIDTH);
			text.y = AppGlobals.RIGHT_FRAME_Y;
			
			pollQuestion = new Slide_4_4_3_PollQuestion(600);
			pollQuestion.addEventListener(VoteEvent.SEND_VOTE, redispatch);
			addChild(pollQuestion);
			pollQuestion.y = text.y + text.bottomOfCopy + 20;
			PositionUtil.centerHorizontally(pollQuestion, text);
			
			pollResults = new Slide_4_4_3_PollResults(AppGlobals.RIGHT_FRAME_WIDTH, text.height);
			pollResults.alpha = 0;
			pollResults.y = text.y;
			PositionUtil.centerHorizontally(pollResults, text);
			//pollResults.visible = false;
			addChild(pollResults);		
			
			super();
		}
		
		

		//dispatch up to Slide_4_4_3VCMediator
		private function redispatch(event : VoteEvent) : void
		{
			dispatchEvent(event);
		}

		public function showResults(rightThingVO : DidTheRightThingVO) : void
		{
			pollResults.setValues(rightThingVO);
			TweenMax.to(pollQuestion, AppGlobals.FADE_DURATION, {autoAlpha:0, delay:0.5});
			TweenMax.to(text.titleField, AppGlobals.FADE_DURATION, {autoAlpha:0, delay:0.5});
			TweenMax.to(text.bodyField, AppGlobals.FADE_DURATION, {autoAlpha:0, delay:0.5});
			TweenMax.to(pollResults, AppGlobals.FADE_DURATION, {autoAlpha:1, delay:1.5, onComplete:animatePollResults});
		}
		
		protected function animatePollResults():void
		{
			pollResults.animateToValues();
		}
	}
}
