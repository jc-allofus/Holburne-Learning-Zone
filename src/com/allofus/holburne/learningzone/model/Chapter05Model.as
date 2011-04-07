package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter05Model extends AbstractChapterModel
	{
		public function Chapter05Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"5_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"5_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Painting</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>What are those strange things?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"5_3_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Other Saints in Holburne</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"5_3_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Other Monsters in Holburne</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"5_3_3"})
				]})
			);
			
			super();
		}
		
		
	}
}
