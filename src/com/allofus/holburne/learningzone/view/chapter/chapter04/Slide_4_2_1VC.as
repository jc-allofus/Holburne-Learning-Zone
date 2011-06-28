package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.HotspotButtonVO;
	import com.allofus.holburne.learningzone.model.vo.PopupPanelVO;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.SingleImageWithHotspotsSlide;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter4.Img_4_2_1;
	import com.holburne.learningzone.swc.chapter4.Img_4_2_1_1;
	import com.holburne.learningzone.swc.chapter4.Img_4_2_1_2;
	import com.holburne.learningzone.swc.chapter4.Slide_4_2_1;

	import flash.display.Bitmap;


	/**
	 * @author jc
	 */
	public class Slide_4_2_1VC extends SingleImageWithHotspotsSlide
	{
		protected var containerMC:Slide_4_2_1;
		
		public function Slide_4_2_1VC()
		{
			containerMC = new Slide_4_2_1();
			
			var caption:String = 
				"<p class='imageCaptionItalic'>Still Life with Shellfish and Fruit</p>"
			+	"<p class='imageCaption'>follower of Abraham van Beyeren (about 1620-1690) </p>"
			+	"<p class='imageCaption'>Oil on canvas, 1660s</p>"
			+	"<p class='imageCaption'>87.8 x 104.2 cm</p>"
			+	"<p class='imageCaption'>Collection of Sir Thomas William Holburne</p>"
			+	"<p class='imageCaption'>A15</p>"
			;
			
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_4_2_1(0,0)), caption);
			addChild(img);
			
			var str1:String = "<p class='popupPanelTitle'>The artist’s reflection</p>";
			var str2:String = "<p class='popupPanelTitle'>Easel reflected in silver ewer</p>";
			
			pinVOs = new <HotspotButtonVO>[
				new HotspotButtonVO(containerMC.t1, new PopupPanelVO(str1, Img_4_2_1_1)),
				new HotspotButtonVO(containerMC.t2, new PopupPanelVO(str2, Img_4_2_1_2)),
			];
			
			var title:String ="A Shadowy Figure";
			var description:String = 
				"<p class='justified'>We do not know who painted this still life, but it was probably painted in the Hague around the 1660s.  It is close to the work of Abraham van Beyeren, who created many similarly rich still lifes in the 1660s. The artist is probably the shadowy figure called 'Pseudo-Simons' by art-historians because of his confusion with the Utrecht still life painter Michiel Simons (active by 1648, died 1673).</p>"
			+	"<p></p>"
			+	"<p class='justified'>Whoever he was he has included himself in the painting, reflected in the silver ewer, wearing a tall cap and sitting at an easel (to the right) under the light of a high window (to the left).</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			text.y = AppGlobals.RIGHT_FRAME_Y;
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			
			super();
			
			img.showCaption(false);
		}
		override public function transitionIn():void
		{
			containerMC.alpha = 0;
			text.alpha = 0;
			staggerItemsIn(containerMC,text);
		}
	}
}
