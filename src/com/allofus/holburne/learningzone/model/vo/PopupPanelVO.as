package com.allofus.holburne.learningzone.model.vo
{
	/**
	 * @author jc
	 */
	public class PopupPanelVO
	{
		public var text:String;
		public var imageClassRef:Class; //CLASS REF OF A BITMAPDATA
		
		public function PopupPanelVO(text:String, imageClassRef:Class = null)
		{
			this.text = text;
			this.imageClassRef = imageClassRef;
		}
	}
}
