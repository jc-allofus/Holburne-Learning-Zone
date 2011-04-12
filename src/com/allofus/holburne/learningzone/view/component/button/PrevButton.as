package com.allofus.holburne.learningzone.view.component.button
{
	import com.allofus.holburne.learningzone.guiassets.PrevIconDownSkin;
	import com.allofus.holburne.learningzone.guiassets.PrevIconUpSkin;
	import com.allofus.holburne.learningzone.guiassets.NextIconDownSkin;
	import com.allofus.holburne.learningzone.guiassets.NextIconUpSkin;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	import flash.display.Bitmap;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class PrevButton extends AbstractButton
	{
		
		protected var upSkin:Bitmap;
		protected var downSkin:Bitmap;
		
		public function PrevButton(vo : ButtonVO)
		{
			upSkin = new Bitmap(new PrevIconUpSkin(0,0));
			addChild(upSkin);
			
			downSkin = new Bitmap(new PrevIconDownSkin(0,0));
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
	}
}
