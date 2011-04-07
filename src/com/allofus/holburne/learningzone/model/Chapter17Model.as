package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter17Model extends AbstractChapterModel
	{
		public function Chapter17Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"17_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Looking in Detail</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Looking in Detail</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"17_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Detail of Stitching</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Detail of Stitching</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"17_3_1"})
				]})
			);
			
			super();
		}
		
		
	}
}
