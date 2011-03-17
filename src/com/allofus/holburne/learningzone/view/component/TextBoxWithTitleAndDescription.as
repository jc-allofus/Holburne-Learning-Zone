package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.guiassets.TextPanelDecoration;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;

	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;

	/**
	 * white box with title and body copy;
	 * width/height parameters in the constructor should INCLUDE the border/margin as well
	 * @author jc
	 */
	public class TextBoxWithTitleAndDescription extends Sprite
	{
		
		public static const BORDER_SIZE:int = 60;
		public static const HEADER_GAP:int = 35;
		
		protected var background:Shape;
		protected var decoration:Bitmap;
		protected var _titleField:TextField;
		protected var _bodyField:TextField;
		
		public function TextBoxWithTitleAndDescription(title:String, body:String, width:Number = AppGlobals.RIGHT_FRAME_WIDTH)
		{
			background = new Shape();
			addChild(background);
			
			//decoration thingy
			decoration = new Bitmap(new TextPanelDecoration(0,0));
			
			decoration.y = Math.round((BORDER_SIZE * 0.5) - (decoration.height * 0.5));
			addChild(decoration);
			
			_titleField = FontManager.createStyledTextField(title, "title");
			_titleField.y = BORDER_SIZE;
			addChild(_titleField);
			
			var bw:Number = width - (BORDER_SIZE * 2);
			_bodyField = FontManager.createTextField(body,bw,0,true);
			_bodyField.x = BORDER_SIZE;
			PositionUtil.positionUnder(_bodyField, _titleField, HEADER_GAP);
			addChild(_bodyField);	
			
			var th:Number = _bodyField.y + _bodyField.height + BORDER_SIZE;
			
			background.graphics.beginFill(0xFFFFFF);
			background.graphics.drawRect(0, 0, width, th);
			
			PositionUtil.centerHorizontally(decoration, this );
			PositionUtil.centerHorizontally(_titleField, this);
		}
		
		public function transitionIn(delay:Number = 0):void
		{
			TweenMax.to(this, AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE, autoAlpha:1, glowFilter:AppGlobals.GLOW_ON, delay:delay});
		}
	}
}
