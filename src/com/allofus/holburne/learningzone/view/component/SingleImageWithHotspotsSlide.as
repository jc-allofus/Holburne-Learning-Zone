package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.util.PositionUtil;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class SingleImageWithHotspotsSlide extends AbstractSlide
	{
		protected var img:ImageWithBorderAndCaption;
		protected var text:TextBoxWithTitleAndDescription;
		protected var pinVOs:Vector.<HotspotPinVO>;
		protected var pins:Vector.<HotspotPin>;
		protected var pinsLayer:Sprite;
		protected var popupPanelLayer:Sprite;
		
		public function SingleImageWithHotspotsSlide()
		{
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
		
		protected function makePins():void
		{
			if(!pinVOs)return;
			var pin:HotspotPin;
			for (var i : int = 0; i < pinVOs.length; i++) 
			{
				pin = new HotspotPin(pinVOs[i]);
				pin.addEventListener(MouseEvent.CLICK, handlePinClicked);
				pinsLayer.addChild(pin);
				pins.push(pin);
			}
		}
		
		protected function handlePinClicked(event:MouseEvent):void
		{
			var pin:HotspotPin = event.currentTarget as HotspotPin;
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
			var p:HotspotPin;
			while(pinsLayer.numChildren > 0)
			{
				p = pinsLayer.getChildAt(0) as HotspotPin;
				p.removeEventListener(MouseEvent.CLICK, handlePinClicked);
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
				popupPanelLayer.removeChildAt(0); //faster than removing by reference
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
				
			img = null;
			text = null;
			pins = null;
			pinsLayer = null;
			popupPanelLayer = null;
			
			super.dispose();
		}
	}
}
