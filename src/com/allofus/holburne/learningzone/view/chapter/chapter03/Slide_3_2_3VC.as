package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import flash.text.TextFormatAlign;
	import flash.text.TextFormat;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.button.TryAgainButton;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.holburne.learningzone.chapter3.Img_3_2_3_1;
	import com.holburne.learningzone.chapter3.Img_3_2_3_2;
	import com.holburne.learningzone.chapter3.Img_3_2_3_3;
	import com.holburne.learningzone.chapter3.Img_3_2_3_4;
	import com.holburne.learningzone.chapter3.Img_3_2_3_5;
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
		
		protected var questionTitleText:String = "Portrait of the Artist as an Old Man";
		
		protected var resultsTween:TimelineMax;
		
		protected var answerDesc:TextField;
		protected var tryAgainButton:TryAgainButton;
		
		public function Slide_3_2_3VC()
		{
			container = new Slide_3_2_3();
			
			thumbs = new <MovieClip>[container.t1,container.t2,container.t3,container.t4,container.t5];
			
			correctThumb = container.t5;
			
			container.t1.alpha = container.t2.alpha = container.t3.alpha = container.t4.alpha = container.t5.alpha = 0;
			
			answerDesc = FontManager.createTextField("",correctThumb.width, correctThumb.height, true);
			answerDesc.alpha = 0;
			answerDesc.visible = false;
			addChild(answerDesc);
			
			bg = new TextBoxWithTitleAndDescription(questionTitleText, "<p class='centered'>As a young man, Thomas Barker was famous for his studies of old people. Eventually he grew old himself. Which of these do you think is a portrait of Thomas Barker at the end of his life?</p>", 1785,760);
			bg.centerBodyCopy();
			PositionUtil.centerHorizontallyByVal(bg, AppGlobals.APP_WIDTH);
			bg.y = AppGlobals.RIGHT_FRAME_Y;
			bg.alpha = 0;
			
			tryAgainButton = new TryAgainButton(null);
			tryAgainButton.addEventListener(MouseEvent.CLICK, onTryAgain);	
			tryAgainButton.alpha = 0;		
			
			addChild(bg);
			addChild(container);
			addChild(tryAgainButton);


			super();
			initThumbs();
			
			addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}

		protected function onTryAgain(event : MouseEvent) : void
		{
			bg.titleField.alpha = 0;
			bg.title = questionTitleText;
			if(resultsTween)
				resultsTween.kill();
			resultsTween = new TimelineMax({onComplete:initThumbs});
			resultsTween.append(new TweenMax(bg.titleField, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE}));
			resultsTween.insert(new TweenMax(bg.bodyField, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE}));
			for (var i : int = 0; i < thumbs.length; i++) 
			{
				resultsTween.insert(new TweenMax(thumbs[i], AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE}));
			}
			resultsTween.insert(new TweenMax(answerDesc, AppGlobals.FADE_DURATION, {autoAlpha:0,ease:AppGlobals.FADE_EASE}));
			resultsTween.insert(new TweenMax(tryAgainButton, AppGlobals.FADE_DURATION, {autoAlpha:0,ease:AppGlobals.FADE_EASE}));
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(bg,container.t1,container.t5,container.t3,container.t4,container.t2);
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
					
				case container.t5:
					bmd = new Img_3_2_3_5(0,0);
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
			var caption:String;
			switch(selectedThumb)
			{
				//WRONG
				case container.t1:
					caption = 	"<p><span class='imageCaptionItalic'>Travelling Gypsies</span><span class='imageCaption'>, about 1787 (detail)</span></p>" +
					"<p class='imageCaption'>Thomas Barker (1769-1847)</p>" +
					"<p class='imageCaption'>Oil on canvas, 125 x 102.3 cm</p>" +
					"<p class='imageCaption'>Gift of Alfred Jones</p>" +
					"<p class='imageCaption'>A311a</p>" 
					;
					answerDesc.htmlText = caption;
					positionResultsRight();
					break;
				
				//WRONG	
				case container.t2:
					caption = 	"<p><span class='imageCaptionItalicRight'>The Blind Beggar</span><span class='imageCaption'>, about 1788 (detail)</span></p>" +
					"<p class='imageCaptionRight'>Thomas Barker (1769-1847)</p>" +
					"<p class='imageCaptionRight'>Oil on canvas, 47.5 x 40.2 cm</p>" +
					"<p class='imageCaptionRight'>Gift of Sir John Clough, 1918</p>" +
					"<p class='imageCaptionRight'>A118</p>" 
					;
					answerDesc.htmlText = caption;
					positionResultsLeft();
					break;
				
				//WRONG	
				case container.t3:
					caption = 	"<p><span class='imageCaptionItalic'>Old Tom Thumb (Richard Brent)</span><span class='imageCaption'>, 1789 (detail)</span></p>" +
					"<p class='imageCaption'>Thomas Barker (1769-1847)</p>" +
					"<p class='imageCaption'>Oil on canvas, 61 x 43.2 cm</p>" +
					"<p class='imageCaption'>Victoria Art Gallery, Bath and North East Somerset Council	</p>"
					;
					answerDesc.htmlText = caption;
					positionResultsRight();
					break;
				
				//WRONG	
				case container.t4:
					caption = 	"<p><span class='imageCaptionItalicRight'>The Woodman and his Dog</span><span class='imageCaption'>, 1789 (detail)</span></p>" +
					"<p class='imageCaptionRight'>Thomas Barker (1769-1847)</p>" +
					"<p class='imageCaptionRight'>Oil on canvas</p>" +
					"<p class='imageCaptionRight'>Torfaen Museum Trust</p>" 
					;
					answerDesc.htmlText = caption;
					positionResultsLeft();
					break;
					
				case container.t5:
					caption = 	"<p><span class='imageCaptionItalic'>Thomas Barker Esquire, Painter of the Woodman</span><span class='imageCaption'>, 1848 (detail)</span></p>" +
					"<p class='imageCaption'>John Joseph Barker (1824-1904)</p>" +
					"<p class='imageCaption'>Lithograph, 26.6 x 20 cm</p>" +
					"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>" +
					"<p class='imageCaption'>A304a</p>" 
					;
					answerDesc.htmlText = caption;
					positionResultsRight();
					break;
					
					
			}
			showResults();
		}
		
		protected function positionResultsLeft():void
		{
			answerDesc.x = selectedThumb.x - answerDesc.width - 15;
			answerDesc.y = selectedThumb.y + 20;
			PositionUtil.alignRight(tryAgainButton, answerDesc, 15);
			tryAgainButton.y = selectedThumb.y + selectedThumb.height - tryAgainButton.height - 20;
			
		}
		
		protected function positionResultsRight():void
		{
			PositionUtil.positionToTheRight(answerDesc, selectedThumb, 15);
			answerDesc.y = selectedThumb.y + 20;
			tryAgainButton.x = answerDesc.x - 10;
			tryAgainButton.y = selectedThumb.y + selectedThumb.height - tryAgainButton.height - 20;
		}
		
		protected function showResults():void
		{
			var gotCorrectAnswer:Boolean = selectedThumb === correctThumb;
			if(resultsTween)
				resultsTween.kill();
				
			bg.titleField.alpha = 0;
			bg.title = gotCorrectAnswer ? "RIGHT ANSWER, WELL DONE" : "SORRY, WRONG ANSWER";
			PositionUtil.centerHorizontally(bg.titleField, this);
			
				
			if(resultsTween)
				resultsTween.kill();
			resultsTween = new TimelineMax();
			resultsTween.append(new TweenMax(bg.titleField, AppGlobals.FADE_DURATION, {autoAlpha:1, ease:AppGlobals.FADE_EASE}));
			resultsTween.insert(new TweenMax(bg.bodyField, AppGlobals.FADE_DURATION, {autoAlpha:0, ease:AppGlobals.FADE_EASE}));
			for (var i : int = 0; i < thumbs.length; i++) 
			{
				if(thumbs[i] !== selectedThumb)
				{
					resultsTween.insert(new TweenMax(thumbs[i], AppGlobals.FADE_DURATION, {autoAlpha:0, ease:AppGlobals.FADE_EASE}));
				}
			}
			resultsTween.append(new TweenMax(answerDesc, AppGlobals.FADE_DURATION, {autoAlpha:1,ease:AppGlobals.FADE_EASE}));
			
			if(!gotCorrectAnswer)
				resultsTween.append(new TweenMax(tryAgainButton, AppGlobals.FADE_DURATION, {autoAlpha:1,ease:AppGlobals.FADE_EASE}));
			
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
				
			if(tryAgainButton)
			{
				tryAgainButton.removeEventListener(MouseEvent.CLICK, onTryAgain);	
				tryAgainButton.dispose();
			}
			
			if(resultsTween)
				resultsTween.kill();
				
			tryAgainButton = null;
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
