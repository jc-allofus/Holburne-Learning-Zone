package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter11Model extends AbstractChapterModel
	{
		public function Chapter11Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"11_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Works by Giambologna</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Hendrick Goltzius</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"11_2_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>The Rape of the Sabine Women</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"11_2_2"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Examples of the Crouching Venus</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Crouching Venus in the Louvre</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"11_3_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>British Collection</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"11_3_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Sir Paul Rubens</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"11_3_3"})
				]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Holburne Museum Venus</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Holburne Museum Venus</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"11_4_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Video</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"11_4_2"})
				]})
			);
			
			super();
		}
		
		
	}
}
