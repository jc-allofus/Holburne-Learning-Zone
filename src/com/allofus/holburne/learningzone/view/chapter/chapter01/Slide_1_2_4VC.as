package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.logging.GetLogger;
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
				new HotspotPinVO(containerMC.t1, new PopupPanelVO("<p>The house was built by John Wood.   It stood opposite Bath Abbey.</p>")),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO("<p>The owner of the house was the Duke of Kingston, one of Bath’s main landowners.  His coat of arms was carved on the pediment.</p>")),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO("<p>The house backed on to the Pump Room and King’s Bath.  This covered passage led to the Baths.  The inside wall of the passage provided Gainsborough with a long windowless wall in his parlour, ideal for exhibiting large paintings.</p>")),
				new HotspotPinVO(containerMC.t4, new PopupPanelVO("<p>1700 years before John Wood, the Romans built their magnificent Baths on this site.  In 1892 the house was demolished so that the baths could be open to the sky.</p>")),
				new HotspotPinVO(containerMC.t5, new PopupPanelVO("<p>The largest ground-floor room was the Parlour.  Gainsborough displayed his paintings here, where members of the public could come in and see them.  In 1766 the Byam Family was displayed here.</p>")),
				new HotspotPinVO(containerMC.t6, new PopupPanelVO("<p>This ground-floor room was used as a Milliner’s shop by Gainsborough’s sister Mary Gibbon from 1762 to 1776.  The entrance was round the corner in Abbey Churchyard, roughly where the entrance to the Roman Baths is today.</p>")),
				new HotspotPinVO(containerMC.t7, new PopupPanelVO("<p>Gainsborough worked in the main room on the first floor, which faced north.</p>"))
			];
			
			var title:String ="THOMAS GAINSBOROUGH'S HOUSE";
			var description:String = 
				"<p class='justified'>Gainsborough lived here between 1760 and 1766.  The house was built by john wood. it stood on Abbey Street opposite Bath Abbey.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Click on the hotspots to find out more about the house</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.alpha = 0;
			
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
