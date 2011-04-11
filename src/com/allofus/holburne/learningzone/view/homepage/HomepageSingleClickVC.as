package com.allofus.holburne.learningzone.view.homepage
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.events.ChapterEvent;
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
	public class HomepageSingleClickVC extends Sprite
	{
		
		protected var homepage:HomePage1; 				//HomePage1 symbol from flash file Chapters1-10.xfl
		protected var buttonMCs:Vector.<MovieClip>; 	//will be populated with references to the clips drawn on stage in flash IDE in the HomePage1 symbol
		protected var zoomed:Boolean = false;
		
		protected var _selectedChapter:ChapterVO; 
		
		public static const THUMB_SCALE:Number = 0.6;

		public function HomepageSingleClickVC()
		{
			homepage = new HomePage1();
			homepage.cacheAsBitmap = true;
			homepage.scaleX = homepage.scaleY = THUMB_SCALE;
			buttonMCs = new <MovieClip>[homepage.t0, homepage.t1, homepage.t2, homepage.t3, homepage.t4, homepage.t5, homepage.t6, homepage.t7, homepage.t8, homepage.t9];
			addChild(homepage);
			enableButtons();
			
		}
		
		protected function enableButtons():void
		{
			for (var i : int = 0; i < buttonMCs.length; i++) 
			{
				buttonMCs[i].addEventListener(MouseEvent.CLICK, handleButtonMCClicked);
				buttonMCs[i].buttonMode = true;
			}
		}
		
		protected function disableButtons():void
		{
			for (var i : int = 0; i < buttonMCs.length; i++) 
			{
				buttonMCs[i].removeEventListener(MouseEvent.CLICK, handleButtonMCClicked);
				buttonMCs[i].buttonMode = false;
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
				case homepage.t0:
					vo = new ChapterVO(ChapterIDs.CHAPTER_10, homepage.t0);
					break;
					
				case homepage.t1:
					vo = new ChapterVO(ChapterIDs.CHAPTER_02, homepage.t1);
					break;
					
				case homepage.t2:
					vo = new ChapterVO(ChapterIDs.CHAPTER_01, homepage.t2);
					break;
					
				case homepage.t3:
					vo = new ChapterVO(ChapterIDs.CHAPTER_03, homepage.t3);
					break;
					
				case homepage.t4:
					vo = new ChapterVO(ChapterIDs.CHAPTER_05, homepage.t4);
					break;
					
				case homepage.t5:
					vo = new ChapterVO(ChapterIDs.CHAPTER_06, homepage.t5);
					break;
					
				case homepage.t6:
					vo = new ChapterVO(ChapterIDs.CHAPTER_07, homepage.t6);
					break;
					
				case homepage.t7:
					vo = new ChapterVO(ChapterIDs.CHAPTER_08, homepage.t7);
					break;
					
				case homepage.t8:
					vo = new ChapterVO(ChapterIDs.CHAPTER_09, homepage.t8);
					break;
					
				case homepage.t9:
					vo = new ChapterVO(ChapterIDs.CHAPTER_10, homepage.t9);
					break;
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
		
		private static const logger:ILogger = GetLogger.qualifiedName( HomepageVC );
	}
}
