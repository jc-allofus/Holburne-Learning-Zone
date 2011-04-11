package com.allofus.holburne.learningzone.view.component.button
{

	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.guiassets.TimelineButtonIcon;
	import com.allofus.holburne.learningzone.guiassets.TimelineButtonSelectedIcon;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;

	import flash.display.Bitmap;
	import flash.text.TextField;
	/**
	 * @author jc
	 */
	public class TimelineButton extends AbstractButton
	{
		
		protected var upSkin:Bitmap;
		protected var selectedSkin:Bitmap;
		protected var label:TextField;
		
		public function TimelineButton(vo:ButtonVO)
		{
			upSkin = new Bitmap(new TimelineButtonIcon(0,0));
			selectedSkin = new Bitmap(new TimelineButtonSelectedIcon(0,0));
			selectedSkin.visible = false;
			
			upSkin.x = -upSkin.width * 0.5;
			upSkin.y = -upSkin.height * 0.5;
			
			selectedSkin.x = -selectedSkin.width * 0.5;
			selectedSkin.y = -selectedSkin.height * 0.5;
			
			label = FontManager.createTextField(vo.label);
			label.x = -label.width * 0.5;
			PositionUtil.positionUnder(label, upSkin);
			addChild(label);
			
			addChild(upSkin);
			addChild(selectedSkin);
			
			super(vo);
		}
		
		public function select():void
		{
			selectedSkin.visible = true;
			upSkin.visible = false;
			TweenMax.to(label, AppGlobals.FADE_DURATION, {tint:0xb00404});
		}

		public function deselect() : void
		{
			selectedSkin.visible = false;
			upSkin.visible = true;
			TweenMax.to(label, AppGlobals.FADE_DURATION, {removeTint:true});
		}
	}
}
