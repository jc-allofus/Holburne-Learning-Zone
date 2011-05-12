package com.allofus.holburne.learningzone.view.component.button
{
	import com.greensock.TweenMax;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.holburne.learningzone.guiassets.IconDot;
	import com.holburne.learningzone.guiassets.IconDotSelected;

	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class NumberedTextButton extends AbstractButton
	{
		protected var iconUp:Bitmap;
		protected var iconDown:Bitmap;
		protected var iconLabel:TextField;
		protected var label:TextField;
		
		public function NumberedTextButton(vo : ButtonVO)
		{
			iconUp = new Bitmap(new IconDot(0,0));
			addChild(iconUp);
			
			iconDown = new Bitmap(new IconDotSelected(0,0));
			iconDown.visible = false;
			addChild(iconDown);
			
			iconLabel = FontManager.createStyledTextField(vo.iconLabel,"numberedTextButtonIcon");
			PositionUtil.centerHorizontally(iconLabel, iconUp);
			PositionUtil.centerVertically(iconLabel, iconUp);
			addChild(iconLabel);
			
			label = FontManager.createStyledTextField(vo.label, "copy",true,500,15);
			PositionUtil.positionToTheRight(label, iconUp);
			PositionUtil.centerVertically(label, iconUp);
			addChild(label);
			
			super(vo);
		}
		
		override protected function handleMouseDown(event:MouseEvent):void
		{
			iconDown.visible = true;
			TweenMax.to(label,0,{tint:0xb00404});
		}
		
		override protected function handleMouseUp(event:MouseEvent):void
		{
			iconDown.visible = false;
			TweenMax.to(label,0,{removeTint:true});
		}
		
		override public function dispose():void
		{
			if(iconUp)
				iconUp.bitmapData.dispose();
			iconUp = null;
			
			if(iconDown)
				iconDown.bitmapData.dispose();
			iconDown = null;
			
			iconLabel = null;
			label = null;
			
			super.dispose();
		}
	}
}
