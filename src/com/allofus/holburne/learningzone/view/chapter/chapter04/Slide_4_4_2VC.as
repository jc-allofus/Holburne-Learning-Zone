package com.allofus.holburne.learningzone.view.chapter.chapter04
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_2_1;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_2_2;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_2_3;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_2_4;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_2_5;
	import com.holburne.learningzone.swc.chapter4.Img_4_4_2_6;
	import com.holburne.learningzone.swc.chapter4.Slide_4_4_2;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_4_4_2VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_4_4_2;

		public function Slide_4_4_2VC()
		{
			containerMc = new Slide_4_4_2();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_4_4_2_1, "","<p>Dirt is removed from the surface with water.  The varnish is removed using gentle solvents, which also remove old retouchings and overpaint.</p>");
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_4_4_2_2, "","<p>The paint surface has been cleaned.  Old cracks and losses have been filled in with an acrylic paste, ready to be painted over.  Some of the cracks may have been caused by folding the canvas.</p>");
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_4_4_2_3, "","<p>After repairs, the old tear is invisible.</p>");
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_4_4_2_4, "","<p>A wood carver makes new corners for the frame.</p>");
			var vo05:ThumbnailVO = new ThumbnailVO(containerMc.t5, Img_4_4_2_5, "","<p>The repaired frame is coated in gesso, which gives the carved wood a smooth finish.</p>");
			var vo06:ThumbnailVO = new ThumbnailVO(containerMc.t6, Img_4_4_2_6, "","<p>The whole frame is covered in new gold leaf.  Highlights of the ornament are burnished to make them shine like polished metal.</p>");		
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03,vo04,vo05,vo06];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="Work in progress";
			var page1:String = 
				"<p class='justified'>Text needed.</p>"
			+	"<p></p>"
			+	"<p class='justified'></p>"
			;
			
			text = new TextBoxWithTitleAndDescription(title, page1,AppGlobals.RIGHT_FRAME_WIDTH);
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
