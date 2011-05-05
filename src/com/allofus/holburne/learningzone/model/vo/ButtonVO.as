package com.allofus.holburne.learningzone.model.vo
{
	/**
	 * @author jc
	 */
	public class ButtonVO
	{
		
		public static const SHOW_SLIDE:String = "mainMenuButtonAction/ShowSlide";
		
		public var label:String;
		public var iconLabel:String;
		public var action:String;
		public var actionParams:String;
		public var subMenuButtons:Vector.<ButtonVO>;
		
		public function ButtonVO(params:Object = null)
		{
			if(params["label"]) this.label = params["label"];
			if(params["iconLabel"]) this.iconLabel = params["iconLabel"];
			if(params["action"]) this.action = params["action"];
			if(params["actionParams"]) this.actionParams = params["actionParams"];
			if(params["subMenuButtons"]) this.subMenuButtons = params["subMenuButtons"];
		}
		
		public function toString():String
		{
			return "[MenuButtonVO]: " + label + ", iconLabel: " + iconLabel + ", action: " + action + ", actionParams: "  + actionParams + ", subMenuButtons: " + subMenuButtons;
		}
	}
}
