package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter01Model extends AbstractChapterModel
	{
		public function Chapter01Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"1_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Thomas Gainsborough</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>The Artist</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"1_2_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Other Work</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"1_2_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Where He Lived</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"1_2_3"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Photo of Model</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"1_2_4"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Byam Family</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"1_3"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Painting</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"1_4"})
			);
			
			super();
		}
		
		
	}
}
