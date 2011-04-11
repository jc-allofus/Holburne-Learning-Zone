package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter08Model extends AbstractChapterModel
	{
		public function Chapter08Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"8_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"8_2_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Other works by artist</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"8_2_2"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Painting</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Who's who?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"8_3_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>What happens next?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"8_3_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>The problem</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"8_3_3"}),
					new ButtonVO({label:"<p class='buttonLabel'>Work in progress</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"8_3_4"})
				]})
			);
			
			super();
		}
		
		
	}
}
