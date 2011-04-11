package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter09Model extends AbstractChapterModel
	{
		public function Chapter09Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"9_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"9_2_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Other works by artist</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"9_2_2"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Painting</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>What's going on?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"9_3_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Costume, scenery, props</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"9_3_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>David Garrick</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"9_3_3"}),
					new ButtonVO({label:"<p class='buttonLabel'>Susannah Cibber</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"9_3_4"}),
					new ButtonVO({label:"<p class='buttonLabel'>Sommerset Maugham</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"9_3_5"})
				]})
			);
			
			super();
		}
		
		
	}
}
