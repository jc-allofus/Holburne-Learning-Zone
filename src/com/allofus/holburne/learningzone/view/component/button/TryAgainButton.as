package com.allofus.holburne.learningzone.view.component.button
{
	import com.allofus.holburne.learningzone.guiassets.TryAgainButtonDownSkin;
	import com.allofus.holburne.learningzone.guiassets.TryAgainButtonUpSkin;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	import flash.display.Bitmap;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class TryAgainButton extends AbstractButton
	{
		protected var upSkin:Bitmap;
		protected var downSkin:Bitmap;
		
		public function TryAgainButton(vo : ButtonVO)
		{
			upSkin = new Bitmap(new TryAgainButtonUpSkin(0,0));
			downSkin = new Bitmap(new TryAgainButtonDownSkin(0,0));
			downSkin.visible = false;
			
			addChild(upSkin);
			addChild(downSkin);
			
			super(vo);
		}
		
		override protected function handleMouseDown(event:MouseEvent):void
		{
			downSkin.visible = true;
		}
		
		override protected function handleMouseUp(event:MouseEvent):void
		{
			downSkin.visible = false;
		}
		
		override public function dispose():void
		{
			upSkin.bitmapData.dispose();
			downSkin.bitmapData.dispose();
		}
	}
}
