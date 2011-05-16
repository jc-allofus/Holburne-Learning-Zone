package com.allofus.holburne.learningzone.view.component.button.hotspot
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.greensock.TweenMax;
	import com.allofus.holburne.learningzone.guiassets.PinSelectedSkin;
	import com.allofus.holburne.learningzone.guiassets.PinUpSkin;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class HotspotPin extends Sprite implements IHotspotButton
	{
		protected var _upSkin:PinUpSkin;
		protected var _selectedSkin:PinSelectedSkin;
		protected var _selected:Boolean = false;
		
		protected var _vo:HotspotButtonVO;
		
		public function HotspotPin(vo:HotspotButtonVO)
		{
			visible = false;
			this._vo = vo;
			
			x = vo.target.x;
			y = vo.target.y;
			
			_upSkin = new PinUpSkin();
			_selectedSkin = new PinSelectedSkin();
			_selectedSkin.visible = false;
			_selectedSkin.alpha = 0;
			
			addChild(_upSkin);
			addChild(_selectedSkin);
			
			buttonMode = true;
			
		}
		
		public function transitionIn(delay:Number = 0):void
		{
			TweenMax.from(this, AppGlobals.FADE_DURATION, {autoAlpha:0, y:"-20", delay:delay, onComplete:startPulse});
		}
		
		public function select() : void
		{
			stopPulse();
			TweenMax.to(_selectedSkin, 0, {autoAlpha:1, ease:AppGlobals.FADE_EASE});
			_selected = true;
		}
		
		public function deselect() : void
		{
			stopPulse();
			TweenMax.to(_selectedSkin, AppGlobals.FADE_DURATION, {autoAlpha:0, ease:AppGlobals.FADE_EASE, onComplete:startPulse});
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
		
		public function startPulse():void
		{
			_selectedSkin.alpha = 0; 
			var d:Number = Math.random() * 2;
			TweenMax.to(_selectedSkin, 1, {autoAlpha:0.5, repeat:-1, yoyo:true, delay:d});
		}
		
		public function stopPulse():void
		{
			TweenMax.killTweensOf(_selectedSkin);
		}
		
				public function get vo() : HotspotButtonVO
		{
			return _vo;
		}
		
		public function dispose() : void
		{
			if(_selectedSkin)
				TweenMax.killTweensOf(_selectedSkin);
				
			TweenMax.killTweensOf(this);
				
			_selected = false;
			removeChild(_upSkin);
			removeChild(_selectedSkin);
			
			_vo = null;
			_upSkin = null;
			_selectedSkin = null;
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
		}


		private static const logger : ILogger = GetLogger.qualifiedName(HotspotPin);

	}
}
