package com.allofus.holburne.learningzone.model.vo
{
	import flash.display.MovieClip;
	/**
	 * @author jc
	 */
	public class HotspotButtonVO
	{
		public var target:MovieClip;
		public var panelVO:PopupPanelVO;
		
		
		public function HotspotButtonVO(target:MovieClip, panelVO:PopupPanelVO = null)
		{
			this.target = target;
			//this.id = id;
			this.panelVO = panelVO;
		}
		
	}
}
