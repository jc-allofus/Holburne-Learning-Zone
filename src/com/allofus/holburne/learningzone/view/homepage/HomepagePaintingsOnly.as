package com.allofus.holburne.learningzone.view.homepage
{
	import com.holburne.learningzone.swc.homepage.Page1OnlyPaintings;
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
	public class HomepagePaintingsOnly extends Sprite
	{
		
		protected var page1:Page1OnlyPaintings; 				
		protected var thumbButtons:Vector.<MovieClip>; 	
		protected var zoomed:Boolean = false;
		protected var currentPage:MovieClip;
		
		protected var _selectedChapter:ChapterVO; 
		
		public static const ZOOM_IN_SPEED:Number = 1.8;
		public static const ZOOM_OUT_SPEED:Number = 0.6;
		public static const THUMB_SCALE:Number = 0.5;
		public static const SLIDE_DURATION:Number = 0.75;

		public function HomepagePaintingsOnly()
		{
			page1 = new Page1OnlyPaintings();
			page1.cacheAsBitmap = true;
			
			page1.scaleX = page1.scaleY = THUMB_SCALE;
			
			thumbButtons = new <MovieClip>[page1.t1, page1.t2, page1.t3, page1.t4, page1.t5, page1.t7, page1.t8, page1.t9, page1.t10]; 
			
			addChild(page1);
			enableButtons();
			
			currentPage = page1;
		}


		
		protected function enableButtons():void
		{
			
			for (var i : int = 0; i < thumbButtons.length; i++) 
			{
				thumbButtons[i].addEventListener(MouseEvent.CLICK, handleButtonMCClicked);
				thumbButtons[i].buttonMode = true;
			}
		}
		
		protected function disableButtons():void
		{
			
			for (var i : int = 0; i < thumbButtons.length; i++) 
			{
				thumbButtons[i].removeEventListener(MouseEvent.CLICK, handleButtonMCClicked);
				thumbButtons[i].buttonMode = false;
			}
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
				case page1.t3: vo = new ChapterVO(ChapterIDs.CHAPTER_03, page1.t3); break;
				case page1.t4: vo = new ChapterVO(ChapterIDs.CHAPTER_04, page1.t4); break;
				case page1.t5: vo = new ChapterVO(ChapterIDs.CHAPTER_05, page1.t5); break;
				case page1.t7: vo = new ChapterVO(ChapterIDs.CHAPTER_07, page1.t7); break;
				case page1.t8: vo = new ChapterVO(ChapterIDs.CHAPTER_08, page1.t8); break;
				case page1.t9: vo = new ChapterVO(ChapterIDs.CHAPTER_09, page1.t9); break;
				case page1.t10:vo = new ChapterVO(ChapterIDs.CHAPTER_10, page1.t10);break;
			}
			
			if(vo && vo.id && vo.thumbnail)
			{
				disableButtons();
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
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HomepageSingleClickVC );
	}
}
