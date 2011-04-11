package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.greensock.TweenMax;
	import com.allofus.shared.text.FontManager;
	import flash.text.TextField;
	import com.allofus.shared.util.PositionUtil;
	import com.allofus.holburne.learningzone.view.component.VoteResultsDisc;
	import com.allofus.holburne.learningzone.model.vo.DidTheRightThingVO;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_4_4_3_PollResults extends Sprite
	{
		
		protected var bg:Shape;
		
		protected var title:TextField;
		protected var subTitle:TextField;
		protected var votedYes:VoteResultsDisc;
		protected var resultsYesText:TextField;
		protected var votedNo:VoteResultsDisc;
		protected var resultsNoText:TextField;
		
		public var percentYes:Number = 0;
		public var percentNo:Number = 0;
		
		public function Slide_4_4_3_PollResults(width:Number, height:Number)
		{
			mouseEnabled = false;
			mouseChildren = false;
			bg = new Shape();
			bg.graphics.beginFill(0xFF0000, 0);
			bg.graphics.drawRect(0, 0, width, height);
			addChild(bg);
			
			var titleText:String = "THANK YOU FOR YOUR OPINION";
			title = FontManager.createStyledTextField(titleText, "title");
			title.y = 60;
			PositionUtil.centerHorizontally(title, this);
			addChild(title);
			
			var subTitleText:String = "Here are the total percentages of votes from our visitors";
			subTitle = FontManager.createStyledTextField(subTitleText);
			PositionUtil.positionUnder(subTitle, title, 20);
			PositionUtil.centerHorizontally(subTitle, this);
			addChild(subTitle);
			
			votedYes = new VoteResultsDisc(VoteResultsDisc.COLOR_GREEN);
			votedYes.x = Math.round(bg.width * 0.5);
			addChild(votedYes);
			
			var votedYesText:String = "KEPT THE HALF-PARROT HIDDEN";
			resultsYesText = FontManager.createStyledTextField(votedYesText);
			PositionUtil.centerHorizontally(resultsYesText, this);
			addChild(resultsYesText);
			
			votedNo = new VoteResultsDisc(VoteResultsDisc.COLOR_BLUE);
			votedNo.x = Math.round(bg.width * 0.5);
			addChild(votedNo);
			
			var votedNoText:String  = "CLEANED THE OVERPAINT OFF THE PARROT";
			resultsNoText = FontManager.createStyledTextField(votedNoText);
			PositionUtil.centerHorizontally(resultsNoText, this);
			addChild(resultsNoText);
		}

		public function setValues(rightThingVO : DidTheRightThingVO) : void
		{
			var totalVotes:Number = rightThingVO.numVotesYes + rightThingVO.numVotesNo;
			percentYes = Math.round((rightThingVO.numVotesYes * 100) / totalVotes);
			percentNo = Math.round((rightThingVO.numVotesNo * 100) / totalVotes);
			
			//first set the discs to the right values
			votedYes.percent = percentYes;
			votedNo.percent = percentNo;
			
			//then lay everything out
			layout();
			
			//then set them back to zero so we can animate them in
			votedYes.percent = 0;
			votedNo.percent = 0;
		}
		
		protected function layout():void
		{
			var padding:int = 25;
			PositionUtil.positionUnder(votedYes, subTitle, (votedYes.height*0.5) + padding);
			resultsYesText.y = votedYes.y + (votedYes.height * 0.5) + padding;
			PositionUtil.positionUnder(votedNo, resultsYesText, (votedNo.height*0.5) + padding);
			resultsNoText.y =  votedNo.y + (votedNo.height * 0.5) + padding;
		}

		public function animateToValues() : void
		{
			TweenMax.from(this, 1.5, {percentYes:0, percentNo:0, onUpdate:updateFields});
		}
		
		protected function updateFields():void
		{
			votedYes.percent = percentYes;
			votedNo.percent = percentNo;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_4_4_3_PollResults );
	}
}
