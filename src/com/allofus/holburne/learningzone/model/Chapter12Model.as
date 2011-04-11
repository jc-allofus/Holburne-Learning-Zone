package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter12Model extends AbstractChapterModel
	{
		public function Chapter12Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"12_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Details</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Details</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"12_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>About Stephany and Dresch</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>The Early Years</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"12_3_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Other Works</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"12_3_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Royal Connection</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"12_3_3"})
				]})
			);
			
			super();
		}
		
		
	}
}
