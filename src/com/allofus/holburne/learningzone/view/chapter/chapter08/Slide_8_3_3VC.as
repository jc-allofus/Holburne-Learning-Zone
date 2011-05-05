package com.allofus.holburne.learningzone.view.chapter.chapter08
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.holburne.learningzone.swc.chapter8.Img_8_3_3_1;
	import com.holburne.learningzone.swc.chapter8.Img_8_3_3_2;
	import com.holburne.learningzone.swc.chapter8.Img_8_3_3_3;
	import com.holburne.learningzone.swc.chapter8.Img_8_3_3_4;
	import com.holburne.learningzone.swc.chapter8.Img_8_3_3_5;
	import com.holburne.learningzone.swc.chapter8.Img_8_3_3_6;
	import com.holburne.learningzone.swc.chapter8.Slide_8_3_3;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_8_3_3VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_8_3_3;
		protected var text:TextBoxWithTitleAndDescription;

		public function Slide_8_3_3VC()
		{
			containerMc = new Slide_8_3_3();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			var vo01:ThumbnailVO = new ThumbnailVO(containerMc.t1, Img_8_3_3_1, "","<p class='justified'>Frame and painting before conservation: dirty, damaged and unstable.  On the frame, long pieces of the carved decoration are missing.</p>");
			var vo02:ThumbnailVO = new ThumbnailVO(containerMc.t2, Img_8_3_3_2, "","<p class='justified'>The varnish has lost its transparency: in some places you can’t see through it and the light just bounces off.</p>");
			var vo03:ThumbnailVO = new ThumbnailVO(containerMc.t3, Img_8_3_3_3, "","<p class='justified'>The paint is separating from the surface of its canvas and could easily flake off.  The picture has to be lined with a new piece of canvas to secure the paint.</p>");			
			var vo04:ThumbnailVO = new ThumbnailVO(containerMc.t4, Img_8_3_3_4, "","<p class='justified'>The painting during cleaning.  The original bright colours are appearing and details are revealed.</p>");			
			var vo05:ThumbnailVO = new ThumbnailVO(containerMc.t5, Img_8_3_3_5, "","<p class='justified'>Detail of the frame Long strips of ornamental moulding have cracked and dropped off.  The gilded surface is scratched, worn and flaking.</p>");			
			var vo06:ThumbnailVO = new ThumbnailVO(containerMc.t6, Img_8_3_3_6, "","<p class='justified'>NEEDS TEXT...</p>");			
			
			
			thumbnailVOs = new <ThumbnailVO>[ vo01,vo02,vo03, vo04,vo05,vo06];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);

			var title:String ="The problem";
			var description:String = 
				"<p class='justified'>Before 2011, this charming painting was never displayed because of its very fragile condition.  Now it looks almost as good as new after conservation partly funded by a generous grant of £2,000 from the Veneziana Fund.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Conservation was carried out in 2010 by the Simon Gillespie Studio in London.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH, 410);
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
		
	}
}