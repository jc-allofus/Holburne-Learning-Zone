package com.allofus.shared.util
{
	import com.allofus.holburne.learningzone.AppGlobals;

	import flash.display.DisplayObject;
	import flash.geom.Point;
	/**
	 * @author jc
	 */
	public class PositionUtil
	{
		public static function centerHorizontally(thisObject:DisplayObject, relativeTo:DisplayObject):void
		{
			thisObject.x = Math.round((relativeTo.x + (relativeTo.width * 0.5)) - (thisObject.width * 0.5));
		}
		
		public static function centerHorizontallyByVal(thisObject:DisplayObject, val:Number):void
		{
			thisObject.x = Math.round((val * 0.5) - (thisObject.width * 0.5));
		}
		
		public static function centerVertically(thisObject:DisplayObject, relativeTo:DisplayObject):void
		{
			thisObject.y = Math.round((relativeTo.y + (relativeTo.height * 0.5)) - (thisObject.height * 0.5));
		}
		
		public static function centerVerticallyByVal(thisObject:DisplayObject, val:Number):void
		{
			thisObject.y = Math.round((val * 0.5) - (thisObject.height * 0.5));
		}
		
		public static function positionUnder(thisObject:DisplayObject, underThisOne:DisplayObject, distance:Number = 0):void
		{
			thisObject.y = underThisOne.y + underThisOne.height + distance;
		}
		
		public static function positionToTheRight(thisObject:DisplayObject, toTheRightOfThisOne:DisplayObject, distance:Number = 0):void
		{
			thisObject.x = toTheRightOfThisOne.x + toTheRightOfThisOne.width + distance;
		}
		
		public static function getPositionInLeftFrame(obj:DisplayObject):Point
		{
			var tx:Number = -obj.x + ((AppGlobals.LEFT_FRAME_WIDTH * 0.5) - (obj.width * 0.5)) + AppGlobals.LEFT_FRAME_X;
			var ty:Number = -obj.y + ((AppGlobals.LEFT_FRAME_HEIGHT * 0.5) - (obj.height * 0.5)) + AppGlobals.LEFT_FRAME_Y;
			return new Point(tx, ty);
		}

		public static function getPositionInRightFrame(obj:DisplayObject) : Point
		{
			var tx:Number = -obj.x + ((AppGlobals.RIGHT_FRAME_WIDTH * 0.5) - (obj.width * 0.5)) + AppGlobals.RIGHT_FAME_X;
			var ty:Number = -obj.y + ((AppGlobals.RIGHT_FRAME_HEIGHT * 0.5) - (obj.height * 0.5)) + AppGlobals.RIGHT_FRAME_Y;
			return new Point(tx, ty);
		}
		
		public static function alignRight(thisObject : DisplayObject, alignedToTheRightOf : DisplayObject, offset:int = 0) : void
		{
			thisObject.x = Math.round(alignedToTheRightOf.x + alignedToTheRightOf.width - thisObject.width + offset);
		}

		public static function alignBottom(thisObject : DisplayObject, alignedToTheBottomOf : DisplayObject, offset:int = 0) : void
		{
			thisObject.y = Math.round(alignedToTheBottomOf.y + alignedToTheBottomOf.height - thisObject.height + offset);
		}
	}
}
