package com.allofus.holburne.learningzone.view.homepage
{
	import com.allofus.holburne.learningzone.events.ChapterEvent;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.ChapterIDs;
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;
	import com.allofus.holburne.learningzone.view.component.HomePageThumbnailButton;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;
	import com.greensock.easing.Strong;
	import com.holburne.learningzone.swc.chapter1.Chap1IntroImage;
	import com.holburne.learningzone.swc.chapter2.Chap2IntroImage;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class HomepageVC extends Sprite
	{
		
		protected var homepage:HomePage1; 				//HomePage1 symbol from flash file Chapters1-10.xfl
		protected var buttonMCs:Vector.<MovieClip>; 	//will be populated with references to the clips drawn on stage in flash IDE in the HomePage1 symbol
		protected var zoomed:Boolean = false;
		
		protected var selectedButtonsLayer:Sprite;
		//protected var selectedButton:HomePageThumbnailButton;
		
		protected var zoomFrame:Shape;
		
		protected var glassPanel:Sprite;
		
		protected var _selectedChapter:ChapterVO; 
		
		public static const THUMB_SCALE:Number = 0.6;
		
		public function HomepageVC()
		{
			homepage = new HomePage1();
			homepage.cacheAsBitmap = true;
			homepage.scaleX = homepage.scaleY = THUMB_SCALE;
			buttonMCs = new <MovieClip>[homepage.t0, homepage.t1, homepage.t2, homepage.t3, homepage.t4, homepage.t5, homepage.t6, homepage.t7, homepage.t8, homepage.t9];
			addChild(homepage);
			enableButtons();
			
			selectedButtonsLayer = new Sprite();
			addChild(selectedButtonsLayer);
			
			glassPanel = new Sprite();
			glassPanel.graphics.beginFill(0xff0000, 0);
			glassPanel.graphics.drawRect(0, 0, AppGlobals.APP_WIDTH, AppGlobals.APP_HEIGHT);
			glassPanel.visible = false;
			addChild(glassPanel);
			
		}
		
		protected function enableButtons():void
		{
			for (var i : int = 0; i < buttonMCs.length; i++) 
			{
				buttonMCs[i].addEventListener(MouseEvent.CLICK, handleButtonMCClicked);
				buttonMCs[i].buttonMode = true;
			}
		}

		protected function handleButtonMCClicked(event:MouseEvent = null):void
		{
			_selectedChapter = null;
			glassPanel.visible = true;  //stop more clickity
			closeAllHomepageThumbnailButtons();

			//open newly selceted one			
			var clicked:MovieClip = event.currentTarget as MovieClip;
			var txt:String;
			var btn:HomePageThumbnailButton;
			var vo:ChapterVO = new ChapterVO();
			switch (clicked)
			{
				case homepage.t0:
					break;
					
				case homepage.t1:
					vo.thumbnail = homepage.t1;
					vo.id = ChapterIDs.CHAPTER_02;
					txt =  "<p class='imageCaptionItalic'>The Byam Family</p>";
					txt += "<p class='imageCaption'>Thomas Gainsborough (1727-1788)</p>";
					btn = new HomePageThumbnailButton(new Bitmap(new Chap2IntroImage(0,0)), txt, vo);
					break;
					
				case homepage.t2:
					vo.thumbnail = homepage.t2;
					vo.id = ChapterIDs.CHAPTER_01;
					txt =  "<p class='imageCaptionItalic'>The Byam Family</p>";
					txt += "<p class='imageCaption'>Thomas Gainsborough (1727-1788)</p>";
					btn = new HomePageThumbnailButton(new Bitmap(new Chap1IntroImage(0,0)), txt, vo);
					break;
					
				case homepage.t3:
					break;
					
				case homepage.t4:
					break;
					
				case homepage.t5:
					break;
					
				case homepage.t6:
					break;
					
				case homepage.t7:
					break;
					
				case homepage.t8:
					break;
					
				case homepage.t9:
					break;
			}
			
			if(btn)
			{
				btn.addEventListener(MouseEvent.CLICK, setSelectedChapter);
				btn.addEventListener(Event.CLOSE, handleButtonClosed);
				btn.addEventListener(Event.OPEN, handleButtonOpened);
				btn.x = clicked.x * THUMB_SCALE;
				btn.y = clicked.y * THUMB_SCALE;
				btn.scaleX = btn.scaleY = THUMB_SCALE;
				btn.expand();
				selectedButtonsLayer.addChild(btn);
			}
		}
		
		protected function closeAllHomepageThumbnailButtons():void
		{
			var btn:HomePageThumbnailButton;
			for (var i : int = 0; i < selectedButtonsLayer.numChildren; i++) 
			{
				btn = selectedButtonsLayer.getChildAt(i) as HomePageThumbnailButton;
				btn.collapse();	
			}
		}
		
		protected function setSelectedChapter(event:MouseEvent):void
		{
			var btn:HomePageThumbnailButton = event.currentTarget as HomePageThumbnailButton;
			_selectedChapter = btn.vo;
		}
		
		protected function handleButtonOpened(event:Event):void
		{
			glassPanel.visible = false;
		}
		
		protected function handleButtonClosed(event:Event):void
		{
			var btn:HomePageThumbnailButton = event.currentTarget as HomePageThumbnailButton;
			var vo:ChapterVO = btn.vo;

			if(_selectedChapter && vo.id == _selectedChapter.id)
			{
				zoom();
			}
			btn.removeEventListener(MouseEvent.CLICK, setSelectedChapter);
			btn.removeEventListener(Event.OPEN, handleButtonOpened);
			btn.removeEventListener(Event.CLOSE, handleButtonClosed);
			btn.dispose();
			if(selectedButtonsLayer.contains(btn)) selectedButtonsLayer.removeChild(btn);
		}
		
		public function zoom(delay:Number = 0) : void
		{
			if(zoomed)
			{
				//zoom back to show all thumbs
				TweenMax.to(homepage, 0.6, {x:0, y:0, scaleX:THUMB_SCALE, scaleY:THUMB_SCALE, ease:Strong.easeOut, delay:delay, onComplete:cleanup});
				_selectedChapter = null;
			}
			else
			{
				//zoom in to chapter landing image
				if(_selectedChapter && _selectedChapter.thumbnail)
				{
					var pt:Point = PositionUtil.getPositionInLeftFrame(_selectedChapter.thumbnail);
					TweenMax.to(homepage, 0.6, {x:pt.x, y:pt.y, scaleX:1, scaleY:1, ease:Strong.easeOut, onComplete:dispatchChapter});	
				}
				else
				{
					logger.warn("no selected chapter? cannot zoom into " + _selectedChapter);
				}
			}
			zoomed = !zoomed;
		}
		
		protected function dispatchChapter():void
		{
			if(_selectedChapter)
			{
				dispatchEvent(new ChapterEvent(ChapterEvent.SELECTED, _selectedChapter));
			}
		}
		
		protected function cleanup():void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HomepageVC );
	}
}
