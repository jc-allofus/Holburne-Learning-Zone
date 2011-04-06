package com.allofus.holburne.learningzone.model.vo
{
	/**
	 * @author jc
	 */
	public class DidTheRightThingVO
	{
		public var userVotedYes:Boolean;
		public var numVotesYes:int;
		public var numVotesNo:int;
		
		
		public function DidTheRightThingVO(userVotedYes:Boolean = false, numVotesYes:int = NaN, numVotesNo:int = NaN)
		{
			this.userVotedYes = userVotedYes;
			this.numVotesYes = numVotesYes;
			this.numVotesNo = numVotesNo;
		}
		
		public function toString():String
		{
			return "[DidTheRightThingVO]: userVotedYes: " + userVotedYes + ", numVotesYes: " + numVotesYes + ", numVotesNo: " + numVotesNo;
		}
	}
}
