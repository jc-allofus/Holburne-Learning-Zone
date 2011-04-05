package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.swcassets.Img1_4_1_6;
	import com.holburne.learningzone.swcassets.Slide_1_4_1;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class Slide_1_4_3VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_1_4_1;

		public function Slide_1_4_3VC()
		{
			containerMC = new Slide_1_4_1();
			addChild(containerMC);
			
			pins = new Vector.<HotspotPin>();
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.hst1, new PopupPanelVO("<p>Man. </p>",Img1_4_1_6)),
				new HotspotPinVO(containerMC.hst2, new PopupPanelVO("<p>Lady. </p>",Img1_4_1_6)),
				new HotspotPinVO(containerMC.hst3, new PopupPanelVO("<p>Baby. </p>",Img1_4_1_6))
			];
			
			var title:String ="THOMAS GAINSBOROUGH'S FAMILY PHOTO";
			var description:String = 
				"<p class='justified'>This is a family photo.</p>"
			+	"<p></p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			
			super();
		}
		
		override public function transitionIn():void
		{
			text.alpha = 0;
			staggerItemsIn([text]);
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_3_1VC );
	}
}
