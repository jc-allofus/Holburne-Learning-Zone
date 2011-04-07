package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter07Model extends AbstractChapterModel
	{
		public function Chapter07Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"7_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"7_2_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Influences</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"7_2_2"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Painting</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Who's who?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"7_3_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Other episodes from this story</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"7_3_2"})
				]})
			);
			
			super();
		}
		
		
	}
}
