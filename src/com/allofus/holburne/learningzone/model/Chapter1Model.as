package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter1Model extends AbstractChapterModel
	{
		public function Chapter1Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"1_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Thomas Gainsborough</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"1_2_1"})
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
