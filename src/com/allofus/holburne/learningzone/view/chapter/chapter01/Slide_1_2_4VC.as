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
	import com.holburne.learningzone.swcassets.Slide_1_2_4;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class Slide_1_2_4VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_1_2_4;
		
		public function Slide_1_2_4VC()
		{
			containerMC = new Slide_1_2_4();
			addChild(containerMC);
			
			pins = new Vector.<HotspotPin>();
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.hst1, new PopupPanelVO("<p>Test copy for pin 1. here between 1760 and 1766.  The house was built by john wood. it stood on Abbey Street opposite Bath Abbey</p>",Img1_4_1_6)),
				new HotspotPinVO(containerMC.hst2, new PopupPanelVO("<p>Test copy for pin 2. Street opposite Bath Abbey</p>",Img1_4_1_6)),
				new HotspotPinVO(containerMC.hst3, new PopupPanelVO("<p>Test copy for pin 3. as built by john wood. it stood on Abbey Street opposite Bath Abbey</p>",Img1_4_1_6)),
				new HotspotPinVO(containerMC.hst4, new PopupPanelVO("<p>Test copy for pin 4. Bath Abbey</p>")),
				new HotspotPinVO(containerMC.hst5, new PopupPanelVO("<p>Test copy for pin 5. here between 1760 and 1766.  The house was built by it stood on Abbey Street opposite Bath Abbey</p>"))
			];
			
			var title:String ="THOMAS GAINSBOROUGH'S HOUSE";
			var description:String = 
				"<p class='justified'>Gainsborough lived here between 1760 and 1766.  The house was built by john wood. it stood on Abbey Street opposite Bath Abbey.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Click on the hotspots to find out more about the house</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			
			super();
		}
		
		override public function transitionIn():void
		{
			containerMC.alpha = text.alpha = 0;
			staggerItemsIn([containerMC,text]);
		}
		
		override public function dispose():void
		{
			if(containerMC)removeChild(containerMC);
			containerMC = null;
			
			super.dispose();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_2_4VC );
	}
}
