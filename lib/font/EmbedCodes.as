package
{
	import mx.core.FontAsset;
	import flash.display.Sprite;
	import flash.system.Security;
	import flash.text.Font;
	import flash.utils.describeType;

	public class EmbedCodes extends Sprite
	{
		[Embed(source="/env/workspace_fdt/HolburneLearningZone/lib/font/Baskerville Greek Italic.ttf", mimeType="application/x-font-truetype", fontName="BaskervilleGreekItalic",  , embedAsCFF="false")] // All
		public var font0:Class;
		[Embed(source="/env/workspace_fdt/HolburneLearningZone/lib/font/Baskerville Greek.ttf", mimeType="application/x-font-truetype", fontName="BaskervilleGreek",  , embedAsCFF="false")] // All
		public var font1:Class;

		public function EmbedCodes()
		{
			FontAsset;
			Security.allowDomain("*");
			var xml:XML = describeType(this);
			for (var i:uint = 0; i < xml.variable.length(); i++)
			{
				Font.registerFont(this[xml.variable[i].@name]);
			}
		}
	}
}