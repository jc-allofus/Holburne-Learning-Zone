package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author jc
	 */
	public class AbstractChapterModel extends Actor
	{
		protected var _menuVOs:Vector.<MenuButtonVO>;
		
		public function AbstractChapterModel()
		{
		}
		
		public function get menuItems():Vector.<MenuButtonVO>
		{
			return _menuVOs;
		}
	}
}
