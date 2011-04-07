package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter13Model extends AbstractChapterModel
	{
		public function Chapter13Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"13_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>More About the Sculpture</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Video</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"13_2_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>About Plura</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"13_2_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Pietà</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"13_2_3"})
					]})
			);
			
			super();
		}
		
		
	}
}
