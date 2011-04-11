package com.allofus.holburne.learningzone.view.component.button.icon
{

	import com.holburne.learningzone.guiassets.IconGreenCheck;
	import com.holburne.learningzone.guiassets.IconBlueCheck;
	import com.holburne.learningzone.guiassets.IconRedCheck;

	import flash.display.Bitmap;
	/**
	 * @author jc
	 */
	public class IconCheckGreenDO extends ButtonIcon
	{
		public function IconCheckGreenDO()
		{
			_upSkin = new Bitmap(new IconGreenCheck(0,0));
			_selectedSkin = new Bitmap(new IconRedCheck(0,0));
			addChild(_upSkin);
			addChild(_selectedSkin);
			super();
		}
	}
}
