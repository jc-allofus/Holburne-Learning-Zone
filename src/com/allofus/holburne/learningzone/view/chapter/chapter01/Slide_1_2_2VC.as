package com.allofus.holburne.learningzone.view.chapter.chapter01
{
	import com.allofus.holburne.learningzone.AppGlobals;
	import com.allofus.holburne.learningzone.model.vo.ThumbnailClickedVO;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.allofus.holburne.learningzone.view.component.ThumbnailImagesSlide;
	import com.allofus.shared.logging.GetLogger;
	import com.holburne.learningzone.swcassets.Img_1_2_2_10;
	import com.holburne.learningzone.swcassets.Img_1_2_2_2;
	import com.holburne.learningzone.swcassets.Img_1_2_2_3;
	import com.holburne.learningzone.swcassets.Img_1_2_2_4;
	import com.holburne.learningzone.swcassets.Img_1_2_2_5;
	import com.holburne.learningzone.swcassets.Img_1_2_2_6;
	import com.holburne.learningzone.swcassets.Img_1_2_2_7;
	import com.holburne.learningzone.swcassets.Img_1_2_2_9;
	import com.holburne.learningzone.swcassets.Slide_1_2_2;

	import mx.logging.ILogger;

	import flash.display.Sprite;

	/**
	 * @author jc
	 */
	public class Slide_1_2_2VC extends ThumbnailImagesSlide
	{
		protected var containerMc:Slide_1_2_2;
		protected var text:TextBoxWithTitleAndDescription;
		
		public function Slide_1_2_2VC()
		{
			containerMc = new Slide_1_2_2();
			largeImageContainer = new Sprite();
			containerMc.alpha = largeImageContainer.alpha = 0;
			
			thumbnailVOs = new <ThumbnailClickedVO>
			[
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_10, Img_1_2_2_10),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_2, Img_1_2_2_2),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_3, Img_1_2_2_3),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_4, Img_1_2_2_4),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_5, Img_1_2_2_5),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_6, Img_1_2_2_6),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_7, Img_1_2_2_7),
				new ThumbnailClickedVO(containerMc.thumb_1_2_2_9, Img_1_2_2_9)
			];
			
			enableThumbs();
			addChild(containerMc);
			addChild(largeImageContainer);
			
			var title:String ="OTHER WORKS IN THE HOLBURNE COLLECTION";
			var description:String = 
				"<p class='justified'>Because of Gainsborough's importance to Bath, the Holburne has become a centre for display and study of his work in Bath.  The museum itself owns few examples of his paintings and drawings, and we are grateful to all those lenders who have allowed the Holburne to exhibit some particularly fine examples of his portraiture.</p>";
			text = new TextBoxWithTitleAndDescription(title, description, AppGlobals.RIGHT_FRAME_WIDTH);
			addChild(text);
			text.visible = false;
			text.alpha = 0;
			text.x = AppGlobals.RIGHT_FAME_X;
			text.y = AppGlobals.RIGHT_FRAME_Y;
			addChild(text);
			super();
		}
		
		override public function transitionIn():void
		{
			super.staggerItemsIn([largeImageContainer,text,containerMc]);
		}
		
		override public function dispose():void
		{
			removeChild(containerMc);
			removeChild(largeImageContainer);
			containerMc = null;
			largeImageContainer = null;
			thumbnailVOs.length = 0;
			thumbnailVOs = null;
			super.dispose();
		}
		
		
		private static const logger:ILogger = GetLogger.qualifiedName( Slide_1_2_2VC );
	}
}
