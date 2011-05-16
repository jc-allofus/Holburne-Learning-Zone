package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.chapter1.Img_1_2_3;
	import com.holburne.learningzone.swcassets.Slide_1_2_3;

	import mx.logging.ILogger;

	import flash.display.Bitmap;



	/**
	 * @author jc
	 */
	public class Slide_1_2_3VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_1_2_3;

		public function Slide_1_2_3VC()
		{
			containerMC = new Slide_1_2_3();
		  	
		  	var caption:String =
		  		"<p class='imageCaptionItalic'>A New and Correct Plan of the City of Bath with the New Additional Buildings</p>" +
		  		"<p class='imageCaptionItalic'>William Hibbart</p>" +
		  		"<p class='imageCaptionItalic'>1772</p>" +
		  		"<p class='imageCaptionItalic'>Engraving, 37.5 x 49 cm</p>" +
		  		"<p class='imageCaptionItalic'>Bath Central Library, image courtesy of Bath in Time [ref 26519]</p>" +
		  		"";

			img = new ImageWithBorderAndCaption(new Bitmap(new Img_1_2_3(0,0)), caption);
			img.alpha = 0;
			addChild(img);
 
			
			
			var str1:String = "<p class='popupPanelTitle'>Upper Assembly Rooms</p>"
			+	"<p>The fashionable centre of the city gradually moved uphill and northwards.  In 1768 the New Rooms were founded in the Upper Town, just round the corner from Gainsborough’s house.</p>";
			
			var str2:String = "<p class='popupPanelTitle'>Pump Room & Baths</p>"
			+	"<p>The majority of visitors to Bath came for Spa treatments and to drink the spring water.  The city’s wealthy invalids would all have passed Gainsborough’s shop.</p>";
			
			var str3:String = "<p class='popupPanelTitle'>Bath Abbey</p>"
			+	"<p>In the mid-eighteenth century, the Abbey was still the main place of worship for Bath’s wealthy visitors.  It was surrounded by the most fashionable shops.</p>";
			
			var str4:String = "<p class='popupPanelTitle'>Abbey Street, 1760-1766</p>"
			+	"<p>Gainsborough rented this house in the heart of the city shortly after it was built.  It cost £150 a year to rent.  In 1762 his sister Mary Gibbon set up a milliner’s shop on the ground floor.</p>";
			
			var str5:String = "<p class='popupPanelTitle'>Lower Assembly Rooms</p>"
			+	"<p>Simpson’s Rooms and Wiltshire’s Rooms were established early in the eighteenth century as places to meet, dance and play cards.  They were the official centre of Bath’s social scene.</p>";
			
			var str6:String = "<p class='popupPanelTitle'>17, The Circus, 1766-1774</p>"
			+	"<p>The family later moved to the new ‘Upper Town’, where Gainsborough lived and worked in a newly-built house in the grand King’s Circus.</p>";
			
			var str7:String = "<p class='popupPanelTitle'>Lansdown, 1763-1766</p>"
			+	"<p>In 1763 Gainsborough and his family moved to a detached house high above the city on Lansdown Road.  He continued to work at Abbey Street ‘in the smoake’, but let the rest of the house as lodgings.</p>";
			
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4)),
				new HotspotButtonVO(containerMC.t5, new PopupPanelVO(str5)),
				new HotspotButtonVO(containerMC.t6, new PopupPanelVO(str6)),
				new HotspotButtonVO(containerMC.t7, new PopupPanelVO(str7))
			];
			
			var title:String ="WHERE HE LIVED";
			var description:String = 
				"<p class='justified'>Click on the pins on the image to view more details.</p>"
			+	"<p></p>";
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
		
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_2_3VC );
		
	}
}
