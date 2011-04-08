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
		private static const MARGIN_RIGHT:int = 60;
		
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
			
			text =  FontManager.createTextField(vo.text,10,0,true);
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
				text.width = AppGlobals.RIGHT_FRAME_WIDTH - image.width - (MARGIN * 2) - MARGIN_RIGHT;
				PositionUtil.positionToTheRight(text, image, MARGIN);
			}
			else
			{
				text.width = AppGlobals.RIGHT_FRAME_WIDTH - MARGIN - MARGIN_RIGHT;
				text.x = MARGIN;
			}
			text.y = MARGIN;
			
			var g:Graphics = backgroundPane.graphics;
			g.clear();
			g.beginFill(0xFFFFFF);
			g.drawRect(0, 0, AppGlobals.RIGHT_FRAME_WIDTH, height + MARGIN);
			
			var gf:GlowFilter = new GlowFilter(0, 0.25,20,20,1,1,false,true);
			backgroundPane.filters = [gf];
			
			graphics.beginFill(0xFFFFFF, 0.3);
			graphics.drawRect(0, 0, width, height);
			
			closeButton.x = width - closeButton.width - MARGIN;
			closeButton.y = height - closeButton.height - MARGIN;
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
