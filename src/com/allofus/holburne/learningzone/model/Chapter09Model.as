package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter09Model extends AbstractChapterModel
	{
		public function Chapter09Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"9_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"9_2_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Other works by artist</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"9_2_2"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Painting</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>What's going on?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"9_3_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Costume, scenery, props</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"9_3_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>David Garrick</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"9_3_3"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Susannah Cibber</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"9_3_4"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Sommerset Maugham</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"9_3_5"})
				]})
			);
			
			super();
		}
		
		
	}
}
