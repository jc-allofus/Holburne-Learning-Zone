package com.allofus.holburne.learningzone.view.component.button
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import com.allofus.holburne.learningzone.view.component.button.icon.ButtonIcon;
	import com.allofus.holburne.learningzone.view.component.button.icon.IconCheckBlueDO;
	import com.allofus.holburne.learningzone.view.component.button.icon.IconCheckGreenDO;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;

	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class ButtonWithCheckIcon extends AbstractButton
	{
		public static const ICON_CHECK_GREEN:String = "buttonWithIcon/IconCheckGreen";
		public static const ICON_CHECK_BLUE:String = "buttonWithIcon/IconCheckBlue";
		
		protected var icon:ButtonIcon;
		protected var label:TextField;
		
		public function ButtonWithCheckIcon(vo : ButtonVO, icon:String = ICON_CHECK_GREEN)
		{
			switch(icon)
			{
				case ICON_CHECK_GREEN:
					this.icon = new IconCheckGreenDO();
					break;
					
				case ICON_CHECK_BLUE:
					this.icon = new IconCheckBlueDO();
					break;
			}
			
			if(icon)
			{
				addChild(this.icon);
			}
			
			if(vo.label)
			{
				label = FontManager.createTextField(vo.label,100,NaN,true);
				label.wordWrap = false;
				addChild(label);
				if(icon)
				{
					PositionUtil.centerVertically(label, this.icon);
					PositionUtil.positionToTheRight(label, this.icon);
				}
			}
			
			super(vo);
		}
		
		override public function set selected(value:Boolean):void
		{
			_selected = value;
			_selected ? icon.select() : icon.up();
		}
		
	}
}
