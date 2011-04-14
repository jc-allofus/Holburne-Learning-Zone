package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.swcassets.Img1_4_1_1;
	import com.holburne.learningzone.swcassets.Img1_4_1_2;
	import com.holburne.learningzone.swcassets.Img1_4_1_3;
	import com.holburne.learningzone.swcassets.Img1_4_1_4;
	import com.holburne.learningzone.swcassets.Img1_4_1_5;
	import com.holburne.learningzone.swcassets.Img1_4_1_6;
	import com.holburne.learningzone.swcassets.Slide_1_4_1;

	import mx.logging.ILogger;

	/**
	 * @author jc
	 */
	public class Slide_1_4_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_1_4_1;

		public function Slide_1_4_1VC()
		{
			containerMC = new Slide_1_4_1();
			addChild(containerMC);
			
			pins = new Vector.<HotspotPin>();
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO("<p>The pale ghostly mist round the bottom of Mr Byam’s hat shows that the artist made some changes here.  X rays reveal that the hat started life extending further to the left, but he later tipped it upwards so as to point towards the sunset.</p>",Img1_4_1_1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO("<p>Are these grey pebbly shapes cloud or leaves?  Gainsborough must have changed his mind about the size of the tree, and altered some of the overhanging leaves to make them look like part of a stormy cloud.</p>",Img1_4_1_2)),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO("<p>Mrs Byam’s gown was once reddish-pink.  Look through the cracks in the blue paint, and you can see the old pink colour showing through.  When Louisa first came to Gainsborough’s studio, red and pink were fashionable, but by the mid 1760s all the latest gowns were blue.</p>",Img1_4_1_3)),
				new HotspotPinVO(containerMC.t4, new PopupPanelVO("<p>George Byam’s waistcoat was once blue.  You can see some of the blue showing through the gold decoration on his pocket.</p>",Img1_4_1_4)),
				new HotspotPinVO(containerMC.t5, new PopupPanelVO("<p>Little Selina’s face is unusually pink.  Conservators have discovered that it was painted straight on top of her mother’s original pink dress.  The X-ray photograph reveals the original position of Louisa’s sleeve, now trailing through Selina’s face.</p>",Img1_4_1_5)),
				new HotspotPinVO(containerMC.t6, new PopupPanelVO("<p>X-rays have shown that in the first version of her portrait, Mrs Byam was wearing a white cap on the back of her head, and her hair was dressed lower.  In the finished painting, her hairstyle has been updated and raised to keep up with the fashion of the later 1760s.</p>",Img1_4_1_6))
			];
			
			var title:String ="GAINSBOROUGH'S CHANGES";
			var description:String = 
				"<p class='justified'>Gainsborough began George and Louisa Byam’s portrait around 1762, shortly after their marriage.  Letters from the time tell us that it was in his studio four years later, and that the little girl Selina’s portrait was added to the picture around that time.  The painting itself is full of evidence that Gainsborough made several other changes.  Oil paint often turns more transparent over the years, revealing things that the artist had meant to hide.  This can tell us a lot about how a painting was made.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Tap on the pins on the photo to reveal more information.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			containerMC.alpha = 0;
			text.alpha = 0;
			staggerItemsIn([containerMC,text]);
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_3_1VC );
	}
}
