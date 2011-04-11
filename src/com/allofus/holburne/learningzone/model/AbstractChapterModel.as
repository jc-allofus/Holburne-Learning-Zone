package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author jc
	 */
	public class AbstractChapterModel extends Actor
	{
		protected var _menuVOs:Vector.<ButtonVO>;
		
		public function AbstractChapterModel()
		{
		}
		
		public function get menuItems():Vector.<ButtonVO>
		{
			return _menuVOs;
		}
	}
}
