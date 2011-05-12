package com.allofus.holburne.learningzone.view.component.button
{
	import com.allofus.holburne.learningzone.guiassets.HomepageNextSelectedSkin;
	import com.allofus.holburne.learningzone.guiassets.HomepageNextUpSkin;
	import com.allofus.holburne.learningzone.guiassets.NextIconDownSkin;
	import com.allofus.holburne.learningzone.guiassets.NextIconUpSkin;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	import flash.display.Bitmap;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class NextButton extends AbstractButton
	{
		
		protected var upSkin:Bitmap;
		protected var downSkin:Bitmap;
		
		public function NextButton(vo : ButtonVO, useLarge:Boolean = false)
		{
			upSkin = useLarge ? new Bitmap(new HomepageNextUpSkin(0,0)) : new Bitmap(new NextIconUpSkin(0,0));
			addChild(upSkin);
			
			downSkin = useLarge ? new  Bitmap(new HomepageNextSelectedSkin(0,0)) : new Bitmap(new NextIconDownSkin(0,0));
			downSkin.visible = false;
			addChild(downSkin);
			
			super(vo);
		}
		
		override protected function handleMouseDown(event:MouseEvent):void
		{
			upSkin.visible = false;
			downSkin.visible = true;
		}
		
		override protected function handleMouseUp(event:MouseEvent):void
		{
			upSkin.visible = true;
			downSkin.visible = false;
		}
		
		override public function dispose():void
		{
			if(upSkin)
				upSkin.bitmapData.dispose();
			upSkin = null;
			
			if(downSkin)
				downSkin.bitmapData.dispose();
			downSkin = null;
			
			super.dispose();
		}
	}
}
