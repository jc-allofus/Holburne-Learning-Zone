package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.swcassets.Slide_1_3_1;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class Slide_1_3_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_1_3_1;
		
		public function Slide_1_3_1VC()
		{
			containerMC = new Slide_1_3_1();
			addChild(containerMC);
			
			pins = new Vector.<HotspotPin>();
			
			var str1:String = "<p class='popupPanelTitle'>George Byam (1734-1779)</p>"
			+	"<p>Born in Antigua in the West Indies.  His family had been major landowners there for a century and in 1763 they owned 132 slaves.  He left Antigua in the late 1750s and married Louisa around 1760. They were regular visitors to Bath.  George died in Antigua in 1779.</p>";
			
			var str2:String = "<p class='popupPanelTitle'>Louisa Bathurst (d. 1779)</p>"
			+	"<p>Daughter of Peter Bathurst, MP, of Clarendon Park, Salisbury.  The Bathursts were an influential local family who also had interests in the West Indies.  George and Louisa made their home at Apps Court, near Walton-on-Thames in Surrey.  Louisa died in 1779, shortly after her husband.</p>";
			
			var str3:String = "<p class='popupPanelTitle'>Selina Byam (1760-1846)</p>"
			+	"<p> Selina was probably named after her mother’s celebrated relative Selina Shirley, Countess of Huntingdon, whose dissenting chapel still stands in Bath.  As the oldest of four sisters, she inherited her parents’ fortune.  In 1782 she married Rev. William Hony, a Cornish clergyman who was also a major landowner.  He died when Selina was in her thirties.  During their short marriage, she had thirteen children.  Her youngest son William, Archdeacon of Sarum, inherited this portrait.</p>";
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO(str3))
			];
			
			var title:String ="WHO’S WHO: THE BYAM FAMILY";
			var description:String = "";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			containerMC.alpha = 0;
			text.alpha = 0;
			staggerItemsIn(containerMC,text);
		}
		
		
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_3_1VC );
	}
}
