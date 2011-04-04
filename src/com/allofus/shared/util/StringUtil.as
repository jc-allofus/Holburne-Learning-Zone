package com.allofus.shared.util
{
	/**
	 * @author jc
	 */
	public class StringUtil
	{
		public static function formatTime( value:Number ):String
		{
			var remainder:Number;
			var hours:Number;
			var minutes:Number;
			var seconds:Number;
			
			hours = value / ( 60 * 60 );
			remainder = hours - (Math.floor ( hours ));
			hours = Math.floor ( hours );
			minutes = remainder * 60;
			remainder = minutes - (Math.floor ( minutes ));
			minutes = Math.floor ( minutes );
			seconds = remainder * 60;
			remainder = seconds - (Math.floor ( seconds ));
			seconds = Math.floor ( seconds );
			
			var hString:String = hours   < 10 ? "0" + hours : "" + hours;	
			var mString:String = minutes < 10 ? "0" + minutes : "" + minutes;
			var sString:String = seconds < 10 ? "0" + seconds : "" + seconds;
						
			if ( value < 0 || isNaN(value)) 
				return "00:00";			
						
			if ( hours > 0 )
			{			
				return hString + ":" + mString + ":" + sString;
			}else
			{
				return mString + ":" + sString;
			}
		}

	}
}


