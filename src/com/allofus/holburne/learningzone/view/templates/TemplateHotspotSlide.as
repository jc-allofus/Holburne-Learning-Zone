package com.allofus.holburne.learningzone.view.templates
{
	import com.allofus.holburne.learningzone.model.vo.HotspotPinVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.HotspotPin;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	/**
	 * COPY AND PASTE THIS BADBOY TO SETUP A NEW HOTSPOT SLIDE
	 * 
	 * 
	 * 
	 * @author jc
	 */
	public class TemplateHotspotSlide extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:MovieClip; //make reference to mc from compiled swc
		
		public function TemplateHotspotSlide()
		{

			//containerMC = new Slide_2_3_2();
			
			
			var caption:String = 
				"<p class='imageCaptionItalic'></p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>"
			+	"<p class='imageCaption'></p>";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new BitmapData(0,0)), caption);//put non-empty bitmap data
			img.alpha = 0;
			addChild(img);
			
			
			pins = new Vector.<HotspotPin>();
			var str1:String = "<p class='popupPanelTitle'></p><p></p>";
			var str2:String = "<p class='popupPanelTitle'></p><p></p>";
			var str3:String = "<p class='popupPanelTitle'></p><p></p>";
			var str4:String = "<p class='popupPanelTitle'></p><p></p>";
			var str5:String = "<p class='popupPanelTitle'></p><p></p>";
			var str6:String = "<p class='popupPanelTitle'></p><p></p>";
			var str7:String = "<p class='popupPanelTitle'></p><p></p>";
			var str8:String = "<p class='popupPanelTitle'></p><p></p>";
			var str9:String = "<p class='popupPanelTitle'></p><p></p>";
			
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
			
			var title:String ="Title text here...";
			var description:String = "<p class='justified'>lorem ipsum...</p>";
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
