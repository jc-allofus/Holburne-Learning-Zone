package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.TimelinePopup;
	import com.allofus.holburne.learningzone.view.component.button.hotspot.HotspotPin;
	import com.allofus.shared.logging.GetLogger;
	import com.allofus.shared.util.PositionUtil;
	import com.holburne.learningzone.chapter3.Img_3_2_2_1;
	import com.holburne.learningzone.chapter3.Img_3_2_2_2;
	import com.holburne.learningzone.chapter3.Img_3_2_2_3;
	import com.holburne.learningzone.chapter3.Img_3_2_2_4;
	import com.holburne.learningzone.chapter3.Img_3_2_2_5;
	import com.holburne.learningzone.chapter3.Img_3_2_2_6;
	import com.holburne.learningzone.chapter3.Img_3_2_2_7;
	import com.holburne.learningzone.swcassets.chapter3.Slide_3_2_2;

	import mx.logging.ILogger;

	import flash.events.Event;
	import flash.events.MouseEvent;



	/**
	 * @author jc
	 */
	public class Slide_3_2_2VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_3_2_2;
		protected var bg:TextBoxWithTitleAndDescription;
		public function Slide_3_2_2VC()
		{
			
			containerMC = new Slide_3_2_2();
			
			var str1:String = "<p class='popupPanelTitle'>Benjamin Barker I (1725?-1793)</p><p></p><p class='justified'>Although a practising barrister and the son of a landed gentleman, Benjamin Barker lost his fortune through gambling on horses and by 1760 was forced to earn a living as a painter.  He was moderately successful as a painter of horses, but eventually moved to Wales where he worked as a decorator of Pontypool Japanned wares such as trays and tea caddies.  In 1781 Barker moved with his family to Bristol.  In 1783 they came to Bath, where he worked in a livery stable, although he continued to paint portraits of horses and to work as a carriage-painter.  This was the lot of most provincial painters: to move between portraiture, landscape and decorating mundane objects as demand arose.  However, Bath, with its now well-established fine art market, offered better opportunities for Barker’s sons.  Towards the end of his life, Barker’s eldest son Thomas was successful enough in his own right to help support his father.  There are more examples of Barker Senior’s work in Pontypool Museum.</p>";
			var str2:String = "<p class='popupPanelTitle'>Thomas Barker (1769-1847)</p><p></p><p class='justified'>Link to main biography in Artist section.</p>";
			var str3:String = "<p class='popupPanelTitle'>Priscilla Jones (1779-1843)</p><p></p><p class='justified'>Priscilla was an orphan who married the promising artist Thomas Barker in 1803.  The couple may have met late in 1797, after Barker's mentor Charles Spackman sold All Saint's Chapel on Lansdown to a consortium that included Priscilla's aunt and guardian, Miss Ann Jones (1743-1818).  At the end of 1797, Barker returned to Bath from London.  By 1800, when Spackman left Bath, Barker was looking for his own home where he could live, work, and display his paintings.  By 1801 Barker was courting Priscilla, and Ann Jones (a close friend of his family) agreed to allow Barker to build his house, gallery and studio on her land on Sion Hill on his marriage to Priscilla.  They were engaged in 1802, and married in St Swithin’s, Walcot, in 1803.</p>";
			var str4:String = "<p class='popupPanelTitle'>Benjamin Barker II (1776-1838)</p><p></p><p class='justified'>Benjamin Barker’s second son was also called Benjamin, but he enjoyed greater success as an artist.  Unlike his older brother Thomas, he did not have the advantage of having studied in Italy or worked in London, but spent all his working life in Bath where he prospered as a successful drawing-master.  In 1814 he and his wife Jane built Smallcombe Villa on Bathwick Hill (now called ‘Oakwood’), where his visitors included Queen Charlotte and her children the Duke of Clarence and Princess Elizabeth.</p><p></p><p class='justified'>He was mainly a landscape painter, using material from several sketching tours he made around Britain.  As with his brother Thomas, his ability was mixed, and his success declined in later life as Bath declined as a spa resort.  He eventually retired to Devon.</p>";
			var str5:String = "<p class='popupPanelTitle'>Joseph Barker (1782-1809)</p><p></p><p class='justified'>Joseph Barker painted rustic landscapes in a similar style to his brothers Thomas and Benjamin, but using a brighter palette.  After a promising start, he died aged twenty-seven. </p>";
			var str6:String = "<p class='popupPanelTitle'>Thomas  Jones Barker (1813-1882)</p><p></p><p class='justified'>The oldest child of Thomas and Priscilla Jones was also the most successful.  Although he first learned his trade with his father in Bath, he moved to Paris to train under the landscape painter Horace Vernet in 1834.  Here he became principally a history painter, winning the Légion d’honneur for his 1839 Bride of Death, now in the Victoria Art Gallery, Bath. </p><p></p><p class='justified'>He returned to England in 1845 where he specialised in large-scale military paintings and glamorous equestrian portraits.  One of the most famous is The Relief of Lucknow of 1859, now in the National Portrait Gallery.  He was regarded by his contemporaries as a commercial artist, and although he did not gain critical success, he prospered through his association with print dealers.</p>";
			var str7:String = "<p class='popupPanelTitle'>John Joseph Barker (1824-1904)</p><p></p><p class='justified'>The second son of Thomas Barker and Priscilla Jones spent all his working life in Bath, where he turned out sentimental genre and landscape paintings on a ‘cheap and cheerful’ principle.  The art market in Bath was a busy one, and he had a good working relationship with a dealer based in George Street and an able assistant in his father’s pupil Joseph Horlor.</p>";
			
			var cap1:String = 
				"<p class='imageCaptionItalic'>Landscape with a Brook</p>"
			+	"<p class='imageCaption'>Benjamin Barker I (?1725-1793)</p>"
			+	"<p class='imageCaption'>Oil on panel,  26 x 19.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A126</p>"
			;
			
			var cap2:String = 
				"<p><span class='imageCaptionItalic'>Travelling Gypsies</span><span class='imageCaption'>, about 1787</span></p>"
			+	"<p class='imageCaption'>Thomas Barker (1769-1847)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 125 x 102.3 cm</p>"
			+	"<p class='imageCaption'>Gift of Alfred Jones</p>"
			+	"<p class='imageCaption'>A311a</p>"
			;
			
			var cap3:String = 
				"<p><span class='imageCaptionItalic'>Cottages near Chippenham</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Lithograph by Thales Fielding (1793-1837) after Benjamin Barker II</p>"
			+	"<p class='imageCaption'>From <span class='imageCaptionItalic'>English Landscape Scenery</span> by Benjamin Barker, 1843 reprint, originally published 1824.</p>"
			+	"<p class='imageCaption'>27.5 x 23 cm</p>"
			+	"<p class='imageCaption'>© Bath in Time, Bath Central Library Collection</p>"
			;
			
			var cap4:String = 
				"<p><span class='imageCaptionItalic'>Chippenham Mills</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Benjamin Barker II (1776-1838)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1809</p>"
			+	"<p class='imageCaption'>107 x 84.5 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A120</p>"
			;
			
			var cap5:String = 
				"<p><span class='imageCaptionItalic'>A Welsh Landscape</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Attributed to Joseph Barker (1782-1809)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 101.7 x 144.8 cm</p>"
			+	"<p class='imageCaption'>Given by Captain F.H.Huth, 1916</p>"
			+	"<p class='imageCaption'>A164</p>"
			;
			
			var cap6:String = 
				"<p><span class='imageCaptionItalic'>Colin Campbell, Baron Clyde (study for The Relief of Lucknow)</span><span class='imageCaption'>, about 1857</span></p>"
			+	"<p class='imageCaption'>Thomas Jones Barker (1813-1882)</p>"
			+	"<p class='imageCaption'>Oil on board, 33.7 x 25.5 cm</p>"
			+	"<p class='imageCaption'>Purchased from Mr. Archer Turner, 1931</p>"
			+	"<p class='imageCaption'>A316</p>"
			;
			
			var cap7:String = 
				"<p><span class='imageCaptionItalic'>The Farmer's Lunch</span><span class='imageCaption'>, 1872</span></p>"
			+	"<p class='imageCaption'>John Joseph Barker (1824-1904)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 88.9 x 69.2 cm</p>"
			+	"<p class='imageCaption'>Gift of Alfred Jones</p>"
			+	"<p class='imageCaption'>A314</p>"
			;
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1,Img_3_2_2_1,cap1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2,Img_3_2_2_2,cap2)),
				new HotspotButtonVO(containerMC.t3, new PopupPanelVO(str3,Img_3_2_2_3,cap3)),
				new HotspotButtonVO(containerMC.t4, new PopupPanelVO(str4,Img_3_2_2_4,cap4)),
				new HotspotButtonVO(containerMC.t5, new PopupPanelVO(str5,Img_3_2_2_5,cap5)),
				new HotspotButtonVO(containerMC.t6, new PopupPanelVO(str6,Img_3_2_2_6,cap6)),
				new HotspotButtonVO(containerMC.t7, new PopupPanelVO(str7,Img_3_2_2_7,cap7))
			];
			
			bg = new TextBoxWithTitleAndDescription("THE BARKER FAMILY", "", 1785,760);
			PositionUtil.centerHorizontallyByVal(bg, AppGlobals.APP_WIDTH);
			bg.y = AppGlobals.RIGHT_FRAME_Y;
			addChild(bg);
			addChild(containerMC);
			
			super();
			staggerInComplete();
		}
		
		override protected function handlePinClicked(event:MouseEvent):void
		{
			var pin:HotspotPin = event.currentTarget as HotspotPin;
			if(pin.selected) return;
			deselectAllPins();
			removeAllPopups();
			pin.select();
			
			var panel:TimelinePopup = new TimelinePopup(pin.vo.panelVO);
			panel.addEventListener(Event.CLOSING, deselectAllPins);
			PositionUtil.centerHorizontallyByVal(panel, AppGlobals.APP_WIDTH);
			panel.y = 40;
			popupPanelLayer.addChild(panel);
			panel.transitionIn();
		}
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_3_2_2VC );
	}
}
