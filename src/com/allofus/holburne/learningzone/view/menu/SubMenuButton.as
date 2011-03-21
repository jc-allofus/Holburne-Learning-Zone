package com.allofus.holburne.learningzone.view.menu
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.text.FontManager;
	import com.allofus.shared.util.PositionUtil;
	import com.greensock.TweenMax;

	import mx.logging.ILogger;

	import flash.display.Shape;
	import flash.text.TextField;

	/**
	 * @author jc
	 */
	public class SubMenuButton extends AbstractButton
	{
		
		public static const WIDTH:int = 269;
		public static const HEIGHT:int = 47;
		
		protected var background:Shape;
		protected var label:TextField;
		
		public function SubMenuButton(vo:MenuButtonVO)
		{
			super(vo);
			
			background = new Shape();
			background.graphics.beginFill(0,0);
			background.graphics.drawRect(0, 0, WIDTH, HEIGHT);
			addChild(background);
			
			label = FontManager.createTextField(vo.label);
			PositionUtil.centerHorizontally(label, this);
			PositionUtil.centerVertically(label, this);
			addChild(label);
		}
		
		override public function set selected(value:Boolean):void
		{
			super.selected = value;

			if(value)
			{
				TweenMax.to(label, 0.2, {tint:0xb00404});
			}
			else
			{
				TweenMax.to(label, 0.2, {removeTint:true});
			}
		}

		override public function dispose() : void
		{
			logger.info("dispose: " + this);
			
			super.dispose();
			background = null;
			label = null;
		}
		private static const logger:ILogger = GetLogger.qualifiedName( SubMenuButton );
	}
}
