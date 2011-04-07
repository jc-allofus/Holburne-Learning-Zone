package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter12Model extends AbstractChapterModel
	{
		public function Chapter12Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"12_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Details</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Details</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"12_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>About Stephany and Dresch</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>The Early Years</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"12_3_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Other Works</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"12_3_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Royal Connection</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"12_3_3"})
				]})
			);
			
			super();
		}
		
		
	}
}
