package com.allofus.holburne.learningzone.view.component
{
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.shared.util.PositionUtil;

	import flash.geom.Point;
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
			positionImageAndText();
			img.showCaption(false);
			
		}
		
		protected function positionImageAndText():void
		{
			var pt:Point = PositionUtil.getPositionInLeftFrame(img);
			img.x = pt.x;
			img.y = pt.y;
			
			var pt2:Point = PositionUtil.getPositionInRightFrame(text);
			text.x = pt2.x;
			text.y = pt2.y;
		}
		
		override public function transitionIn():void
		{
			img.alpha = 0;
			text.alpha = 0;
			super.staggerItemsIn([img,text]);
		}
		
		override public function dispose():void
		{
			img = null;
			text = null;
			super.dispose();
		}
	}
}
