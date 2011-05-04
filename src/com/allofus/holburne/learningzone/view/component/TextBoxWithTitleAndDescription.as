package com.allofus.holburne.learningzone.view.component
{
	import com.greensock.TweenMax;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.guiassets.TextPanelDecoration;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;

	import mx.logging.ILogger;

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
		protected var BORDER_SIZE:int = AppGlobals.TEXT_BORDER_SIZE;
		protected var HEADER_GAP:int = AppGlobals.TEXT_HEADER_GAP;
		protected var textfieldWidth:Number = 100;
		
		protected var background:Shape;
		protected var glowShape:Shape;
		protected var decoration:Bitmap;
		public var titleField:TextField;
		public var bodyField:TextField;
		public var additionalText:TextField;
		
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
			
			textfieldWidth = targetWidth - (BORDER_SIZE * 2);
			if(body != "")
			{
				bodyField = FontManager.createTextField(body,textfieldWidth,0,true);
				bodyField.x = BORDER_SIZE;
				PositionUtil.positionUnder(bodyField, titleField, HEADER_GAP);
				addChild(bodyField);	
			}
			
			var th:Number;
			if(bodyField)
				th = (isNaN(targetHeight)) ? bodyField.y + bodyField.height + BORDER_SIZE : targetHeight;
			else
				th = (isNaN(targetHeight)) ? titleField.y + titleField.height + BORDER_SIZE : targetHeight;
			
			glowShape.graphics.beginFill(0xFFFFFF);
			glowShape.graphics.drawRect(0, 0, targetWidth, th);
			//{color:0x333333, alpha:1, blurX:12, blurY:12, strength:1, inner:false, knockout:false, quality:1}
			var gf:GlowFilter = new GlowFilter(0, 0.25,20,20,1,3,false,true);
			glowShape.filters = [gf];
			
			graphics.beginFill(0xFFFFFF, 0.3);
			graphics.drawRect(0, 0, targetWidth, th);		
			
			
			PositionUtil.centerHorizontally(decoration, this );
			PositionUtil.centerHorizontally(titleField, this);
		}
		
		public function get bottomOfCopy():Number
		{
			if(bodyField)
				return bodyField.y + bodyField.height;
				
			else
				return titleField.y + titleField.height;
		}
		
		public function setAdditionalText(value : String) : void
		{
			if(!additionalText)
			{
				additionalText = FontManager.createTextField(value || "",textfieldWidth, 0, true);
				addChild(additionalText);
				additionalText.x = BORDER_SIZE;
				additionalText.y = bottomOfCopy + 20;
			}
			else
			{
				if(value != additionalText.htmlText)
				{
					additionalText.htmlText = value || "";
					additionalText.alpha = 0;
					TweenMax.to(additionalText, AppGlobals.FADE_DURATION, {alpha:1, ease:AppGlobals.FADE_EASE});	
				}
			}
		}
		
		public function set title(value:String):void
		{
			titleField.htmlText = "<p class='title'>" + value + "</p>";
			PositionUtil.centerHorizontally(titleField, this);
		}
		
		public function centerBodyCopy():void
		{
			PositionUtil.centerHorizontally(bodyField, this);
		}
		
		public function transitionIn(delay:Number = 0):void
		{
			//TweenMax.to(this, AppGlobals.FADE_DURATION, {ease:AppGlobals.FADE_EASE, autoAlpha:1, glowFilter:AppGlobals.GLOW_ON, delay:delay});
		}
		private static const logger:ILogger = GetLogger.qualifiedName( TextBoxWithTitleAndDescription );

	}
}
