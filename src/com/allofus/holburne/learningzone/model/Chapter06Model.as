package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter06Model extends AbstractChapterModel
	{
		public function Chapter06Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"6_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"6_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>What's on the Menu?</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>What's on the menu?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"6_3_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Treasures of the banquet table</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"6_3_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Secrets</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"6_3_3"})
				]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Conservation</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>The Problem</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"6_4_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Work in Progress</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"6_4_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Did we do the right thing?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"6_4_3"})
				]})
			);
			
			super();
		}
		
		
	}
}
