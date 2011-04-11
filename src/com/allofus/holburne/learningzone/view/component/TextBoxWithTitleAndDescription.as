package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.guiassets.TextPanelDecoration;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;

	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
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
		protected var glowShape:Shape;
		protected var decoration:Bitmap;
		public var titleField:TextField;
		public var bodyField:TextField;
		
		public function TextBoxWithTitleAndDescription(title:String, body:String, targetWidth:Number = AppGlobals.RIGHT_FRAME_WIDTH, targetHeight:Number = NaN)
		{
			glowShape = new Shape();
			addChild(glowShape);
			
			background = new Shape();
			addChild(background);
			
			//decoration thingy
			decoration = new Bitmap(new TextPanelDecoration(0,0));
			
			decoration.y = Math.round((BORDER_SIZE * 0.5) - (decoration.height * 0.5));
			addChild(decoration);
			
			titleField = FontManager.createStyledTextField(title, "title");
			titleField.y = BORDER_SIZE;
			addChild(titleField);
			
			var bw:Number = targetWidth - (BORDER_SIZE * 2);
			bodyField = FontManager.createTextField(body,bw,0,true);
			bodyField.x = BORDER_SIZE;
			PositionUtil.positionUnder(bodyField, titleField, HEADER_GAP);
			addChild(bodyField);	
			
			var th:Number = (isNaN(targetHeight)) ? bodyField.y + bodyField.height + BORDER_SIZE : targetHeight;
			
			glowShape.graphics.beginFill(0xFFFFFF);
			glowShape.graphics.drawRect(0, 0, targetWidth, th);
			//{color:0x333333, alpha:1, blurX:12, blurY:12, strength:1, inner:false, knockout:false, quality:1}
			var gf:GlowFilter = new GlowFilter(0, 0.25,20,20,1,1,false,true);
			glowShape.filters = [gf];
			
			graphics.beginFill(0xFFFFFF, 0.3);
			graphics.drawRect(0, 0, targetWidth, th);		
			
			
			PositionUtil.centerHorizontally(decoration, this );
			PositionUtil.centerHorizontally(titleField, this);
		}
		
		public function get bottomOfCopy():Number
		{
			return bodyField.y + bodyField.height;
		}
		
		public function transitionIn(delay:Number = 0):void
		{
			//TweenMax.to(this, AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE, autoAlpha:1, glowFilter:AppGlobals.GLOW_ON, delay:delay});
		}
	}
}
