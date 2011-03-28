package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class PopupPanel extends Sprite
	{
		private static const MARGIN:int = 20;
		private static const TEXTWIDTH:int = 250;
		
		protected var vo:PopupPanelVO;
		protected var backgroundPane:Shape;
		protected var text:TextField;
		protected var image:Bitmap;
		
		public var closeButton:ClosePanelButton;

		public function PopupPanel(vo:PopupPanelVO)
		{
			visible = false;
			alpha = 0;
			backgroundPane = new Shape();
			addChild(backgroundPane);
			
			text =  FontManager.createTextField(vo.text,TEXTWIDTH,0,true);
			addChild(text);
						
			if(vo.imageClassRef)
			{
				image = new Bitmap(new vo.imageClassRef(0,0));
				addChild(image);
			}
			
			closeButton = new ClosePanelButton();
			closeButton.addEventListener(MouseEvent.CLICK, close);
			addChild(closeButton);
			
			draw();
		}
		
		protected function draw():void
		{
			if(image)
			{
				image.x = image.y = MARGIN;
				PositionUtil.positionToTheRight(text, image, MARGIN);
			}
			else
			{
				text.x = MARGIN;
			}
			text.y = MARGIN;
			
			PositionUtil.positionToTheRight(closeButton, text);
			PositionUtil.positionUnder(closeButton, text);
			closeButton.y = height - closeButton.height;
			
			var g:Graphics = backgroundPane.graphics;
			g.clear();
			g.beginFill(0xFFFFFF, 1);
			g.drawRect(0, 0, width + (MARGIN * 2), height + (MARGIN * 2));
			
			var gf:GlowFilter = new GlowFilter(0, 1,12,12,1);
			filters = [gf];
		}
		
		public function transitionIn():void
		{
			TweenMax.to(this, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE});
		}
		
		public function close(event:Event = null):void
		{
			TweenMax.to(this, 0.1, {autoAlpha:0, ease:AppGlobals.FADE_EASE, onComplete:finishedClosing});
			dispatchEvent(new Event(Event.CLOSING));
		}
		
		protected function finishedClosing():void
		{
			dispose();
		}
		
		public function dispose():void
		{
			TweenMax.killTweensOf(this);
			
			if(image)
			{
				image.bitmapData.dispose();
				removeChild(image);
			}
			image = null;
			
			if(text)removeChild(text);
			text = null;
			
			if(closeButton)
			{
				closeButton.removeEventListener(MouseEvent.CLICK, close);
				removeChild(closeButton);
			}
			closeButton = null;
			
			if(backgroundPane)
			{
				backgroundPane.graphics.clear();
				removeChild(backgroundPane);
			}
			backgroundPane = null;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( PopupPanel );
	}
}
