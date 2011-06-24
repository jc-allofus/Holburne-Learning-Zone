package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;

	import mx.logging.ILogger;

	import flash.display.Graphics;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class TimelinePopup extends PopupPanel
	{
		
		protected static const PADDING_V:int = 40;
		protected static const PADDING_H:int = 30;
		
		protected var caption:TextField;
		
		protected var panelWidth:Number = AppGlobals.TIMELINE_POPUP_WIDTH;
		protected var panelHeight:Number = NaN;
		
		public var closeButton:ClosePanelButton;
		
		
		public function TimelinePopup(vo:PopupPanelVO, tWidth:Number = AppGlobals.TIMELINE_POPUP_WIDTH, tHeight:Number = NaN)
		{
			panelWidth = tWidth;
			panelHeight = tHeight;
			
			if(image && vo.imageCaption)
			{
				caption = FontManager.createTextField(vo.imageCaption,image.width,0,true);
				addChild(caption);
			}
			
			closeButton = new ClosePanelButton();
			closeButton.addEventListener(MouseEvent.CLICK, close);
			addChild(closeButton);
			
			
			//hacky business - reset & redraw (because panel is already drawn in super())
			panelHeight = NaN;
			
			super(vo);
		}
		
		override protected function draw():void
		{
			var ch:Number = 0;
			if(image)
			{
				image.x = PADDING_H;
				image.y = PADDING_V;
				text.width = panelWidth - image.width - (PADDING_H * 2) - PADDING_H;
				PositionUtil.positionToTheRight(text, image, PADDING_H);
				ch = image.y + image.height + PADDING_V;
				if(caption)
				{
					caption.x = PADDING_H;
					PositionUtil.positionUnder(caption, image, AppGlobals.BORDER_SIZE * 0.5);
					ch = caption.y + caption.height + PADDING_V;
				}
			}
			else
			{
				text.width = AppGlobals.RIGHT_FRAME_WIDTH - (PADDING_H*2);
				text.x = PADDING_H;
			}
			text.y = PADDING_V;
			
			ch = Math.max(ch,text.y + text.height + PADDING_V);
			if(isNaN(panelHeight))
				panelHeight = ch;
			
			var g:Graphics = backgroundPane.graphics;
			g.clear();
			g.beginFill(0xFFFFFF);
			g.drawRect(0, 0, panelWidth, panelHeight);
			
			var gf:GlowFilter = new GlowFilter(0, 0.25,20,20,1,1,false,true);
			backgroundPane.filters = [gf];
			
			graphics.beginFill(0xFFFFFF, 1);
			graphics.drawRect(0, 0, panelWidth, panelHeight);
			
			closeButton.x = panelWidth - closeButton.width;
			closeButton.y = panelHeight - closeButton.height;
		}
		
		
		override public function dispose():void
		{
			if(caption)
				removeChild(caption);
				
			if(closeButton)
			{
				closeButton.removeEventListener(MouseEvent.CLICK, close);
				removeChild(closeButton);
			}
			closeButton = null;
				
			caption = null;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( TimelinePopup );

	}
}
