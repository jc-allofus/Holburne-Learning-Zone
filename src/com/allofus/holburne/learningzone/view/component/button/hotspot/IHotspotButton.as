package com.allofus.holburne.learningzone.view.component.button.hotspot
{
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	/**
	 * @author jc
	 */
	public interface IHotspotButton
	{
		function transitionIn(delay:Number =0):void;
		
		function select():void;
		function deselect():void;
		
		function dispose():void;
		
		function get vo():HotspotButtonVO;
		
		function get selected():Boolean;
		function set selected(value:Boolean):void;
		
	}
}
