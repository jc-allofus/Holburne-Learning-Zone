package com.allofus.holburne.learningzone.view.chapter.chapter10
{
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter10.Img_10_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_4_1;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_4_2;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_4_3;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_4_4;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_4_5;
	import com.holburne.learningzone.swc.chapter10.Img_10_4_4_6;
	import com.holburne.learningzone.swc.chapter10.Slide_10_4_4;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_10_4_4VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_10_4_4; //make reference to mc from compiled swc

		public function Slide_10_4_4VC()
		{

			containerMC = new Slide_10_4_4();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'>Alicia and Jane Clarke</p>"
			+	"<p class='imageCaption'>Arthur Devis (1712-1787)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1758</p>"
			+	"<p class='imageCaption'>91.5 x 71 cm</p>"
			+	"<p class='imageCaption'>Accepted by HM Government in Lieu of Inheritance Tax and allocated to the Holburne Museum of Art, 2007</p>"
			+	"<p class='imageCaption'>2007.2</p>"
			;
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_10_1(0,0)), caption);
			img.alpha = 0;
			addChild(img);
			
			var str1:String = "<p class='popupPanelTitle'>Corner Cartouche with C-scrolls and  rosette</p><p></p>";
			var str2:String = "<p class='popupPanelTitle'>Sight moulding</p><p></p>";
			var str3:String = "<p class='popupPanelTitle'>Pierced rocaille</p><p></p>";
			var str4:String = "<p class='popupPanelTitle'>Leaf-shaped scroll</p><p></p>";
			var str5:String = "<p class='popupPanelTitle'>Centre cartouche</p><p></p>";
			var str6:String = "<p class='popupPanelTitle'>S-shaped sweep</p><p></p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1,Img_10_4_4_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2,Img_10_4_4_2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3,Img_10_4_4_3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4,Img_10_4_4_4)),
				new HotspotButtonVO(containerMC.t5, new PopupPanelVO(str5,Img_10_4_4_5)),
				new HotspotButtonVO(containerMC.t6, new PopupPanelVO(str6,Img_10_4_4_6))
			];
			
			var title:String ="About the frame";
			var description:String = "<p class='justified'>The frame is carved from wood.  Some of the detail, such as the fragile s-shaped sweeps or the little flowers in each corner, are carved separately and attached with pins and glue.  The surface of the frame is coated in gesso, a mixture of powdered chalk and glue that gives a smooth finish, before gilding with very thin gold leaf.</p>" +
									 "<p class='justified'>This frame is typical of an English mid-eighteenth-century frame in the Rococo style, with its wealth of curves and naturalistic detail.  The basic architectural shape of the frame has been brought to life with curling leaves, flowers and rocaille, a type of asymmetrical decoration originally inspired by natural rock formations.  The delicate frame inspired by nature is a perfect companion for Devis’s ladies in their garden.</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			text.alpha = 0;
			addChild(text);
			
			super();
			
			img.showCaption(false);
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(img,text); 
		}
			
	}
}
