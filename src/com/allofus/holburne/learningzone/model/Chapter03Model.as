package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter03Model extends AbstractChapterModel
	{
		public function Chapter03Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"3_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Bruenhal Family</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Who's Who?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"3_2_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>The Family Workshop</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"3_2_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Other Bruenhal works</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"3_2_3"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Thomas Barker</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"3_3_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>The Barker Family</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"3_3_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>What did he look like when older?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"3_3_3"}),	
					new MenuButtonVO({label:"<p class='buttonLabel'>Influences</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"3_3_4"})	
				]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>History</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>How did it come to Holburne</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"3_4_1"}),
				]})
			);
			
			super();
		}
		
		
	}
}
