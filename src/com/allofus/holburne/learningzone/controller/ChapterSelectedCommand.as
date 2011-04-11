package com.allofus.holburne.learningzone.controller
{
	import com.allofus.holburne.learningzone.events.ChapterEvent;
	import com.allofus.holburne.learningzone.model.ChapterIDs;
	import com.allofus.holburne.learningzone.view.chapter.AbstractChapterView;
	import com.allofus.holburne.learningzone.view.chapter.chapter01.Chapter01;
	import com.allofus.holburne.learningzone.view.chapter.chapter02.Chapter02;
	import com.allofus.holburne.learningzone.view.chapter.chapter03.Chapter03;
	import com.allofus.holburne.learningzone.view.chapter.chapter04.Chapter04;
	import com.allofus.holburne.learningzone.view.chapter.chapter05.Chapter05;
	import com.allofus.holburne.learningzone.view.chapter.chapter06.Chapter06;
	import com.allofus.holburne.learningzone.view.chapter.chapter07.Chapter07;
	import com.allofus.holburne.learningzone.view.chapter.chapter08.Chapter08;
	import com.allofus.holburne.learningzone.view.chapter.chapter09.Chapter09;
	import com.allofus.holburne.learningzone.view.chapter.chapter10.Chapter10;
	import com.allofus.holburne.learningzone.view.chapter.chapter11.Chapter11;
	import com.allofus.holburne.learningzone.view.chapter.chapter12.Chapter12;
	import com.allofus.holburne.learningzone.view.chapter.chapter13.Chapter13;
	import com.allofus.holburne.learningzone.view.chapter.chapter14.Chapter14;
	import com.allofus.holburne.learningzone.view.chapter.chapter15.Chapter15;
	import com.allofus.holburne.learningzone.view.chapter.chapter16.Chapter16;
	import com.allofus.holburne.learningzone.view.chapter.chapter17.Chapter17;
	import com.allofus.holburne.learningzone.view.chapter.chapter18.Chapter18;
	import com.allofus.holburne.learningzone.view.chapter.chapter19.Chapter19;
	import com.allofus.holburne.learningzone.view.chapter.chapter20.Chapter20;
	import com.allofus.holburne.learningzone.view.menu.ChapterMenu;
	import com.allofus.shared.logging.GetLogger;

	import org.robotlegs.mvcs.Command;

	import mx.logging.ILogger;




	/**
	 * this is honkey.
	 * @author jc
	 */
	public class ChapterSelectedCommand extends Command
	{
		[Inject] public var event:ChapterEvent;
		
		override public function execute():void
		{
			logger.info("create " + event.vo.id);
			var mainView:HolburneLearningZone = contextView as HolburneLearningZone;
			var chapter:AbstractChapterView;
			switch(event.vo.id)
			{
				case ChapterIDs.CHAPTER_01:
					chapter = new Chapter01(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_02:
					chapter = new Chapter02(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_03:
					chapter = new Chapter03(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_04:
					chapter = new Chapter04(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_05:
					chapter = new Chapter05(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_06:
					chapter = new Chapter06(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_07:
					chapter = new Chapter07(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_08:
					chapter = new Chapter08(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_09:
					chapter = new Chapter09(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_10:
					chapter = new Chapter10(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_11:
					chapter = new Chapter11(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_12:
					chapter = new Chapter12(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_13:
					chapter = new Chapter13(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_14:
					chapter = new Chapter14(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_15:
					chapter = new Chapter15(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_16:
					chapter = new Chapter16(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_17:
					chapter = new Chapter17(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_18:
					chapter = new Chapter18(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_19:
					chapter = new Chapter19(event.vo);
					break;
					
				case ChapterIDs.CHAPTER_20:
					chapter = new Chapter20(event.vo);
					break;
			}
			
			if(chapter)
			{
				logger.info("i have a chapter: " + chapter);
				mainView.chapterMenuLayer.addChild(new ChapterMenu());
				mainView.chapterLayer.addChild(chapter as AbstractChapterView);
				chapter.showFirstSlide();
			}
			else
			{
				logger.warn("noting implemented for: " + event.vo.id);
			}
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ChapterSelectedCommand );
	}
}
