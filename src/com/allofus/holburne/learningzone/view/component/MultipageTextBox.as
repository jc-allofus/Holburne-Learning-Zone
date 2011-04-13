package com.allofus.holburne.learningzone.view.component
{
	import flash.events.MouseEvent;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.guiassets.TextPanelDecoration;
	import com.allofus.holburne.learningzone.view.component.button.NextButton;
	import com.allofus.holburne.learningzone.view.component.button.PrevButton;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;

	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class MultipageTextBox extends Sprite
	{
		protected var background:Shape;
		protected var glowShape:Shape;
		protected var decoration:Bitmap;
		public var titleField:TextField;
		protected var pagesLayer:Sprite;
		
		protected var pageDOs:Vector.<TextField>;
		protected var currentPage:int = 0;
		
		protected var nextButton:NextButton;
		protected var prevButton:PrevButton;
		
		public function MultipageTextBox(title : String, pages :Array, targetWidth : Number = AppGlobals.RIGHT_FRAME_WIDTH, targetHeight : Number = NaN)
		{
			var BORDER_SIZE:int = AppGlobals.TEXT_BORDER_SIZE;
			var HEADER_GAP:int = AppGlobals.TEXT_HEADER_GAP;
			
			glowShape = new Shape();
			addChild(glowShape);
			
			//decoration thingy
			decoration = new Bitmap(new TextPanelDecoration(0,0));
			
			decoration.y = Math.round((BORDER_SIZE * 0.5) - (decoration.height * 0.5));
			addChild(decoration);
			
			titleField = FontManager.createStyledTextField(title, "title");
			titleField.y = BORDER_SIZE;
			addChild(titleField);
			
			pagesLayer = new Sprite();
			pagesLayer.x = BORDER_SIZE;
			PositionUtil.positionUnder(pagesLayer, titleField, HEADER_GAP);
			addChild(pagesLayer);
			
			pageDOs = new Vector.<TextField>();
			if(pages && pages.length>0)
			{
				var bw:Number = targetWidth - (BORDER_SIZE * 2);
				var page:TextField;
				for (var i : int = 0; i < pages.length; i++) 
				{
					page = FontManager.createTextField(pages[i],bw,0,true);	
					page.visible = false;
					page.alpha = 0;
					pagesLayer.addChild(page);
					pageDOs.push(page);
				}
				drawPagesBG();
			}
			
			nextButton = new NextButton(null);
			nextButton.addEventListener(MouseEvent.CLICK, handleNextClicked);
			addChild(nextButton);
			PositionUtil.centerHorizontally(nextButton, pagesLayer);
			PositionUtil.positionUnder(nextButton, pagesLayer);
			
			prevButton = new PrevButton(null);
			prevButton.addEventListener(MouseEvent.CLICK, handlePrevClicked);
			addChild(prevButton);
			PositionUtil.centerHorizontally(prevButton, pagesLayer);
			PositionUtil.positionUnder(prevButton, pagesLayer);
			prevButton.visible = false;
			
			var th:Number = (isNaN(targetHeight)) ? pagesLayer.y + pagesLayer.height + BORDER_SIZE : targetHeight;
			
			glowShape.graphics.beginFill(0xFFFFFF);
			glowShape.graphics.drawRect(0, 0, targetWidth, th);
			var gf:GlowFilter = new GlowFilter(0, 0.25,20,20,1,1,false,true);
			glowShape.filters = [gf];
			
			graphics.beginFill(0xFFFFFF, 0.3);
			graphics.drawRect(0, 0, targetWidth, th);
			
			PositionUtil.centerHorizontally(decoration, this );
			PositionUtil.centerHorizontally(titleField, this);
			
			showPage(0);
		}

		protected function handleNextClicked(event : MouseEvent) : void
		{
			if(currentPage+1 < pageDOs.length)
				showPage(currentPage+1);
		}

		private function handlePrevClicked(event : MouseEvent) : void
		{
			if(currentPage-1 >= 0)
				showPage(currentPage-1);
		}

		protected function showPage(pageNumber:int):void
		{
			if(!pageDOs)return;
			
			for (var i : int = 0; i < pageDOs.length; i++) 
			{
				TweenMax.killTweensOf(pageDOs[i]);
				if(i == pageNumber)
				{
					pageDOs[i].alpha = 0;
					TweenMax.to(pageDOs[i], AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE});
					currentPage = i;
				}
				else
				{
					pageDOs[i].visible = false;
				}
			}
			
			if(currentPage >= pageDOs.length -1)
			{
				nextButton.visible = false;
				prevButton.visible = true;
			}
			else
			{
				nextButton.visible = true;
				prevButton.visible = false;
			}
		}
		
		protected function drawPagesBG():void
		{
			pagesLayer.graphics.beginFill(0xFFFFFF, 0);
			pagesLayer.graphics.drawRect(0, 0, pagesLayer.width, pagesLayer.height);
		}

		public function dispose() : void
		{
			if(prevButton)
				prevButton.removeEventListener(MouseEvent.CLICK, handlePrevClicked);
				
			if(nextButton)
				nextButton.removeEventListener(MouseEvent.CLICK, handleNextClicked);
				
			if(pageDOs)
				pageDOs.length = 0;
				
			while(numChildren >0)
			{
				removeChildAt(0);
			}
		}
	}
}
