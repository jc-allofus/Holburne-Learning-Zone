package com.allofus.holburne.learningzone.view.chapter.chapter05
{
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter5.Chap5IntroImage;
	import com.holburne.learningzone.swc.chapter5.Slide_5_3_1;

	import flash.display.Bitmap;
	/**
	 * @author jc
	 */
	public class Slide_5_3_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_5_3_1; //make reference to mc from compiled swc

		public function Slide_5_3_1VC()
		{

			containerMC = new Slide_5_3_1();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'>The Temptation of St Anthony</p>"
			+	"<p class='imageCaption'>Jan van der Venne (active 1616, died before 1651)</p>"
			+	"<p class='imageCaption'>Oil on panel</p>"
			+	"<p class='imageCaption'>53.1 x 73.7 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A35</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap5IntroImage(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			
			pins = new Vector.<HotspotPin>();
			var str1:String = "<p>St Anthony (251–356), a Christian hermit who lived in the Egyptian desert</p>";
			var str2:String = "<p>Temptation: this imaginary figure with a bag of money is tempting St Anthony away from the desert with thoughts of wealth.</p>";
			var str3:String = "<p>Temptation: these demons are trying to drive the Saint out of the desert through Fear.</p>";
			var str4:String = "<p>Temptation: this imaginary blonde in her soft satin robe is trying to lure St Anthony away with lustful thoughts and a yearning for comfort.</p>";
			var str5:String = "<p>Temptation: this monster is trying to weaken St Anthony by mocking him.  It kneels down with its bony hands joined together as if in prayer.</p>";
			var str6:String = "<p>Rock: St Anthony’s faith is as firm and unshakeable as this desert outcrop.</p>";
			var str7:String = "<p>Skull: the hermit keeps this before his eyes as a reminder of his own death.  It symbolises his detachment from material things like food and comfort.</p>";
			var str8:String = "<p>St Anthony’s pet pig.  Before Father Anthony was a hermit, he worked as a swineherd.  This pig followed him into the desert and never left him.  His taming of the pig may symbolise his victory over the sin of gluttony.</p>";
			var str9:String = "<p>Book:  St Anthony contemplates God in scripture.</p>";
			
			pinVOs = new <HotspotPinVO>[
				new HotspotPinVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotPinVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotPinVO(containerMC.t3, new PopupPanelVO(str3)),
				new HotspotPinVO(containerMC.t4, new PopupPanelVO(str4)),
				new HotspotPinVO(containerMC.t5, new PopupPanelVO(str5)),
				new HotspotPinVO(containerMC.t6, new PopupPanelVO(str6)),
				new HotspotPinVO(containerMC.t7, new PopupPanelVO(str7)),
				new HotspotPinVO(containerMC.t8, new PopupPanelVO(str8)),
				new HotspotPinVO(containerMC.t9, new PopupPanelVO(str9)),
			];
			
			var title:String ="What are those strange things?";
			var description:String = "<p class='justified'></p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			text.alpha = 0;
			addChild(text);
			
			super();
			
			img.showCaption(false);
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn([img,text]); 
		}
			
	}
}
