package
{
	import flash.display.Sprite;
	import mx.core.FontAsset;
	import flash.text.Font;

	/**
	 * @author jc
	 */
	public class LearningZoneFonts extends Sprite
	{
		
		[Embed(source="Baskerville Greek.ttf", mimeType="application/x-font-truetype", fontName="BaskervilleGreek", embedAsCFF="false")] // All
		public var BaskervilleGreek:Class;
		[Embed(source="Baskerville Greek Italic.ttf", mimeType="application/x-font-truetype", fontName="BaskervilleGreekItalic", embedAsCFF="false")] // All
		public var BaskervilleGreekItalic:Class;
		
		public function LearningZoneFonts()
		{
			super();
			FontAsset;
			registerFonts();
		}

		private function registerFonts() : void
		{
			Font.registerFont(BaskervilleGreek);
			Font.registerFont(BaskervilleGreekItalic);
			//add more if needed...
			//Font.registerFont(AnotherFontClass);
		}
	}
}
