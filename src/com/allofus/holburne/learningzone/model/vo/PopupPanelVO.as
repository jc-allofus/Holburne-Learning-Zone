package com.allofus.holburne.learningzone.model.vo
{
	/**
	 * @author jc
	 */
	public class PopupPanelVO
	{
		public var text:String;
		public var imageClassRef:Class; //CLASS REF OF A BITMAPDATA
		public var imageCaption:String;
		
		public function PopupPanelVO(text:String, imageClassRef:Class = null, imageCaption:String = null)
		{
			this.text = text;
			this.imageClassRef = imageClassRef;
			this.imageCaption = imageCaption;
		}
	}
}
