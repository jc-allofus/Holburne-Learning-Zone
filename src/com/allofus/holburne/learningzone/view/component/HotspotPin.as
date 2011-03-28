package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.greensock.TweenMax;
	import com.allofus.holburne.learningzone.guiassets.PinSelectedSkin;
	import com.allofus.holburne.learningzone.guiassets.PinUpSkin;
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class HotspotPin extends Sprite
	{
		protected var upSkin:PinUpSkin;
		protected var selectedSkin:PinSelectedSkin;
		protected var _selected:Boolean = false;
		
		public var vo:HotspotPinVO;
		
		public function HotspotPin(vo:HotspotPinVO)
		{
			visible = false;
			this.vo = vo;
			
			x = vo.target.x;
			y = vo.target.y;
			
			upSkin = new PinUpSkin();
			selectedSkin = new PinSelectedSkin();
			selectedSkin.visible = false;
			selectedSkin.alpha = 0;
			
			addChild(upSkin);
			addChild(selectedSkin);
			
			buttonMode = true;
			
		}
		
		public function transitionIn(delay:Number = 0):void
		{
			TweenMax.from(this, AppGlobals.FADE_DURATION, {autoAlpha:0, y:"-20", delay:delay});
		}
		
		public function select() : void
		{
			TweenMax.to(selectedSkin, 0, {autoAlpha:1, ease:AppGlobals.FADE_EASE});
			_selected = true;
		}
		
		public function deselect() : void
		{
			TweenMax.to(selectedSkin, AppGlobals.FADE_DURATION, {autoAlpha:0, ease:AppGlobals.FADE_EASE});
			_selected = false;
		}

		public function get selected() : Boolean
		{
			return _selected;
		}

		public function set selected(selected : Boolean) : void
		{
			_selected = selected;
		}
		
		public function dispose() : void
		{
			_selected = false;
			removeChild(upSkin);
			removeChild(selectedSkin);
			
			vo = null;
			upSkin = null;
			selectedSkin = null;
		}

		private static const logger : ILogger = GetLogger.qualifiedName(HotspotPin);


	}
}
