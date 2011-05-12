package com.allofus.holburne.learningzone.view.chapter.chapter08
{
	import com.greensock.TweenMax;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.button.NumberedTextButton;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;

	import mx.logging.ILogger;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class Slide_8_3_2_QuestionPanel extends Sprite
	{
		
		protected var questionPanel:TextBoxWithTitleAndDescription;
		protected var possibleAnswers:Vector.<NumberedTextButton>;
		protected var possibleAnswersContainer:Sprite;
		protected var resultPanel:TextBoxWithTitleAndDescription;
		
		protected static const CORRECT_ANSWER_INDEX:int = 1;
		
		public function Slide_8_3_2_QuestionPanel()
		{
			questionPanel = new TextBoxWithTitleAndDescription("WHAT HAPPENS NEXT?", "", AppGlobals.RIGHT_FRAME_WIDTH, 610);
			addChild(questionPanel);
			
			possibleAnswers = new <NumberedTextButton>
			[
				new NumberedTextButton(new ButtonVO({iconLabel:"1",label:"The lady on the far left, who is the young wife’s sister, runs up the steps to rescue her."})),
				new NumberedTextButton(new ButtonVO({iconLabel:"2",label:"The young wife tricks the Mask of Truth.  She keeps her hand but the Mask never works again."})),
				new NumberedTextButton(new ButtonVO({iconLabel:"3",label:"The  Mask of Truth bites the young woman’s hand off because she has been lying to her husband"})),
				new NumberedTextButton(new ButtonVO({iconLabel:"4",label:"Nothing – a stone statue can’t bite!"}))
			];
			
			possibleAnswersContainer = new Sprite();
			questionPanel.addChild(possibleAnswersContainer);
			
			addPossibleAnswers();
			PositionUtil.centerHorizontally(possibleAnswersContainer, this);
			
			resultPanel = new TextBoxWithTitleAndDescription("result title here", "<p class='justified'>The young wife is on trial.  She has to prove that she hasn’t been lying to her husband.  The young man on the left is really the young wife’s secret lover.   She has persuaded him to trick everyone at her trial.  He pretends to be mad and runs up the steps to kiss her in front of the crowd.  Then Virgil asks her the question: “have you been kissed by any man other than your husband?”.  She is able to reply truthfully “I swear that no man has ever kissed me apart from my husband and that young man who kissed me just now”.   And so she saves her hand from the biting mouth. The legend tells us that the lie-detector never worked again, because the woman was too clever for it.</p>", AppGlobals.RIGHT_FRAME_WIDTH);
			PositionUtil.centerVertically(resultPanel, this);
			resultPanel.alpha = 0;
			resultPanel.visible = false;
			addChild(resultPanel);
		}

		protected function addPossibleAnswers() : void
		{
			for (var i : int = 0; i < possibleAnswers.length; i++) 
			{
				possibleAnswersContainer.addChild(possibleAnswers[i]);
				possibleAnswers[i].addEventListener(MouseEvent.CLICK, handleSelectionMade);
				if(i>0)
					PositionUtil.positionUnder(possibleAnswers[i], possibleAnswers[i-1], -15);	
			}
			possibleAnswersContainer.y = questionPanel.bottomOfCopy;
		}
		
		protected function removePossibleAnswers():void
		{
			removeListeners();
			if(!possibleAnswersContainer)
				return;
			while(possibleAnswersContainer.numChildren > 0)
			{
				possibleAnswersContainer.removeChildAt(0);
			}
		}
		
		protected function removeListeners():void
		{
			for (var i : int = 0; i < possibleAnswers.length; i++) 
			{
				possibleAnswers[i].removeEventListener(MouseEvent.CLICK, handleSelectionMade);
			}
		}

		protected function handleSelectionMade(event : MouseEvent) : void
		{
			removeListeners();
			var correctAnswer:Boolean = event.currentTarget === possibleAnswers[CORRECT_ANSWER_INDEX];
			TweenMax.to(questionPanel, AppGlobals.FADE_DURATION, {autoAlpha:0, ease:AppGlobals.FADE_EASE});
			var title:String = correctAnswer ? "RIGHT ANSWER, WELL DONE!" : "SORRY, WRONG ANSWER";
			resultPanel.title = title;
			TweenMax.to(resultPanel, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE, delay:AppGlobals.FADE_DURATION});
		}
		
		public function dispose():void
		{
			questionPanel = null;
			resultPanel = null;
			possibleAnswersContainer = null;
			
			removePossibleAnswers();
			if(possibleAnswers)
				possibleAnswers.length = 0;
			
			possibleAnswers = null;
			
			while(numChildren >0)
			{
				removeChildAt(0);
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_8_3_2_QuestionPanel );
	}
}
