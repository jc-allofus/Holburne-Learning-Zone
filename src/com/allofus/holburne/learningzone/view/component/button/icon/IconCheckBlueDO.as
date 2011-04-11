package com.allofus.holburne.learningzone.view.component.button.icon
{

	import com.holburne.learningzone.guiassets.IconBlueCheck;
	import com.holburne.learningzone.guiassets.IconRedCheck;
	import com.holburne.learningzone.guiassets.IconGreenCheck;
	import flash.display.Bitmap;
	/**
	 * @author jc
	 */
	public class IconCheckBlueDO extends ButtonIcon
	{
		public function IconCheckBlueDO()
		{
			_upSkin = new Bitmap(new IconBlueCheck(0,0));
			_selectedSkin = new Bitmap(new IconRedCheck(0,0));
			addChild(_upSkin);
			addChild(_selectedSkin);
			super();
		}
	}
}
