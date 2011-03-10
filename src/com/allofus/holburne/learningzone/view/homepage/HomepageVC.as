package com.allofus.holburne.learningzone.view.homepage
{
	import com.allofus.shared.logging.GetLogger;
	import com.greensock.TweenMax;
	import com.greensock.easing.Strong;

	import mx.logging.ILogger;

	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author jc
	 */
	public class HomepageVC extends Sprite
	{
		
		protected var homepage:HomePage1;
		protected var buttons:Vector.<MovieClip>;
		protected var zoomed:Boolean = false;
		
		protected var zoomFrame:Shape;
		protected var zoomFrameWidth:int = 894;
		protected var zoomFrameHeight:int = 850;
		protected var zoomFrameX:int = 64;
		protected var zoomFrameY:int = 30;
		
		public function HomepageVC()
		{
			homepage = new HomePage1();
			homepage.cacheAsBitmap = true;
			homepage.scaleX = homepage.scaleY = 0.6;
			buttons = new <MovieClip>[homepage.t0, homepage.t1, homepage.t2, homepage.t3, homepage.t4, homepage.t5, homepage.t6, homepage.t7, homepage.t8, homepage.t9];
			addChild(homepage);
			enableButtons();
			
			//frame for where zoomed images should end up 
			zoomFrame = new Shape();
			zoomFrame.graphics.beginFill(0x00cc00, 0.2);
			zoomFrame.graphics.drawRect(zoomFrameX, zoomFrameY, zoomFrameWidth, zoomFrameHeight);
			addChild(zoomFrame);
		}
		
		protected function enableButtons():void
		{
			for (var i : int = 0; i < buttons.length; i++) 
			{
				buttons[i].addEventListener(MouseEvent.CLICK, handleClick);
				buttons[i].buttonMode = true;
			}
		}

		private function handleClick(event : MouseEvent) : void
		{
			logger.fatal("tx: " + event.currentTarget);
			var ct:MovieClip = event.currentTarget as MovieClip;
			if(zoomed)
			{
				TweenMax.to(homepage, 0.6, {x:0, y:0, scaleX:0.6, scaleY:0.6, ease:Strong.easeOut});
			}
			else
			{
				var tx:Number = -ct.x + ((zoomFrame.width * 0.5) - (ct.width * 0.5)) + zoomFrameX;
				var ty:Number = -ct.y + ((zoomFrame.height * 0.5) - (ct.height * 0.5)) + zoomFrameY;
				TweenMax.to(homepage, 0.6, {x:tx, y:ty, scaleX:1, scaleY:1, ease:Strong.easeOut});	
			}
			zoomed = !zoomed;
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( HomepageVC );
	}
}
