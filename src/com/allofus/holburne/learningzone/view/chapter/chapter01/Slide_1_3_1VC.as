package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.swc.chapter1.Chap1IntroImage;
	import com.holburne.learningzone.swcassets.Slide_1_3_1;

	import mx.logging.ILogger;

	import flash.display.Bitmap;


	/**
	 * @author jc
	 */
	public class Slide_1_3_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_1_3_1;
		
		public function Slide_1_3_1VC()
		{
			containerMC = new Slide_1_3_1();
			
			var caption:String = 
				"<p class='imageCaptionItalic'>The Byam Family</p>"
			+	"<p class='imageCaption'>Thomas Gainsborough (1727-1788)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1762-66</p>"
			+	"<p class='imageCaption'>238.5 x 229.7 cm</p>"
			+	"<p class='imageCaption'>On long-term loan from the Andrew Brownswood Arts Foundation</p>"
			+	"<p class='imageCaption'>1.2001.1</p>";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap1IntroImage(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			var str1:String = "<p class='popupPanelTitle'>George Byam (1734-1779)</p>"
			+	"<p>Born in Antigua in the West Indies.  His family had been major landowners there for a century and in 1763 they owned 132 slaves.  He left Antigua in the late 1750s and married Louisa around 1760. They were regular visitors to Bath.  George died in Antigua in 1779.</p>";
			
			var str2:String = "<p class='popupPanelTitle'>Louisa Bathurst (d. 1779)</p>"
			+	"<p>Daughter of Peter Bathurst, MP, of Clarendon Park, Salisbury.  The Bathursts were an influential local family who also had interests in the West Indies.  George and Louisa made their home at Apps Court, near Walton-on-Thames in Surrey.  Louisa died in 1779, shortly after her husband.</p>";
			
			var str3:String = "<p class='popupPanelTitle'>Selina Byam (1760-1846)</p>"
			+	"<p> Selina was probably named after her mother’s celebrated relative Selina Shirley, Countess of Huntingdon, whose dissenting chapel still stands in Bath.  As the oldest of four sisters, she inherited her parents’ fortune.  In 1782 she married Rev. William Hony, a Cornish clergyman who was also a major landowner.  He died when Selina was in her thirties.  During their short marriage, she had thirteen children.  Her youngest son William, Archdeacon of Sarum, inherited this portrait.</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3))
			];
			
			var title:String ="The People";
			var description:String = "Touch the picture to find out who's who.";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.alpha = 0;
			
			super();
			
			img.showCaption(false);
		}
		
		override public function transitionIn():void
		{
			text.alpha = 0;
			staggerItemsIn(img,text);
		}
		
		
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_3_1VC );
	}
}
