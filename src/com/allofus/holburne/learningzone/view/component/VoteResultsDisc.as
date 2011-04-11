package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class VoteResultsDisc extends Sprite
	{
		
		public static const COLOR_GREEN:uint = 0xc5c48e;
		public static const COLOR_BLUE:uint = 0x75b2b0;
		
		protected var knockoutShape:Shape;
		protected var colorFillShape:Shape;
		
		protected var _color:uint;
		protected var _targetSize:Number = 100;
		protected var _label:TextField;
		protected var _percent:int = 0;
		protected var _labelClass:String = "voteResultDiscLabel";
		
		
		public function VoteResultsDisc(color:uint = COLOR_GREEN)
		{
			_color = color;
			
			knockoutShape = new Shape();
			addChild(knockoutShape);
			
			colorFillShape = new Shape();
			addChild(colorFillShape);
			
			
			_label = FontManager.createStyledTextField("0%",_labelClass);
			PositionUtil.centerHorizontally(_label, this);
			PositionUtil.centerVertically(_label, this);
			addChild(_label);
		}
		
		protected function draw():void
		{
			knockoutShape.graphics.clear();
			knockoutShape.graphics.beginFill(0xFFFFFF);
			knockoutShape.graphics.drawCircle(0, 0, _targetSize);
			
			colorFillShape.graphics.clear();
			colorFillShape.graphics.beginFill(_color, 0.6);
			colorFillShape.graphics.drawCircle(0, 0, _targetSize);
		}
		
		public function set percent(value:Number):void
		{
			
			_percent = int(value);
			_targetSize = (100 + _percent) * 0.5;
			label = String(Math.round(value));
			draw();
		}
		
		public function get percent():Number
		{
			return _percent;
		}
		
		public function set label(value:String):void
		{
			_label.htmlText = "<p class='"+ _labelClass + "'>" + value + "%</p>";
			_label.x = -(_label.width * 0.5);
		}
		
		
	}
}
