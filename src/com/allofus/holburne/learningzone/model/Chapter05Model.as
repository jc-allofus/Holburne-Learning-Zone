package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter05Model extends AbstractChapterModel
	{
		public function Chapter05Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"5_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"5_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Painting</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>A Closer Look</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"5_3_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Other Saints in Holburne</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"5_3_2"})
					//new ButtonVO({label:"<p class='buttonLabel'>Other Monsters in Holburne</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"5_3_3"})
				]})
			);
			
			super();
		}
		
		
	}
}
