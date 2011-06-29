package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.logging.GetLogger;

	import mx.logging.ILogger;
	/**
	 * @author jc
	 */
	public class ImageAndTextSlide extends AbstractSlide
	{
		
		protected var img:ImageWithBorderAndCaption;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function ImageAndTextSlide()
		{
			//IMPORTANT!!!!!
			//be sure to instantiate & addChild() 'image' and 'text' in child class before calling super().
			img.visible = text.visible = false;
			positionInLeftFrame(img);
			positionInRightFrame(text);
			img.showCaption(false);
		}
		
		override public function transitionIn():void
		{
			img.alpha = 0;
			text.alpha = 0;
			super.staggerItemsIn(img,text);
		}
		
		override public function dispose():void
		{
			
			if(img)
				img.dispose();
				
			if(text)
				text.dispose();
				
			img = null;
			text = null;
			super.dispose();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( ImageAndTextSlide );
	}
}
