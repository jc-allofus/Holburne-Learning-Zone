package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter15Model extends AbstractChapterModel
	{
		public function Chapter15Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"15_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Cup in Detail</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Details</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"15_2_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Video</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"15_2_2"})
					]})
			);

			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Other examples</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Other examples</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"15_3_1"})
					]})
			);
			
			super();
		}
		
		
	}
}
