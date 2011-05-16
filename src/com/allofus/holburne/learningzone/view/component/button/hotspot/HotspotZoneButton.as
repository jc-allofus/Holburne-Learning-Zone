package com.allofus.holburne.learningzone.view.component.button.hotspot
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.greensock.TweenMax;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * @author jc
	 */
	public class HotspotZoneButton extends Sprite implements IHotspotButton
	{
		protected var _vo:HotspotButtonVO;
		protected var rect:Rectangle;
		protected var snapshot:Bitmap;
		protected var outline:Shape;
		protected var _selected:Boolean = false;
		
		public function HotspotZoneButton(vo:HotspotButtonVO, zone:Rectangle, snapshotRef:BitmapData, offset:Point)
		{
			alpha = 0;
			_vo = vo;
			rect = zone;
			
			var snapshotBMD:BitmapData = new BitmapData(rect.width, rect.height,false, 0xFF0000);
			var offsetRect:Rectangle = new Rectangle(rect.x - offset.x, rect.y - offset.y, rect.width, rect.height);
			snapshotBMD.copyPixels(snapshotRef, offsetRect, new Point(0,0));
			snapshot = new Bitmap(snapshotBMD);
			snapshot.x = rect.x;
			snapshot.y = rect.y;
			addChild(snapshot);
			
			outline = new Shape();
			outline.graphics.lineStyle(1,0xFFFFFF);
			outline.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			addChild(outline);
			
			
			buttonMode = true;
		}


		public function transitionIn(delay : Number = 0) : void
		{
			TweenMax.to(this, AppGlobals.FADE_DURATION, {autoAlpha:1, delay:delay, ease:AppGlobals.FADE_EASE});
		}

		public function select() : void
		{
			outline.graphics.clear();
			outline.graphics.lineStyle(1, 0xb00404);
			outline.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			outline.alpha = 0;
			TweenMax.to(outline, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE});
			_selected = true;
		}

		public function deselect() : void
		{
			if(!_selected)
				return;
			outline.graphics.clear();
			outline.graphics.lineStyle(1, 0xffffff);
			outline.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			outline.alpha = 0;
			TweenMax.to(outline, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE});
			_selected = false;
		}

		public function get vo() : HotspotButtonVO
		{
			return _vo;
		}

		public function get selected() : Boolean
		{
			return _selected;
		}

		public function set selected(value : Boolean) : void
		{
			_selected = value;
		}
		
		public function dispose() : void
		{
			
			if(snapshot)
				snapshot.bitmapData.dispose();
				
			if(outline)
				outline.graphics.clear;
				
			_vo = null;
			rect = null;
			snapshot = null;
			outline = null;
			_selected = false;
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}
			
		}
	}
}
