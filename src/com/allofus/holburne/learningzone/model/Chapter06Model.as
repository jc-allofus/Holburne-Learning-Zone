package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter06Model extends AbstractChapterModel
	{
		public function Chapter06Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"6_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"6_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>What's on the Menu?</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>What's on the menu?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"6_3_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Treasures of the banquet table</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"6_3_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Secrets</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"6_3_3"})
				]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Conservation</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>The Problem</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"6_4_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Work in Progress</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"6_4_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Did we do the right thing?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"6_4_3"})
				]})
			);
			
			super();
		}
		
		
	}
}
