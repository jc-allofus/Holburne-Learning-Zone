package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter04Model extends AbstractChapterModel
	{
		public function Chapter04Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"4_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>A Shadowy Figure</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"4_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>A Closer Look</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>What's on the Menu?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"4_3_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Treasures of the Banquet Table</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"4_3_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Secrets</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"4_3_3"})
				]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Conservation</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>The Problem</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"4_4_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Work in Progress</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"4_4_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Did We Do the Right Thing?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"4_4_3"})
				]})
			);
			
			super();
		}
		
		
	}
}
