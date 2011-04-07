package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter10Model extends AbstractChapterModel
	{
		public function Chapter10Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"10_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"10_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Sitters</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Who are they?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"10_3_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Where did they live?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"10_3_2"})
				]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Painting</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Costumes</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"10_4_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Meanings</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"10_4_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Conversation Peices</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"10_4_3"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>The Frame</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"10_4_4"})
				]})
			);
			
			super();
		}
		
		
	}
}
