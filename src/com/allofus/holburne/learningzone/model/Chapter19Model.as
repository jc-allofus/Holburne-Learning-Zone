package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter19Model extends AbstractChapterModel
	{
		public function Chapter19Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"19_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Looking in Detail</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Looking in Detail</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"19_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>About Hillerbrandt</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>About Hillerbrandt</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"19_3_1"})
				]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>How the Item is Used</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>How the Item is Used</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"19_4_1"})
				]})
			);			
			
			super();
		}
		
		
	}
}
