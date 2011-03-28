package com.allofus.holburne.learningzone.model.vo
{
	import flash.display.MovieClip;
	/**
	 * @author jc
	 */
	public class HotspotPinVO
	{
		public var target:MovieClip;
		public var panelVO:PopupPanelVO;
		
		
		public function HotspotPinVO(target:MovieClip, panelVO:PopupPanelVO = null)
		{
			this.target = target;
			//this.id = id;
			this.panelVO = panelVO;
		}
		
	}
}
