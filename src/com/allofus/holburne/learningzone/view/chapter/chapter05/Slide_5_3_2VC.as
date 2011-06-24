package com.allofus.holburne.learningzone.view.chapter.chapter05
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_1;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_10;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_11;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_12;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_13;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_2;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_3;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_4;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_5;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_6;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_7;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_8;
	import com.holburne.learningzone.swc.chapter5.Img_5_3_2_9;
	import com.holburne.learningzone.swc.chapter5.Slide_5_3_2;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_5_3_2VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_5_3_2;

		public function Slide_5_3_2VC()
		{
			containerMc = new Slide_5_3_2();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var st01:String = 
				"<p><span class='imageCaptionItalic'>The Death of St Andrew Avellino</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Circle of Giovanni Battista Piazzetta (1682-1754)</p>"
			+	"<p class='imageCaption'>Oil on canvas</p>"
			+	"<p class='imageCaption'>65.6 x 48.5 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A17</p>";
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_5_3_2_1, st01,"<p class='justified'>St Andrew Avellino (1521-1608) was a reforming priest of the Order of Theatines.  He served all over Italy, but is particularly venerated in Naples.  He suffered a fatal stroke while saying Mass, and is shown here collapsing on the altar steps.  A vision of heaven opens above him.</p>");

			var st02:String = 
				"<p><span class='imageCaptionItalic'>Ruins of a Temple with an Apostle Preaching</span><span class='imageCaption'>(St Paul and St Barnabas)</span></p>"
			+	"<p class='imageCaption'>Giovanni Paolo Panini (1691-1765)</p>"
			+	"<p class='imageCaption'>Oil on canvas, c.1719</p>"
			+	"<p class='imageCaption'>64.2 x 48 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A69</p>";
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_5_3_2_2, st02,"<p class='justified'>The bearded man gesturing in the centre of the picture is probably St Paul.  Although the painting is mainly intended as a decorative architectural view, it may recall the apostle Paul’s visit to a great city with St Barnabas or another of his younger companions.</p>");
			
			var st03:String = 
				"<p><span class='imageCaptionItalic'>The Entombment</span><span class='imageCaption'>(St Joseph of Arimathea, St John the Evangelist and St Mary Magdalene)</span></p>"
			+	"<p class='imageCaption'>Giovanni Francesco Romanelli (1610-1662)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1638 </p>"
			+	"<p class='imageCaption'>68.6 x 53.4 cm </p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A135</p>";
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_5_3_2_3, st03,"");	
			
			var st04:String = 
				"<p><span class='imageCaptionItalic'>Sir Thomas More</span><span class='imageCaption'>, after Holbein</span></p>"
			+	"<p class='imageCaption'>British School</p>"
			+	"<p class='imageCaption'>Oil on panel, 18th or 19th century</p>"
			+	"<p class='imageCaption'>19.3 x 16.6</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A181</p>";
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_5_3_2_4, st04,"<p class='justified'>Sir Thomas More was a lawyer and writer.  As a close adviser to Henry VIII, he became Lord Chancellor, the head of the English legal system.  He fell from favour when he refused to support the King’s divorce and his claim as head of the Church in England.  He was imprisoned in the Tower of London and executed in 1535.  He was canonised in 1935.  This is a poor copy of Holbein’s famous portrait now in the Frick Collection in New York.</p>");
			
			var st05:String = 
				"<p><span class='imageCaptionItalic'>St Mary Magdalene</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Attributed to Jan van Staveren (about 1625 - after 1668)</p>"
			+	"<p class='imageCaption'>Oil on panel</p>"
			+	"<p class='imageCaption'>47.3 x 39.4 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A242</p>";
			var vo05:ThumbnailVO = new ThumbnailVO(containerMc.t5, Img_5_3_2_6, st05,"<p class='justified'>Mary Magdalene was a follower of Jesus and one of the first to witness his Resurrection.  According to legend, she went to live in the desert as a hermit.  She is depicted here at a little altar with the jar of ointment which she took to Christ’s tomb to anoint his body, and a skull to remind her of death.  On the ground, a still life of vegetables represents her simple diet.</p>");
			
			var st06:String = 
				"<p><span class='imageCaptionItalic'>The Stoning of St Stephen</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Flemish School, 17th century</p>"
			+	"<p class='imageCaption'>Oil on canvas</p>"
			+	"<p class='imageCaption'>56.5 x 48 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A282</p>";
			var vo06:ThumbnailVO = new ThumbnailVO(containerMc.t6, Img_5_3_2_5, st06,"<p class='justified'>Saint Stephen was a deacon of the early church and the first Christian martyr.  He was stoned to death by an angry crowd in Jerusalem for preaching the Gospel.  As he died, he “looked up steadfastly into heaven, and saw the glory of God, and Jesus standing on the right hand of God.”</p>");
			
			var st07:String = 
				"<p><span class='imageCaptionItalic'>St Charles Borromeo & St Francis of Assisi</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Circle of Giovanni Battista Crespi (about 1575-1632)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1610</p>"
			+	"<p class='imageCaption'>95.5 x 120.8 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A153</p>";
			var vo07:ThumbnailVO = new ThumbnailVO(containerMc.t7, Img_5_3_2_7, st07,"<p class='justified'>Despite the difference in their dress, these two Italian saints have much in common.  Cardinal Charles Borromeo, Archbishop of Milan (1538-1584) was born into a princely family.  He was appointed to high office in through his family connections but was a very humble man who gave his life to serving the poor and reforming the church.  St Francis of Assisi (1181-1226), the son of a rich merchant, embraced poverty and the service of the poor.</p>");
			
			var st08:String = 
				"<p><span class='imageCaptionItalic'>St William of Maleval</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>After Salvator Rosa (1615-1673)</p>"
			+	"<p class='imageCaption'>Oil on canvas, 18th or 19th century</p>"
			+	"<p class='imageCaption'>67.2 x 57 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A149</p>";
			var vo08:ThumbnailVO = new ThumbnailVO(containerMc.t8, Img_5_3_2_8, st08,"<p class='justified'>St William of Maleval (d. 1157) was a French soldier who made a pilgrimage to Rome, where he was pardoned by the Pope.  He spent the rest of his life as a hermit in a wild valley near Siena, where his followers became known as the Williamites.</p>");
			
			var st09:String = 
				"<p><span class='imageCaptionItalic'>St Peter</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>After Raphael (1483-1520)</p>"
			+	"<p class='imageCaption'>Oil on panel, 18th century</p>"
			+	"<p class='imageCaption'>12.5 x 10.8 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A189</p>";
			var vo09:ThumbnailVO = new ThumbnailVO(containerMc.t9, Img_5_3_2_9, st09,"<p class='justified'>Simon Peter was one of a group of fishermen who became the first followers of Jesus.  Although his relationship with his Lord was not always an easy one, he was entrusted for ever with the leadership of the Christ’s followers.  This tiny painting has been copied from one of the Renaissance master Raphael’s designs for tapestries in the Sistine Chapel.</p>");
			
			var st10:String = 
				"<p><span class='imageCaptionItalic'>St Sebastian</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Moderno (1467-1528)</p>"
			+	"<p class='imageCaption'>bronze, early sixteenth century</p>"
			+	"<p class='imageCaption'>J285</p>";
			var vo10:ThumbnailVO = new ThumbnailVO(containerMc.t10, Img_5_3_2_10, st10,"<p class='justified'>St Sebastian is said to have been a Roman soldier in the third century.  He lived secretly as a Christian, until the Emperor Diocletian discovered his betrayal of Roman society and had him tied to a tree and shot full of arrows.  Although Sebastian survived the arrows, he eventually met his martyrdom by clubbing to death.  He has been invoked traditionally as a helper against the plague, which strikes its victims suddenly like an arrow.</p>");
			
			var st11:String = 
				"<p><span class='imageCaptionItalic'></span><span class='imageCaption'>Bronze figure of St Lawrence</span></p>"
			+	"<p class='imageCaption'>Venetian, about 1600 </p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne </p>"
			+	"<p class='imageCaption'>C899  </p>";
			var vo11:ThumbnailVO = new ThumbnailVO(containerMc.t11, Img_5_3_2_11, st11,"<p class='justified'>St Lawrence served as a deacon in third-century Rome.  According to tradition he was put to death for his Christian faith by being burned on a gridiron or grill.  He is therefore the patron saint of cooks and bakers.  This statuette depicts him with his gridiron but without his more traditional deacon’s robes.</p>");
			
			var st12:String = 
				"<p><span class='imageCaptionItalic'>St James</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Jacques Laudin II, (about 1663-1729)</p>"
			+	"<p class='imageCaption'>enamel, about 1700</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne </p>"
			+	"<p class='imageCaption'>C932</p>";
			var vo12:ThumbnailVO = new ThumbnailVO(containerMc.t12, Img_5_3_2_12, st12,"<p class='justified'>St James the Great was one of a group of fishermen who became the first followers of Jesus, and one of the first to be executed by the civil authorities.  He is said to have travelled to Spain, where his great shrine at Compostela has become a great place of pilgrimage.  He is therefore the patron saint of pilgrims, and is depicted here with the travelling cloak and staff of a pilgrim, and the cockle shell traditionally worn as a badge by travellers to Compostela.</p>");
			
			var st13:String = 
				"<p><span class='imageCaptionItalic'>St George and the Dragon</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>Francesco Fanelli  (1577-?1641)</p>"
			+	"<p class='imageCaption'>bronze, about 1640</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>C900</p>";
			var vo13:ThumbnailVO = new ThumbnailVO(containerMc.t13, Img_5_3_2_13, st13,"<p class='justified'>St George is a mysterious figure.  Like St Sebastian, he was said to have been a soldier under the emperor Diocletian who was martyred for his faith.  In the legend,  St George rescues of a beautiful princess from a man-eating dragon, which he kills.  The story seems to have arisen from centuries of tradition as an allegory of the power of faith over evil.</p>");		
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03,vo04,vo05,vo06,vo07,vo08,vo09,vo10,vo11,vo12,vo13];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Other Saints in the Holburne Museum ";
			var body:String = "<p class='justified'>Sir William Holburne's collection is not rich in religious imagery, but a number of saints can be found depicted among his paintings and statues.</p>";
			
			text = new TextBoxWithTitleAndDescription(title, body, AppGlobals.RIGHT_FRAME_WIDTH,180);
			addChild(text);
			positionInRightFrame(text);
			text.y = AppGlobals.RIGHT_FRAME_Y;
			text.visible = false;
			text.alpha = 0;
			
			super();
		}
		
		override public function transitionIn():void
		{
			staggerItemsIn(largeImageContainer,containerMc,text);
		}
		
		override protected function showThumbSelected():void
		{
			super.showThumbSelected();
			if(selectedThumbVO)
			{
				text.setAdditionalText(selectedThumbVO.additionalText);	
			}
		}
		
		override public function dispose():void
		{
			containerMc = null;
			super.dispose();
		}
		
	}
}
