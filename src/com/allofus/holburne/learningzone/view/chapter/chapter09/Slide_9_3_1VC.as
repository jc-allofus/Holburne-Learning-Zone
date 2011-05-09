package com.allofus.holburne.learningzone.view.chapter.chapter09
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter9.Img_9_1;
	import com.holburne.learningzone.swc.chapter9.Slide_9_3_1;

	import flash.display.Bitmap;
	/**
	 * COPY AND PASTE THIS BADBOY TO SETUP A NEW HOTSPOT SLIDE
	 * 
	 * 
	 * 
	 * @author jc
	 */
	public class Slide_9_3_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_9_3_1; //make reference to mc from compiled swc

		public function Slide_9_3_1VC()
		{

			containerMC = new Slide_9_3_1();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'>David Garrick as Jaffier and Susannah Cibber as Belvidera in ‘Venice Preserv’d’</p>"
			+	"<p class='imageCaption'>Johann Zoffany (1733-1810)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1764</p>"
			+	"<p class='imageCaption'>101.5 x 127 cm</p>"
			+	"<p class='imageCaption'>Acquired as part of the Somerset Maugham Collection, 2011</p>"
			+	"<p class='imageCaption'>Acc no TBC</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_9_1(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			
			pins = new Vector.<HotspotPin>();
			var str1:String = "<p>Jaffier, a Venetian nobleman [David Garrick, actor, playwright and theatre manager]</p>";
			var str2:String = "<p>Belvidera, a Venetian Senator’s daughter, wife of Jaffier [Susannah Cibber, singer and actress]</p>";
			var str3:String = "<p>The mouth of the Grand Canal, Venice [Theatre Royal, Drury Lane, London] </p>";
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO(str3))
			];
			
			var title:String ="Whats going on?";
			var description:String = "<p class='justified'>A scene from the tragedy Venice Preserv’d by Thomas Otway (1652-1685), first staged in 1682, in its revival at Drury Lane of 1762.</p>" +
			"<p></p>" +
			"<p class='justified'>The plot revolves around a political conspiracy in the republic of Venice, and its tragic consequences: the conspirators are executed, the hero Jaffier commits suicide and his faithful wife Belvidera dies insane.</p>" +
			"<p></p>" +
			"<p class='justified'>In this scene, Jaffier is attempting to kill his wife for persuading him to betray his friend Pierre, the chief conspirator.  His honour is at stake.  She needs to stop the plot to kill senators, so that she can save her father’s life.  Husband and wife are both caught in a terrible dilemma, but Jaffier loses his nerve and throws aside his dagger, saying: “'Tis but one blow! Yet, by immortal love, I cannot longer bear a thought to harm thee.”</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			text.alpha = 0;
			addChild(text);
			
			super();
			text.y = AppGlobals.RIGHT_FRAME_Y;
			img.showCaption(false);
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(img,text); 
		}
			
	}
}
