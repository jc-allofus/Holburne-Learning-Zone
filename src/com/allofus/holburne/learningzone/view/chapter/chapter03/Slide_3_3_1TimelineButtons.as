package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.events.TimelineEvent;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;
	import com.allofus.holburne.learningzone.view.component.button.TimelineButton;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class Slide_3_3_1TimelineButtons extends Sprite
	{
		
		protected static const MARGIN:int = 150;
		
		protected static const MARKER_HEIGHT:int = 75;
		protected static const V_DIVIDER_HEIGHT:int = 245;
 		
		protected var _selected:TimelineButton;
		protected var _marker:Shape; //vertical red line that slides along to the current date
		protected var _hDivider:Shape;//horizontal red line under the buttons 
		protected var _vDivider:Shape; //vertical red line perpindicular to the _hDivider, splits it in 1/2
		
		protected var vos:Array = [
			new ButtonVO({label:"<p>1793</p>", actionParams:1}),
			new ButtonVO({label:"<p>1794</p>", actionParams:2}),
			new ButtonVO({label:"<p>1802-1835</p>", actionParams:3}),
			new ButtonVO({label:"<p>1835-1861</p>", actionParams:4}),
			new ButtonVO({label:"<p>1861</p>", actionParams:5}),
			new ButtonVO({label:"<p>1861-1874</p>", actionParams:6}),
			new ButtonVO({label:"<p>1868</p>", actionParams:7}),
			new ButtonVO({label:"<p>1874</p>", actionParams:8}),
			new ButtonVO({label:"<p>1893</p>", actionParams:9}),
			new ButtonVO({label:"<p>1915</p>", actionParams:10}),
			new ButtonVO({label:"<p>2011</p>", actionParams:11})
		];
		
		public function Slide_3_3_1TimelineButtons()
		{
			var btn:TimelineButton;
			var underButton:Number;
			var btnX:Number;
			for (var i : int = 0; i < vos.length; i++) 
			{
				btn = new TimelineButton(vos[i]);
				btn.x = i * MARGIN;
				btn.addEventListener(MouseEvent.CLICK, handleButtonClicked);
				addChild(btn);
				btnX = btn.x;
				underButton = btn.y + btn.height; 
			}
			
			_marker = new Shape();
			_marker.graphics.lineStyle(1, 0xb00404);
			_marker.graphics.lineTo(0, MARKER_HEIGHT);
			_marker.y = underButton;
			addChild(_marker);
			
			_hDivider = new Shape();
			_hDivider.graphics.lineStyle(1, 0xb00404);
			_hDivider.graphics.lineTo(btnX+1, 0);
			PositionUtil.positionUnder(_hDivider, _marker, -1);
			addChild(_hDivider);
			
			_vDivider = new Shape();
			_vDivider.graphics.lineStyle(1, 0xb00404);
			_vDivider.graphics.lineTo(0, V_DIVIDER_HEIGHT);
			PositionUtil.centerHorizontally(_vDivider, _hDivider);
			_vDivider.x -=1;
			PositionUtil.positionUnder(_vDivider, _hDivider, -1);
			addChild(_vDivider);
		}

		protected function handleButtonClicked(event : MouseEvent) : void
		{
			if(_selected)
				_selected.deselect();
				
			_selected = event.currentTarget as TimelineButton;
			_selected.select();
			
			TweenMax.to(_marker, 0.75, {x:_selected.x, ease:AppGlobals.FADE_EASE});
			
			dispatchEvent(new TimelineEvent(TimelineEvent.SELECTED, _selected));
			
		}
	}
}
