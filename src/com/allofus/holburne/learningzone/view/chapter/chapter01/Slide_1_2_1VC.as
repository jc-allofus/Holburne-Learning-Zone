package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.holburne.learningzone.swcassets.Slide_1_2_1MC;

	import mx.logging.ILogger;

	import flash.display.MovieClip;
	import flash.geom.Point;

	/**
	 * @author jc
	 */
	public class Slide_1_2_1VC extends AbstractSlide
	{
		
		protected var img:MovieClip;
		protected var containerMc:Slide_1_2_1MC;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function Slide_1_2_1VC()
		{
			containerMc = new Slide_1_2_1MC();
			img = containerMc.img;
			img.alpha = 0;
			addChild(containerMc);
			
			var title:String ="INTRODUCTION";
			var description:String = 
				"<p class='justified'>This life-size view of a wealthy English family enjoying the countryside is one of the most ambitions paintings made during Thomas Gainsborough's sixteen years in Bath.  From 1759 to 1774 he rented one of the most expensive houses in the town, right opposite the Abbey and next to the Pump Room.  In had a spacious studio where visitors to the Spa could come to be recorded in their fashionable finery.</p>"
			+	"<p></p>"
			+	"<p class='justified'>George Byam, a plantation owner from Antigua, paid 100 guineas (over eight month's rent for the artist) for this portrait of himself and his new wife.  Gainsborough added their daughter Selina to the composition a few years later.  At the same time, Byam treated his wife to a re-painting of her dress from its original pink to a more up-to-date shade of blue.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			
			var pt2:Point = PositionUtil.getPositionInRightFrame(text);
			text.x = pt2.x;
			text.y = pt2.y;
			text.visible = false;
			text.alpha = 0;
			super();
		}
		
		override public function transitionIn():void
		{
			super.staggerItemsIn([img,text]);
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_2_1VC );
		
	}
}
