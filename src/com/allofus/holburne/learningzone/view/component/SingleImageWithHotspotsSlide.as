package com.allofus.holburne.learningzone.view.component
{
	import com.greensock.TweenMax;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.guiassets.HotspotZoneTarget;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.button.hotspot.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.button.hotspot.HotspotZoneButton;
	import com.allofus.holburne.learningzone.view.component.button.hotspot.IHotspotButton;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;

	import mx.logging.ILogger;

	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;



	/**
	 * @author jc
	 */
	public class SingleImageWithHotspotsSlide extends AbstractSlide
	{
		protected var img:ImageWithBorderAndCaption;
		protected var text:TextBoxWithTitleAndDescription;
		protected var pinVOs:Vector.<HotspotButtonVO>;
		protected var pins:Vector.<IHotspotButton>;
		protected var pinsLayer:Sprite;
		protected var popupPanelLayer:Sprite;
		
		protected var usingHotspotZone:Boolean = false;
		protected var imgBlankOut:Shape;
		protected var imgBlankOutAlpha:Number = 0.5;
		
		
		public function SingleImageWithHotspotsSlide()
		{
			pins = new Vector.<IHotspotButton>();
			
			if(img)
				positionInLeftFrame(img);
			
			if(text)
				positionInRightFrame(text);
		
			pinsLayer = new Sprite();
			addChild(pinsLayer);

			popupPanelLayer = new Sprite();
			addChild(popupPanelLayer);
		
			hideTargets();
			makePins();
			super();
		}
		
		
		override protected function staggerInComplete():void
		{
			if(usingHotspotZone)
				TweenMax.to(imgBlankOut, AppGlobals.FADE_DURATION, {alpha:imgBlankOutAlpha, ease:AppGlobals.FADE_EASE, onComplete:staggerInPins});
			else
				staggerInPins();
		}
		
		protected function staggerInPins():void
		{
			if(!pins)return;
			for (var i : int = 0; i < pins.length; i++) 
			{
				pins[i].transitionIn(i*0.1);
			}
		}
		
		protected function hideTargets():void
		{
			if(!pinVOs)return;
			for (var i : int = 0; i < pinVOs.length; i++) 
			{
				pinVOs[i].target.visible = false;
			}
		}
		
		//hacky, but so is this whole job
		protected function makePins():void
		{
			if(!pinVOs)return;
			var pin:IHotspotButton;
			for (var i : int = 0; i < pinVOs.length; i++) 
			{
				if(pinVOs[i].target is HotspotZoneTarget)
				{
					var r:Rectangle = new Rectangle(pinVOs[i].target.x, pinVOs[i].target.y, pinVOs[i].target.width, pinVOs[i].target.height);
					var offsetPoint:Point = new Point(img.x +AppGlobals.BORDER_SIZE, img.y + AppGlobals.BORDER_SIZE);
					pin = new HotspotZoneButton(pinVOs[i],r, img.bitmapData, offsetPoint);
					if(!imgBlankOut)
					{
						imgBlankOut = new Shape();
						imgBlankOut.graphics.beginFill(0xFFFFFF, 0.5);
						imgBlankOut.graphics.drawRect(offsetPoint.x, offsetPoint.y, img.imageWidth, img.imageHeight);
						imgBlankOut.alpha = 0;
						var imgDepth:int = getChildIndex(img);
						addChildAt(imgBlankOut, imgDepth +1);
					}
					usingHotspotZone = true;
				}
				else
				{
					pin = new HotspotPin(pinVOs[i]);
				}
				
				(pin as DisplayObject).addEventListener(MouseEvent.CLICK, handlePinClicked);
				pinsLayer.addChild((pin as DisplayObject));
				pins.push(pin);
			}
		}
		
		protected function handlePinClicked(event:MouseEvent):void
		{
			var pin:IHotspotButton = event.currentTarget as IHotspotButton;
			if(pin.selected) return;
			deselectAllPins();
			removeAllPopups();
			pin.select();
			var panel:PopupPanel = new PopupPanel(pin.vo.panelVO);
			panel.addEventListener(Event.CLOSING, deselectAllPins);
			panel.x = text.x;
			PositionUtil.positionUnder(panel, text, 15);
			popupPanelLayer.addChild(panel);
			panel.transitionIn();
		}
		
		protected function deselectAllPins(event:Event = null):void
		{
			if(!pins)return;
			for (var i : int = 0; i < pins.length; i++) 
			{
				pins[i].deselect();
			}
		}
		
		protected function removeAllPins():void
		{
			var p:IHotspotButton;
			while(pinsLayer.numChildren > 0)
			{
				p = pinsLayer.getChildAt(0) as IHotspotButton;
				(p as DisplayObject).removeEventListener(MouseEvent.CLICK, handlePinClicked);
				p.dispose();
				pinsLayer.removeChildAt(0);
			}
		}
		
		protected function removeAllPopups():void
		{
			var p:PopupPanel;
			while(popupPanelLayer.numChildren > 0)
			{
				p = popupPanelLayer.getChildAt(0) as PopupPanel;
				p.dispose();
				p.removeEventListener(Event.CLOSING, deselectAllPins);
				popupPanelLayer.removeChildAt(0);
			}
		}
		
		override public function dispose():void
		{
			removeAllPins();
			removeAllPopups();
			
			if(pinVOs)
			{
				pinVOs.length = 0;
			}
			pinVOs = null;
			
			if(pins)
			{
				pins.length = 0;
			}
			
			if(img)
				img.dispose();
				
			if(text)
				text.dispose();
				
			if(imgBlankOut)
				TweenMax.killTweensOf(imgBlankOut);
				
			img = null;
			imgBlankOut = null;
			text = null;
			pins = null;
			pinsLayer = null;
			popupPanelLayer = null;
			
			super.dispose();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( SingleImageWithHotspotsSlide );
	}
}
