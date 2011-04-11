package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter03Model extends AbstractChapterModel
	{
		public function Chapter03Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"3_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Thomas Barker</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"3_2_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>The Barker Family</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"3_2_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>What did he look like when older?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"3_2_3"}),	
					new ButtonVO({label:"<p class='buttonLabel'>Influences</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"3_2_4"})	
				]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>History</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>How did it come to Holburne</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"3_3_1"}),
				]})
			);
			
			super();
		}
		
		
	}
}
