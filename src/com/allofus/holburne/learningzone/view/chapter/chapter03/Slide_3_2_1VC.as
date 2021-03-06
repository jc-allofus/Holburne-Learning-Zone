package com.allofus.holburne.learningzone.view.chapter.chapter03
{
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.view.chapter.AbstractSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.MultipageTextBox;
	import com.holburne.learningzone.swc.chapter3.Chap3IntroImage;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_3_2_1VC extends AbstractSlide
	{
		protected var img:ImageWithBorderAndCaption;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function Slide_3_2_1VC()
		{
			var caption:String = 
				"<p class='imageCaptionItalic'>Self Portrait</p>"
			+	"<p class='imageCaption'>Thomas Barker (1769-1847)</p>"
			+	"<p class='imageCaption'>Oil on canvas, about 1794</p>"
			+	"<p class='imageCaption'>78.7 x 64.6 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A102</p>";
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Chap3IntroImage(0,0)), caption);
			positionInLeftFrame(img);
			img.showCaption(false);
			addChild(img);
			
			var title:String ="Thomas Barker of Bath  (1769-1847)";
			var page1:String = 
				"<p class='justified'>Thomas was the eldest son of Benjamin Barker, an animal painter who brought his family to Bath from Pontypool in 1783.  Thomas showed precocious artistic talent and under the patronage of Charles Spackman, a local coach builder, he was encouraged to copy old masters. His fame grew rapidly; , after a period of study in Italy from 1792 and a brief stay in London, he returned to Bath in 1798.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Thomas married Priscilla Jones in 1803, and built a Greek Revival style villa, called Doric House, on the slopes of Lansdown. The villa had a thirty-foot long gallery for use as a showroom, with a huge fresco of the Massacre of Chios on one wall. Barker's studio in Doric House was just across the road from William Holburne's house in Cavendish Crescent.</p>"
			+	"<p></p>"
			+	"<p class='justified'>In 1793, Sir Edward Harington wrote: “I will venture to pronounce, as exceeding probable, that the name Barker will be at length found to revive the ancient great and beautiful taste in painting, and to do immortal honour to our country”.  That proved to be an over-optimistic forecast.  Barker failed to live up to his early promise, and although he continued to work prolifically, he died in poverty.</p>"
			;
			
			var page2:String = "<p class='justified'>In 1793, Sir Edward Harington wrote: “I will venture to pronounce, as exceeding probable, that the name Barker will be at length found to revive the ancient great and beautiful taste in painting, and to do immortal honour to our country”.  That proved to be an over-optimistic forecast.  Barker failed to live up to his early promise, and although he continued to work prolifically, he died in poverty.</p>";
			
			text = new TextBoxWithTitleAndDescription(title, page1);
			addChild(text);
			positionInRightFrame(text);
			text.visible = false;
			text.alpha = 0;
			super();
		}
		
		override public function transitionIn():void
		{
			super.staggerItemsIn(img,text);
		}
		
		override public function dispose():void
		{
			img = null;
			if(text)
				text.dispose();				
			text = null;
			super.dispose();
		}
	}
}
