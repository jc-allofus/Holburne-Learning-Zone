package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.holburne.learningzone.chapter3.Img_3_2_3_1;
	import com.holburne.learningzone.chapter3.Img_3_2_3_2;
	import com.holburne.learningzone.chapter3.Img_3_2_3_3;
	import com.holburne.learningzone.chapter3.Img_3_2_3_4;
	import com.holburne.learningzone.swcassets.chapter3.Slide_3_2_3;

	import mx.logging.ILogger;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class Slide_3_2_3VC extends AbstractSlide
	{
		protected var bg:TextBoxWithTitleAndDescription;
		protected var container:Slide_3_2_3;
		protected var thumbs:Vector.<MovieClip>;
		protected var correctThumb:MovieClip;
		protected var selectedThumb:MovieClip;
		protected var pressed:Bitmap;
		
		protected var resultsTween:TimelineMax;
		
		protected var answerDesc:TextField;
		protected var correctAnswerText:String = "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus id nisi id nulla ullamcorper consequat. Quisque non diam et odio tristique varius. Duis consequat aliquet condimentum. Quisque et augue nulla.</p>";
		
		public function Slide_3_2_3VC()
		{
			container = new Slide_3_2_3();
			
			thumbs = new <MovieClip>[container.t1,container.t2,container.t3,container.t4];
			correctThumb = container.t2;
			
			container.t1.alpha = container.t2.alpha = container.t3.alpha = container.t4.alpha = 0;
			
			answerDesc = FontManager.createTextField(correctAnswerText,correctThumb.width, correctThumb.height, true);
			answerDesc.alpha = 0;
			answerDesc.visible = false;
			PositionUtil.positionToTheRight(answerDesc, correctThumb);
			answerDesc.y = correctThumb.y+30;
			addChild(answerDesc);
			
			bg = new TextBoxWithTitleAndDescription("WHAT DID HE LOOK LIKE WHEN HE WAS OLDER?", "<p class='centered'>Choose from the images of old faces below: one of them is Barker's</p>", 1785,760);
			bg.centerBodyCopy();
			PositionUtil.centerHorizontallyByVal(bg, AppGlobals.APP_WIDTH);
			bg.y = AppGlobals.RIGHT_FRAME_Y;
			bg.alpha = 0;
			addChild(bg);
			addChild(container);


			super();
			initThumbs();
			
			addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(bg,container.t1,container.t2,container.t3,container.t4);
		}

		private function handleAddedToStage(event : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
			stage.addEventListener(MouseEvent.MOUSE_UP, removePressed);
		}

		private function removePressed(event : MouseEvent = null) : void
		{
			if(pressed)
			{
				pressed.bitmapData.dispose();
				if(contains(pressed))
					removeChild(pressed);
			}
			pressed = null;
		}
		
		protected function initThumbs():void
		{
			for (var i : int = 0; i < thumbs.length; i++) 
			{
				thumbs[i].buttonMode = true;
				thumbs[i].addEventListener(MouseEvent.CLICK, handleThumbClicked);
				thumbs[i].addEventListener(MouseEvent.MOUSE_DOWN, handleThumbPressed);
			}
		}
		
		protected function disableThumbs():void
		{
			for (var i : int = 0; i < thumbs.length; i++) 
			{
				thumbs[i].buttonMode = false;
				thumbs[i].removeEventListener(MouseEvent.CLICK, handleThumbClicked);
				thumbs[i].removeEventListener(MouseEvent.MOUSE_DOWN, handleThumbPressed);
			}
		}
		
		protected function handleThumbPressed(event:MouseEvent):void
		{
			var bmd:BitmapData;
			var p:MovieClip = event.currentTarget as MovieClip;
			switch (p)
			{
				case container.t1:
					bmd = new Img_3_2_3_1(0,0);
					break;
					
				case container.t2:
					bmd = new Img_3_2_3_2(0,0);
					break;
					
				case container.t3:
					bmd = new Img_3_2_3_3(0,0);
					break;
					
				case container.t4:
					bmd = new Img_3_2_3_4(0,0);
					break;
			}
			pressed = new Bitmap(bmd);
			pressed.x = p.x;
			pressed.y = p.y;
			addChild(pressed);
		}
		
		protected function handleThumbClicked(event:MouseEvent = null):void
		{
			disableThumbs();
			selectedThumb = event.currentTarget as MovieClip;
			showResults();
		}
		
		protected function showResults():void
		{
			if(resultsTween)
				resultsTween.kill();
				
			bg.titleField.alpha = 0;
			bg.title = (selectedThumb === correctThumb) ? "RIGHT ANSWER, WELL DONE" : "SORRY, WRONG ANSWER";
			PositionUtil.centerHorizontally(bg.titleField, this);
				
			resultsTween = new TimelineMax();
			resultsTween.append(new TweenMax(bg.titleField, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE}));
			resultsTween.insert(new TweenMax(bg.bodyField, AppGlobals.FADE_DURATION, {autoAlpha:0, ease:AppGlobals.FADE_EASE}));
			for (var i : int = 0; i < thumbs.length; i++) 
			{
				if(thumbs[i] !== correctThumb)
				{
					resultsTween.insert(new TweenMax(thumbs[i], AppGlobals.FADE_DURATION, {autoAlpha:0, ease:AppGlobals.FADE_EASE}));
				}
			}
			resultsTween.append(new TweenMax(answerDesc, AppGlobals.FADE_DURATION, {autoAlpha:1,ease:AppGlobals.FADE_EASE}));
			
		}
		
		override public function dispose():void
		{
			disableThumbs();
			removePressed();
			removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
			if(stage)
				stage.removeEventListener(MouseEvent.MOUSE_UP, removePressed);
			
			if(resultsTween)
				resultsTween.kill();
			
			if(thumbs)
				thumbs.length = 0;
			
			resultsTween = null;	
			thumbs = null;
			container = null;
			bg = null;
			correctThumb = null;
			selectedThumb = null;
			answerDesc = null;
			
			super.dispose();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_3_2_3VC );
	}
}
