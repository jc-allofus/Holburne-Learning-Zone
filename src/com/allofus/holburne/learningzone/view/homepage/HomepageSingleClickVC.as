package com.allofus.holburne.learningzone.view.homepage
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.events.ChapterEvent;
	import com.allofus.holburne.learningzone.model.ChapterIDs;
	import com.allofus.holburne.learningzone.model.vo.ChapterVO;
	import com.allofus.holburne.learningzone.view.component.button.NextButton;
	import com.allofus.holburne.learningzone.view.component.button.PrevButton;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;
	import com.greensock.easing.Strong;
	import com.holburne.learningzone.swc.homepage.Page1;
	import com.holburne.learningzone.swc.homepage.Page2;

	import mx.logging.ILogger;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class HomepageSingleClickVC extends Sprite
	{
		
		protected var page1:Page1; 				
		protected var page2:Page2; 		
		protected var nextButton:NextButton;
		protected var prevButton:PrevButton;		
		protected var thumbButtons:Vector.<MovieClip>; 	
		protected var zoomed:Boolean = false;
		protected var currentPage:MovieClip;
		
		protected var _selectedChapter:ChapterVO; 
		
		public static const ZOOM_IN_SPEED:Number = 1.8;
		public static const ZOOM_OUT_SPEED:Number = 0.6;
		public static const THUMB_SCALE:Number = 0.5;
		public static const SLIDE_DURATION:Number = 0.75;

		public function HomepageSingleClickVC()
		{
			page1 = new Page1();
			page1.cacheAsBitmap = true;
			
			page2 = new Page2();
			page2.cacheAsBitmap = true;
			page2.visible = false;
			
			nextButton = new NextButton(null, true);
			nextButton.x = AppGlobals.APP_WIDTH - nextButton.width - 25;
			PositionUtil.centerVerticallyByVal(nextButton, AppGlobals.APP_HEIGHT);
			
			prevButton = new PrevButton(null, true);
			prevButton.x = 25;
			prevButton.alpha = 0;
			prevButton.visible = false;
			PositionUtil.centerVerticallyByVal(prevButton, AppGlobals.APP_HEIGHT);
			
			page1.scaleX = page1.scaleY = page2.scaleX = page2.scaleY = THUMB_SCALE;
			
			thumbButtons = new <MovieClip>[page1.t1, page1.t2, page2.t3, page1.t4, page2.t5, page1.t6, page2.t7, page1.t8, page2.t9, 
			page1.t10, page2.t11, page1.t12, page2.t13, page2.t14, page2.t15, page1.t16, page2.t17, page1.t18, page2.t19, page1.t20];
			
			addChild(page1);
			addChild(page2);
			addChild(nextButton);
			addChild(prevButton);
			enableButtons();
			
			currentPage = page1;
			
		}

		protected function transitionToNext(event : MouseEvent) : void
		{
			currentPage = page2;
			page2.visible = true;
			page2.x = AppGlobals.APP_WIDTH;
			nextButton.alpha = prevButton.alpha = 0; nextButton.visible = false;
			TweenMax.to(page1, SLIDE_DURATION, {x:-AppGlobals.APP_WIDTH, ease:AppGlobals.SLIDE_EASE});
			TweenMax.to(page2, SLIDE_DURATION, {x:0, ease:AppGlobals.SLIDE_EASE});
			TweenMax.to(prevButton, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE, delay:SLIDE_DURATION});
		}

		protected function transitionToPrev(event : MouseEvent) : void
		{
			currentPage = page1;
			page1.visible = true;
			page1.x = -AppGlobals.APP_WIDTH;
			nextButton.alpha = prevButton.alpha = 0; prevButton.visible = false;
			TweenMax.to(page1, SLIDE_DURATION, {x:0, ease:AppGlobals.SLIDE_EASE});
			TweenMax.to(page2, SLIDE_DURATION, {x:AppGlobals.APP_WIDTH, ease:AppGlobals.SLIDE_EASE});
			TweenMax.to(nextButton, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE, delay:SLIDE_DURATION});
		}
		
		protected function enableButtons():void
		{
			nextButton.addEventListener(MouseEvent.CLICK, transitionToNext);
			prevButton.addEventListener(MouseEvent.CLICK, transitionToPrev);
			
			for (var i : int = 0; i < thumbButtons.length; i++) 
			{
				thumbButtons[i].addEventListener(MouseEvent.CLICK, handleButtonMCClicked);
				thumbButtons[i].buttonMode = true;
			}
		}
		
		protected function disableButtons():void
		{
			nextButton.removeEventListener(MouseEvent.CLICK, transitionToNext);
			prevButton.removeEventListener(MouseEvent.CLICK, transitionToPrev);
			
			for (var i : int = 0; i < thumbButtons.length; i++) 
			{
				thumbButtons[i].removeEventListener(MouseEvent.CLICK, handleButtonMCClicked);
				thumbButtons[i].buttonMode = false;
			}
		}
		
		protected function fadeNextPrev(show:Boolean = true):void
		{
			var a:Number = show? 1 : 0;
			nextButton.alpha = prevButton.alpha = show ? 0 : 1;
			TweenMax.to(nextButton, AppGlobals.FADE_DURATION, {alpha:a, ease:AppGlobals.FADE_EASE});
			TweenMax.to(prevButton, AppGlobals.FADE_DURATION, {alpha:a, ease:AppGlobals.FADE_EASE});
		}

		protected function handleButtonMCClicked(event:MouseEvent = null):void
		{
			_selectedChapter = null;

			//open newly selceted one			
			var clicked:MovieClip = event.currentTarget as MovieClip;
			var vo:ChapterVO;
			switch (clicked)
			{
				case page1.t1: vo = new ChapterVO(ChapterIDs.CHAPTER_01, page1.t1); break;
				case page1.t2: vo = new ChapterVO(ChapterIDs.CHAPTER_02, page1.t2); break;
				case page2.t3: vo = new ChapterVO(ChapterIDs.CHAPTER_03, page2.t3); break;
				case page1.t4: vo = new ChapterVO(ChapterIDs.CHAPTER_04, page1.t4); break;
				case page2.t5: vo = new ChapterVO(ChapterIDs.CHAPTER_05, page2.t5); break;
				case page1.t6: vo = new ChapterVO(ChapterIDs.CHAPTER_06, page1.t6); break;
				case page2.t7: vo = new ChapterVO(ChapterIDs.CHAPTER_07, page2.t7); break;
				case page1.t8: vo = new ChapterVO(ChapterIDs.CHAPTER_08, page1.t8); break;
				case page2.t9: vo = new ChapterVO(ChapterIDs.CHAPTER_09, page2.t9); break;
				case page1.t10:vo = new ChapterVO(ChapterIDs.CHAPTER_10, page1.t10);break;
				case page2.t11:vo = new ChapterVO(ChapterIDs.CHAPTER_11, page2.t11);break;
				case page1.t12:vo = new ChapterVO(ChapterIDs.CHAPTER_12, page1.t12);break;
				case page2.t13:vo = new ChapterVO(ChapterIDs.CHAPTER_13, page2.t13);break;
				case page2.t14:vo = new ChapterVO(ChapterIDs.CHAPTER_14, page2.t14);break;
				case page2.t15:vo = new ChapterVO(ChapterIDs.CHAPTER_15, page2.t15);break;
				case page1.t16:vo = new ChapterVO(ChapterIDs.CHAPTER_16, page1.t16);break;
				case page2.t17:vo = new ChapterVO(ChapterIDs.CHAPTER_17, page2.t17);break;
				case page1.t18:vo = new ChapterVO(ChapterIDs.CHAPTER_18, page1.t18);break;
				case page2.t19:vo = new ChapterVO(ChapterIDs.CHAPTER_19, page2.t19);break;
				case page1.t20:vo = new ChapterVO(ChapterIDs.CHAPTER_20, page1.t20);break;
			}
			
			if(vo && vo.id && vo.thumbnail)
			{
				disableButtons();
				fadeNextPrev(false);
				_selectedChapter = vo;
				logger.debug("we gonna zoom to "+_selectedChapter);
				zoom();
			}
			
		}
		
		public function zoom(delay:Number = 0) : void
		{
			if(zoomed)
			{
				//zoom back to show all thumbs
				TweenMax.to(currentPage, ZOOM_OUT_SPEED, {x:0, y:0, scaleX:THUMB_SCALE, scaleY:THUMB_SCALE, ease:Strong.easeOut, delay:delay, onComplete:cleanup});
				_selectedChapter = null;
			}
			else
			{
				//zoom in to chapter landing image
				if(_selectedChapter && _selectedChapter.thumbnail)
				{
					var pt:Point = PositionUtil.getPositionInLeftFrame(_selectedChapter.thumbnail);
					TweenMax.to(currentPage, ZOOM_IN_SPEED, {x:pt.x, y:pt.y, scaleX:1, scaleY:1, ease:Strong.easeOut, onComplete:dispatchChapter});	
				}
				else
				{
					logger.warn("no selected chapter? cannot zoom into " + _selectedChapter);
					enableButtons();
				}
			}
			zoomed = !zoomed;
		}
		
		protected function dispatchChapter():void
		{
			logger.debug("finished zooming, here is selected chapter" + _selectedChapter);
			if(_selectedChapter)
			{
				dispatchEvent(new ChapterEvent(ChapterEvent.SELECTED, _selectedChapter));
			}
		}
		
		protected function cleanup():void
		{
			enableButtons();
			fadeNextPrev(true);
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HomepageSingleClickVC );
	}
}
